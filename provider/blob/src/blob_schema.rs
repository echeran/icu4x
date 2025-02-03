// This file is part of ICU4X. For terms of use, please see the file
// called LICENSE at the top level of the ICU4X source tree
// (online at: https://github.com/unicode-org/icu4x/blob/main/LICENSE ).

use alloc::boxed::Box;
use alloc::collections::BTreeSet;
use core::fmt::Write;
use icu_provider::{marker::DataMarkerIdHash, prelude::*};
use serde::Deserialize;
use writeable::Writeable;
use zerotrie::ZeroTrieSimpleAscii;
use zerovec::maps::ZeroMapKV;
use zerovec::vecs::{Index16, Index32, VarZeroSlice, VarZeroVec, VarZeroVecFormat, ZeroSlice};

/// A versioned Serde schema for ICU4X data blobs.
#[derive(serde::Deserialize, yoke::Yokeable)]
#[yoke(prove_covariance_manually)]
#[cfg_attr(feature = "export", derive(serde::Serialize))]
#[derive(Debug, Clone)]
pub(crate) enum BlobSchema<'data> {
    V001(NeverSchema),
    V002(NeverSchema),
    V002Bigger(NeverSchema),
    #[serde(borrow)]
    V003(BlobSchemaV3<'data, Index16>),
    #[serde(borrow)]
    V003Bigger(BlobSchemaV3<'data, Index32>),
}

// This is a valid separator as `DataLocale` will never produce it.
pub(crate) const REQUEST_SEPARATOR: char = '\x1E';
pub(crate) const CHECKSUM_KEY: &[u8] = b"\0c";

impl<'data> BlobSchema<'data> {
    pub fn deserialize_and_check<D: serde::Deserializer<'data>>(
        de: D,
    ) -> Result<BlobSchema<'data>, D::Error> {
        let blob = Self::deserialize(de)?;
        #[cfg(debug_assertions)]
        blob.check_invariants();
        Ok(blob)
    }

    pub fn load(
        &self,
        marker: DataMarkerInfo,
        req: DataRequest,
    ) -> Result<(&'data [u8], Option<u64>), DataError> {
        match self {
            BlobSchema::V001(..) | BlobSchema::V002(..) | BlobSchema::V002Bigger(..) => {
                unreachable!("Unreachable blob schema")
            }
            BlobSchema::V003(s) => s.load(marker, req),
            BlobSchema::V003Bigger(s) => s.load(marker, req),
        }
    }

    pub fn iter_ids(
        &self,
        marker: DataMarkerInfo,
    ) -> Result<BTreeSet<DataIdentifierCow>, DataError> {
        match self {
            BlobSchema::V001(..) | BlobSchema::V002(..) | BlobSchema::V002Bigger(..) => {
                unreachable!("Unreachable blob schema")
            }
            BlobSchema::V003(s) => s.iter_ids(marker),
            BlobSchema::V003Bigger(s) => s.iter_ids(marker),
        }
    }

    #[cfg(debug_assertions)]
    fn check_invariants(&self) {
        match self {
            BlobSchema::V001(..) | BlobSchema::V002(..) | BlobSchema::V002Bigger(..) => (),
            BlobSchema::V003(s) => s.check_invariants(),
            BlobSchema::V003Bigger(s) => s.check_invariants(),
        }
    }
}

#[cfg_attr(feature = "export", derive(serde::Serialize))]
#[derive(Debug, Clone, yoke::Yokeable)]
pub enum NeverSchema {}

impl<'de> serde::Deserialize<'de> for NeverSchema {
    fn deserialize<D>(_: D) -> Result<Self, D::Error>
    where
        D: serde::Deserializer<'de>,
    {
        use serde::de::Error;
        Err(D::Error::custom("Attempted to read 1.0 blob format from ICU4X 2.0: please run ICU4X 2.0 datagen to generate a new file."))
    }
}
/// Version 3 of the ICU4X data blob schema.
///
/// This itself has two modes, using [`Index16`] or [`Index32`] buffers for the locales array.
///
/// The exporter will autoupgrade to the larger buffer as needed.
#[derive(Clone, Copy, Debug, serde::Deserialize, yoke::Yokeable)]
#[yoke(prove_covariance_manually)]
#[cfg_attr(feature = "export", derive(serde::Serialize))]
#[serde(bound = "")] // Override the autogenerated `LocaleVecFormat: Serialize/Deserialize` bound
pub(crate) struct BlobSchemaV3<'data, LocaleVecFormat: VarZeroVecFormat> {
    /// Map from marker hash to locale trie.
    /// Weak invariant: should be sorted.
    #[serde(borrow)]
    pub markers: &'data ZeroSlice<DataMarkerIdHash>,
    /// Map from locale to buffer index.
    /// Weak invariant: the `usize` values are valid indices into `self.buffers`
    /// Weak invariant: there is at least one value for every integer in 0..self.buffers.len()
    /// Weak invariant: markers and locales are the same length
    // TODO: Make ZeroTrieSimpleAscii<[u8]> work when in this position.
    #[serde(borrow)]
    pub locales: &'data VarZeroSlice<[u8], LocaleVecFormat>,
    /// Vector of buffers
    #[serde(borrow)]
    pub buffers: &'data VarZeroSlice<[u8], Index32>,
}

impl<LocaleVecFormat: VarZeroVecFormat> Default for BlobSchemaV3<'_, LocaleVecFormat> {
    fn default() -> Self {
        Self {
            markers: ZeroSlice::new_empty(),
            locales: VarZeroSlice::new_empty(),
            buffers: VarZeroSlice::new_empty(),
        }
    }
}

impl<'data, LocaleVecFormat: VarZeroVecFormat> BlobSchemaV3<'data, LocaleVecFormat> {
    pub fn load(
        &self,
        marker: DataMarkerInfo,
        req: DataRequest,
    ) -> Result<(&'data [u8], Option<u64>), DataError> {
        if marker.is_singleton && !req.id.locale.is_default() {
            return Err(DataErrorKind::InvalidRequest.with_req(marker, req));
        }
        let marker_index = self
            .markers
            .binary_search(&marker.id.hashed())
            .ok()
            .ok_or_else(|| DataErrorKind::MarkerNotFound.with_req(marker, req))?;
        let zerotrie = self
            .locales
            .get(marker_index)
            .ok_or_else(|| DataError::custom("Invalid blob bytes").with_req(marker, req))?;
        let mut cursor = ZeroTrieSimpleAscii::from_store(zerotrie).into_cursor();
        let _infallible_ascii = req.id.locale.write_to(&mut cursor);
        let blob_index = if !req.id.marker_attributes.is_empty() {
            let _infallible_ascii = cursor.write_char(REQUEST_SEPARATOR);
            req.id
                .marker_attributes
                .write_to(&mut cursor)
                .map_err(|_| DataErrorKind::IdentifierNotFound.with_req(marker, req))?;
            loop {
                if let Some(v) = cursor.take_value() {
                    break Some(v);
                }
                if !req.metadata.attributes_prefix_match || cursor.probe(0).is_none() {
                    break None;
                }
            }
        } else {
            cursor.take_value()
        }
        .ok_or_else(|| DataErrorKind::IdentifierNotFound.with_req(marker, req))?;
        let buffer = self
            .buffers
            .get(blob_index)
            .ok_or_else(|| DataError::custom("Invalid blob bytes").with_req(marker, req))?;
        Ok((
            buffer,
            marker
                .has_checksum
                .then(|| self.get_checksum(zerotrie))
                .flatten(),
        ))
    }

    fn get_checksum(&self, zerotrie: &[u8]) -> Option<u64> {
        ZeroTrieSimpleAscii::from_store(zerotrie)
            .get(CHECKSUM_KEY)
            .and_then(|cs| Some(u64::from_le_bytes(self.buffers.get(cs)?.try_into().ok()?)))
    }

    pub fn iter_ids(
        &self,
        marker: DataMarkerInfo,
    ) -> Result<BTreeSet<DataIdentifierCow>, DataError> {
        let marker_index = self
            .markers
            .binary_search(&marker.id.hashed())
            .ok()
            .ok_or_else(|| DataErrorKind::MarkerNotFound.with_marker(marker))?;
        let zerotrie = self
            .locales
            .get(marker_index)
            .ok_or_else(|| DataError::custom("Invalid blob bytes").with_marker(marker))?;
        Ok(ZeroTrieSimpleAscii::from_store(zerotrie)
            .iter()
            .filter_map(|(s, _)| {
                #[allow(unused_imports)]
                use alloc::borrow::ToOwned;
                if let Some((locale, attrs)) = s.split_once(REQUEST_SEPARATOR) {
                    Some(DataIdentifierCow::from_owned(
                        DataMarkerAttributes::try_from_str(attrs).ok()?.to_owned(),
                        locale.parse().ok()?,
                    ))
                } else if s.as_bytes() == CHECKSUM_KEY {
                    None
                } else {
                    Some(DataIdentifierCow::from_locale(s.parse().ok()?))
                }
            })
            .collect())
    }

    /// Verifies the weak invariants using debug assertions
    #[cfg(debug_assertions)]
    fn check_invariants(&self) {
        if self.markers.is_empty() && self.locales.is_empty() && self.buffers.is_empty() {
            return;
        }
        debug_assert_eq!(self.markers.len(), self.locales.len());
        // Note: We could check that every index occurs at least once, but that's a more expensive
        // operation, so we will just check for the min and max index.
        let mut seen_min = self.buffers.is_empty();
        let mut seen_max = self.buffers.is_empty();
        for zerotrie in self.locales.iter() {
            for (_locale, idx) in ZeroTrieSimpleAscii::from_store(zerotrie).iter() {
                debug_assert!(idx < self.buffers.len());
                if idx == 0 {
                    seen_min = true;
                }
                if idx + 1 == self.buffers.len() {
                    seen_max = true;
                }
            }
        }
        debug_assert!(seen_min);
        debug_assert!(seen_max);
    }
}

/// This type lets us use a u32-index-format VarZeroVec with the ZeroMap2dBorrowed.
///
/// Eventually we will have a FormatSelector type that lets us do `ZeroMap<FormatSelector<K, Index32>, V>`
/// (https://github.com/unicode-org/icu4x/issues/2312)
///
/// IndexU32Borrowed isn't actually important; it's just more convenient to use make_varule to get the
/// full suite of traits instead of `#[derive(VarULE)]`. (With `#[derive(VarULE)]` we would have to manually
/// define a Serialize implementation, and that would be gnarly)
/// https://github.com/unicode-org/icu4x/issues/2310 tracks being able to do this with derive(ULE)
#[zerovec::make_varule(Index32U8)]
#[zerovec::derive(Debug)]
#[zerovec::skip_derive(ZeroMapKV)]
#[derive(Eq, PartialEq, Ord, PartialOrd, Debug, serde::Deserialize)]
#[zerovec::derive(Deserialize)]
#[cfg_attr(feature = "export", derive(serde::Serialize))]
#[cfg_attr(feature = "export", zerovec::derive(Serialize))]
pub(crate) struct Index32U8Borrowed<'a>(
    #[cfg_attr(feature = "export", serde(borrow))] pub &'a [u8],
);

impl<'a> ZeroMapKV<'a> for Index32U8 {
    type Container = VarZeroVec<'a, Index32U8, Index32>;
    type Slice = VarZeroSlice<Index32U8, Index32>;
    type GetType = Index32U8;
    type OwnedType = Box<Index32U8>;
}

impl Index32U8 {
    // Safety: Index32U8 is a transparent DST wrapper around `[u8]`, so a transmute is fine
    #[allow(dead_code)]
    pub(crate) const SENTINEL: &'static Self = unsafe { &*(&[] as *const [u8] as *const Self) };
}
