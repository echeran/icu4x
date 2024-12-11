// generated by diplomat-tool

part of 'lib.g.dart';

/// An ICU4X Unicode Map Property object, capable of querying whether a code point (key) to obtain the Unicode property value, for a specific Unicode property.
///
/// For properties whose values fit into 8 bits.
///
/// See the [Rust documentation for `properties`](https://docs.rs/icu/latest/icu/properties/index.html) for more information.
///
/// See the [Rust documentation for `CodePointMapData`](https://docs.rs/icu/latest/icu/properties/struct.CodePointMapData.html) for more information.
///
/// See the [Rust documentation for `CodePointMapDataBorrowed`](https://docs.rs/icu/latest/icu/properties/struct.CodePointMapDataBorrowed.html) for more information.
final class CodePointMapData8 implements ffi.Finalizable {
  final ffi.Pointer<ffi.Opaque> _ffi;

  // These are "used" in the sense that they keep dependencies alive
  // ignore: unused_field
  final core.List<Object> _selfEdge;

  // This takes in a list of lifetime edges (including for &self borrows)
  // corresponding to data this may borrow from. These should be flat arrays containing
  // references to objects, and this object will hold on to them to keep them alive and
  // maintain borrow validity.
  CodePointMapData8._fromFfi(this._ffi, this._selfEdge) {
    if (_selfEdge.isEmpty) {
      _finalizer.attach(this, _ffi.cast());
    }
  }

  static final _finalizer = ffi.NativeFinalizer(ffi.Native.addressOf(_icu4x_CodePointMapData8_destroy_mv1));

  /// Gets the value for a code point.
  ///
  /// See the [Rust documentation for `get`](https://docs.rs/icu/latest/icu/properties/struct.CodePointMapDataBorrowed.html#method.get) for more information.
  int operator [](Rune cp) {
    final result = _icu4x_CodePointMapData8_get_mv1(_ffi, cp);
    return result;
  }

  /// Converts a general category to its corresponding mask value
  ///
  /// Nonexistent general categories will map to the empty mask
  ///
  /// See the [Rust documentation for `GeneralCategoryGroup`](https://docs.rs/icu/latest/icu/properties/props/struct.GeneralCategoryGroup.html) for more information.
  static int generalCategoryToMask(int gc) {
    final result = _icu4x_CodePointMapData8_general_category_to_mask_mv1(gc);
    return result;
  }

  /// Produces an iterator over ranges of code points that map to `value`
  ///
  /// See the [Rust documentation for `iter_ranges_for_value`](https://docs.rs/icu/latest/icu/properties/struct.CodePointMapDataBorrowed.html#method.iter_ranges_for_value) for more information.
  CodePointRangeIterator iterRangesForValue(int value) {
    // This lifetime edge depends on lifetimes: 'a
    core.List<Object> aEdges = [this];
    final result = _icu4x_CodePointMapData8_iter_ranges_for_value_mv1(_ffi, value);
    return CodePointRangeIterator._fromFfi(result, [], aEdges);
  }

  /// Produces an iterator over ranges of code points that do not map to `value`
  ///
  /// See the [Rust documentation for `iter_ranges_for_value_complemented`](https://docs.rs/icu/latest/icu/properties/struct.CodePointMapDataBorrowed.html#method.iter_ranges_for_value_complemented) for more information.
  CodePointRangeIterator iterRangesForValueComplemented(int value) {
    // This lifetime edge depends on lifetimes: 'a
    core.List<Object> aEdges = [this];
    final result = _icu4x_CodePointMapData8_iter_ranges_for_value_complemented_mv1(_ffi, value);
    return CodePointRangeIterator._fromFfi(result, [], aEdges);
  }

  /// Given a mask value (the nth bit marks property value = n), produce an iterator over ranges of code points
  /// whose property values are contained in the mask.
  ///
  /// The main mask property supported is that for General_Category, which can be obtained via `general_category_to_mask()` or
  /// by using `GeneralCategoryNameToMaskMapper`
  ///
  /// Should only be used on maps for properties with values less than 32 (like Generak_Category),
  /// other maps will have unpredictable results
  ///
  /// See the [Rust documentation for `iter_ranges_for_group`](https://docs.rs/icu/latest/icu/properties/struct.CodePointMapDataBorrowed.html#method.iter_ranges_for_group) for more information.
  CodePointRangeIterator iterRangesForMask(int mask) {
    // This lifetime edge depends on lifetimes: 'a
    core.List<Object> aEdges = [this];
    final result = _icu4x_CodePointMapData8_iter_ranges_for_mask_mv1(_ffi, mask);
    return CodePointRangeIterator._fromFfi(result, [], aEdges);
  }

  /// Gets a [`CodePointSetData`] representing all entries in this map that map to the given value
  ///
  /// See the [Rust documentation for `get_set_for_value`](https://docs.rs/icu/latest/icu/properties/struct.CodePointMapDataBorrowed.html#method.get_set_for_value) for more information.
  CodePointSetData getSetForValue(int value) {
    final result = _icu4x_CodePointMapData8_get_set_for_value_mv1(_ffi, value);
    return CodePointSetData._fromFfi(result, []);
  }

  /// See the [Rust documentation for `GeneralCategory`](https://docs.rs/icu/latest/icu/properties/props/enum.GeneralCategory.html) for more information.
  factory CodePointMapData8.generalCategory() {
    final result = _icu4x_CodePointMapData8_create_general_category_mv1();
    return CodePointMapData8._fromFfi(result, []);
  }

  /// See the [Rust documentation for `GeneralCategory`](https://docs.rs/icu/latest/icu/properties/props/enum.GeneralCategory.html) for more information.
  ///
  /// Throws [DataError] on failure.
  factory CodePointMapData8.generalCategoryWithProvider(DataProvider provider) {
    final result = _icu4x_CodePointMapData8_create_general_category_with_provider_mv1(provider._ffi);
    if (!result.isOk) {
      throw DataError.values[result.union.err];
    }
    return CodePointMapData8._fromFfi(result.union.ok, []);
  }

  /// See the [Rust documentation for `BidiClass`](https://docs.rs/icu/latest/icu/properties/props/struct.BidiClass.html) for more information.
  factory CodePointMapData8.bidiClass() {
    final result = _icu4x_CodePointMapData8_create_bidi_class_mv1();
    return CodePointMapData8._fromFfi(result, []);
  }

  /// See the [Rust documentation for `BidiClass`](https://docs.rs/icu/latest/icu/properties/props/struct.BidiClass.html) for more information.
  ///
  /// Throws [DataError] on failure.
  factory CodePointMapData8.bidiClassWithProvider(DataProvider provider) {
    final result = _icu4x_CodePointMapData8_create_bidi_class_with_provider_mv1(provider._ffi);
    if (!result.isOk) {
      throw DataError.values[result.union.err];
    }
    return CodePointMapData8._fromFfi(result.union.ok, []);
  }

  /// See the [Rust documentation for `EastAsianWidth`](https://docs.rs/icu/latest/icu/properties/props/struct.EastAsianWidth.html) for more information.
  factory CodePointMapData8.eastAsianWidth() {
    final result = _icu4x_CodePointMapData8_create_east_asian_width_mv1();
    return CodePointMapData8._fromFfi(result, []);
  }

  /// See the [Rust documentation for `EastAsianWidth`](https://docs.rs/icu/latest/icu/properties/props/struct.EastAsianWidth.html) for more information.
  ///
  /// Throws [DataError] on failure.
  factory CodePointMapData8.eastAsianWidthWithProvider(DataProvider provider) {
    final result = _icu4x_CodePointMapData8_create_east_asian_width_with_provider_mv1(provider._ffi);
    if (!result.isOk) {
      throw DataError.values[result.union.err];
    }
    return CodePointMapData8._fromFfi(result.union.ok, []);
  }

  /// See the [Rust documentation for `HangulSyllableType`](https://docs.rs/icu/latest/icu/properties/props/struct.HangulSyllableType.html) for more information.
  factory CodePointMapData8.hangulSyllableType() {
    final result = _icu4x_CodePointMapData8_create_hangul_syllable_type_mv1();
    return CodePointMapData8._fromFfi(result, []);
  }

  /// See the [Rust documentation for `HangulSyllableType`](https://docs.rs/icu/latest/icu/properties/props/struct.HangulSyllableType.html) for more information.
  ///
  /// Throws [DataError] on failure.
  factory CodePointMapData8.hangulSyllableTypeWithProvider(DataProvider provider) {
    final result = _icu4x_CodePointMapData8_create_hangul_syllable_type_with_provider_mv1(provider._ffi);
    if (!result.isOk) {
      throw DataError.values[result.union.err];
    }
    return CodePointMapData8._fromFfi(result.union.ok, []);
  }

  /// See the [Rust documentation for `IndicSyllabicCategory`](https://docs.rs/icu/latest/icu/properties/props/struct.IndicSyllabicCategory.html) for more information.
  factory CodePointMapData8.indicSyllabicCategory() {
    final result = _icu4x_CodePointMapData8_create_indic_syllabic_category_mv1();
    return CodePointMapData8._fromFfi(result, []);
  }

  /// See the [Rust documentation for `IndicSyllabicCategory`](https://docs.rs/icu/latest/icu/properties/props/struct.IndicSyllabicCategory.html) for more information.
  ///
  /// Throws [DataError] on failure.
  factory CodePointMapData8.indicSyllabicCategoryWithProvider(DataProvider provider) {
    final result = _icu4x_CodePointMapData8_create_indic_syllabic_category_with_provider_mv1(provider._ffi);
    if (!result.isOk) {
      throw DataError.values[result.union.err];
    }
    return CodePointMapData8._fromFfi(result.union.ok, []);
  }

  /// See the [Rust documentation for `LineBreak`](https://docs.rs/icu/latest/icu/properties/props/struct.LineBreak.html) for more information.
  factory CodePointMapData8.lineBreak() {
    final result = _icu4x_CodePointMapData8_create_line_break_mv1();
    return CodePointMapData8._fromFfi(result, []);
  }

  /// See the [Rust documentation for `LineBreak`](https://docs.rs/icu/latest/icu/properties/props/struct.LineBreak.html) for more information.
  ///
  /// Throws [DataError] on failure.
  factory CodePointMapData8.lineBreakWithProvider(DataProvider provider) {
    final result = _icu4x_CodePointMapData8_create_line_break_with_provider_mv1(provider._ffi);
    if (!result.isOk) {
      throw DataError.values[result.union.err];
    }
    return CodePointMapData8._fromFfi(result.union.ok, []);
  }

  /// See the [Rust documentation for `GraphemeClusterBreak`](https://docs.rs/icu/latest/icu/properties/props/struct.GraphemeClusterBreak.html) for more information.
  factory CodePointMapData8.graphemeClusterBreak() {
    final result = _icu4x_CodePointMapData8_create_grapheme_cluster_break_mv1();
    return CodePointMapData8._fromFfi(result, []);
  }

  /// See the [Rust documentation for `GraphemeClusterBreak`](https://docs.rs/icu/latest/icu/properties/props/struct.GraphemeClusterBreak.html) for more information.
  ///
  /// Throws [DataError] on failure.
  factory CodePointMapData8.graphemeClusterBreakWithProvider(DataProvider provider) {
    final result = _icu4x_CodePointMapData8_create_grapheme_cluster_break_with_provider_mv1(provider._ffi);
    if (!result.isOk) {
      throw DataError.values[result.union.err];
    }
    return CodePointMapData8._fromFfi(result.union.ok, []);
  }

  /// See the [Rust documentation for `WordBreak`](https://docs.rs/icu/latest/icu/properties/props/struct.WordBreak.html) for more information.
  factory CodePointMapData8.wordBreak() {
    final result = _icu4x_CodePointMapData8_create_word_break_mv1();
    return CodePointMapData8._fromFfi(result, []);
  }

  /// See the [Rust documentation for `WordBreak`](https://docs.rs/icu/latest/icu/properties/props/struct.WordBreak.html) for more information.
  ///
  /// Throws [DataError] on failure.
  factory CodePointMapData8.wordBreakWithProvider(DataProvider provider) {
    final result = _icu4x_CodePointMapData8_create_word_break_with_provider_mv1(provider._ffi);
    if (!result.isOk) {
      throw DataError.values[result.union.err];
    }
    return CodePointMapData8._fromFfi(result.union.ok, []);
  }

  /// See the [Rust documentation for `SentenceBreak`](https://docs.rs/icu/latest/icu/properties/props/struct.SentenceBreak.html) for more information.
  factory CodePointMapData8.sentenceBreak() {
    final result = _icu4x_CodePointMapData8_create_sentence_break_mv1();
    return CodePointMapData8._fromFfi(result, []);
  }

  /// See the [Rust documentation for `SentenceBreak`](https://docs.rs/icu/latest/icu/properties/props/struct.SentenceBreak.html) for more information.
  ///
  /// Throws [DataError] on failure.
  factory CodePointMapData8.sentenceBreakWithProvider(DataProvider provider) {
    final result = _icu4x_CodePointMapData8_create_sentence_break_with_provider_mv1(provider._ffi);
    if (!result.isOk) {
      throw DataError.values[result.union.err];
    }
    return CodePointMapData8._fromFfi(result.union.ok, []);
  }

  /// See the [Rust documentation for `JoiningType`](https://docs.rs/icu/latest/icu/properties/props/struct.JoiningType.html) for more information.
  factory CodePointMapData8.joiningType() {
    final result = _icu4x_CodePointMapData8_create_joining_type_mv1();
    return CodePointMapData8._fromFfi(result, []);
  }

  /// See the [Rust documentation for `JoiningType`](https://docs.rs/icu/latest/icu/properties/props/struct.JoiningType.html) for more information.
  ///
  /// Throws [DataError] on failure.
  factory CodePointMapData8.joiningTypeWithProvider(DataProvider provider) {
    final result = _icu4x_CodePointMapData8_create_joining_type_with_provider_mv1(provider._ffi);
    if (!result.isOk) {
      throw DataError.values[result.union.err];
    }
    return CodePointMapData8._fromFfi(result.union.ok, []);
  }

  /// See the [Rust documentation for `CanonicalCombiningClass`](https://docs.rs/icu/latest/icu/properties/props/struct.CanonicalCombiningClass.html) for more information.
  factory CodePointMapData8.canonicalCombiningClass() {
    final result = _icu4x_CodePointMapData8_create_canonical_combining_class_mv1();
    return CodePointMapData8._fromFfi(result, []);
  }

  /// See the [Rust documentation for `CanonicalCombiningClass`](https://docs.rs/icu/latest/icu/properties/props/struct.CanonicalCombiningClass.html) for more information.
  ///
  /// Throws [DataError] on failure.
  factory CodePointMapData8.canonicalCombiningClassWithProvider(DataProvider provider) {
    final result = _icu4x_CodePointMapData8_create_canonical_combining_class_with_provider_mv1(provider._ffi);
    if (!result.isOk) {
      throw DataError.values[result.union.err];
    }
    return CodePointMapData8._fromFfi(result.union.ok, []);
  }
}

@meta.RecordUse()
@ffi.Native<ffi.Void Function(ffi.Pointer<ffi.Void>)>(isLeaf: true, symbol: 'icu4x_CodePointMapData8_destroy_mv1')
// ignore: non_constant_identifier_names
external void _icu4x_CodePointMapData8_destroy_mv1(ffi.Pointer<ffi.Void> self);

@meta.RecordUse()
@ffi.Native<ffi.Uint8 Function(ffi.Pointer<ffi.Opaque>, ffi.Uint32)>(isLeaf: true, symbol: 'icu4x_CodePointMapData8_get_mv1')
// ignore: non_constant_identifier_names
external int _icu4x_CodePointMapData8_get_mv1(ffi.Pointer<ffi.Opaque> self, Rune cp);

@meta.RecordUse()
@ffi.Native<ffi.Uint32 Function(ffi.Uint8)>(isLeaf: true, symbol: 'icu4x_CodePointMapData8_general_category_to_mask_mv1')
// ignore: non_constant_identifier_names
external int _icu4x_CodePointMapData8_general_category_to_mask_mv1(int gc);

@meta.RecordUse()
@ffi.Native<ffi.Pointer<ffi.Opaque> Function(ffi.Pointer<ffi.Opaque>, ffi.Uint8)>(isLeaf: true, symbol: 'icu4x_CodePointMapData8_iter_ranges_for_value_mv1')
// ignore: non_constant_identifier_names
external ffi.Pointer<ffi.Opaque> _icu4x_CodePointMapData8_iter_ranges_for_value_mv1(ffi.Pointer<ffi.Opaque> self, int value);

@meta.RecordUse()
@ffi.Native<ffi.Pointer<ffi.Opaque> Function(ffi.Pointer<ffi.Opaque>, ffi.Uint8)>(isLeaf: true, symbol: 'icu4x_CodePointMapData8_iter_ranges_for_value_complemented_mv1')
// ignore: non_constant_identifier_names
external ffi.Pointer<ffi.Opaque> _icu4x_CodePointMapData8_iter_ranges_for_value_complemented_mv1(ffi.Pointer<ffi.Opaque> self, int value);

@meta.RecordUse()
@ffi.Native<ffi.Pointer<ffi.Opaque> Function(ffi.Pointer<ffi.Opaque>, ffi.Uint32)>(isLeaf: true, symbol: 'icu4x_CodePointMapData8_iter_ranges_for_mask_mv1')
// ignore: non_constant_identifier_names
external ffi.Pointer<ffi.Opaque> _icu4x_CodePointMapData8_iter_ranges_for_mask_mv1(ffi.Pointer<ffi.Opaque> self, int mask);

@meta.RecordUse()
@ffi.Native<ffi.Pointer<ffi.Opaque> Function(ffi.Pointer<ffi.Opaque>, ffi.Uint8)>(isLeaf: true, symbol: 'icu4x_CodePointMapData8_get_set_for_value_mv1')
// ignore: non_constant_identifier_names
external ffi.Pointer<ffi.Opaque> _icu4x_CodePointMapData8_get_set_for_value_mv1(ffi.Pointer<ffi.Opaque> self, int value);

@meta.RecordUse()
@ffi.Native<ffi.Pointer<ffi.Opaque> Function()>(isLeaf: true, symbol: 'icu4x_CodePointMapData8_create_general_category_mv1')
// ignore: non_constant_identifier_names
external ffi.Pointer<ffi.Opaque> _icu4x_CodePointMapData8_create_general_category_mv1();

@meta.RecordUse()
@ffi.Native<_ResultOpaqueInt32 Function(ffi.Pointer<ffi.Opaque>)>(isLeaf: true, symbol: 'icu4x_CodePointMapData8_create_general_category_with_provider_mv1')
// ignore: non_constant_identifier_names
external _ResultOpaqueInt32 _icu4x_CodePointMapData8_create_general_category_with_provider_mv1(ffi.Pointer<ffi.Opaque> provider);

@meta.RecordUse()
@ffi.Native<ffi.Pointer<ffi.Opaque> Function()>(isLeaf: true, symbol: 'icu4x_CodePointMapData8_create_bidi_class_mv1')
// ignore: non_constant_identifier_names
external ffi.Pointer<ffi.Opaque> _icu4x_CodePointMapData8_create_bidi_class_mv1();

@meta.RecordUse()
@ffi.Native<_ResultOpaqueInt32 Function(ffi.Pointer<ffi.Opaque>)>(isLeaf: true, symbol: 'icu4x_CodePointMapData8_create_bidi_class_with_provider_mv1')
// ignore: non_constant_identifier_names
external _ResultOpaqueInt32 _icu4x_CodePointMapData8_create_bidi_class_with_provider_mv1(ffi.Pointer<ffi.Opaque> provider);

@meta.RecordUse()
@ffi.Native<ffi.Pointer<ffi.Opaque> Function()>(isLeaf: true, symbol: 'icu4x_CodePointMapData8_create_east_asian_width_mv1')
// ignore: non_constant_identifier_names
external ffi.Pointer<ffi.Opaque> _icu4x_CodePointMapData8_create_east_asian_width_mv1();

@meta.RecordUse()
@ffi.Native<_ResultOpaqueInt32 Function(ffi.Pointer<ffi.Opaque>)>(isLeaf: true, symbol: 'icu4x_CodePointMapData8_create_east_asian_width_with_provider_mv1')
// ignore: non_constant_identifier_names
external _ResultOpaqueInt32 _icu4x_CodePointMapData8_create_east_asian_width_with_provider_mv1(ffi.Pointer<ffi.Opaque> provider);

@meta.RecordUse()
@ffi.Native<ffi.Pointer<ffi.Opaque> Function()>(isLeaf: true, symbol: 'icu4x_CodePointMapData8_create_hangul_syllable_type_mv1')
// ignore: non_constant_identifier_names
external ffi.Pointer<ffi.Opaque> _icu4x_CodePointMapData8_create_hangul_syllable_type_mv1();

@meta.RecordUse()
@ffi.Native<_ResultOpaqueInt32 Function(ffi.Pointer<ffi.Opaque>)>(isLeaf: true, symbol: 'icu4x_CodePointMapData8_create_hangul_syllable_type_with_provider_mv1')
// ignore: non_constant_identifier_names
external _ResultOpaqueInt32 _icu4x_CodePointMapData8_create_hangul_syllable_type_with_provider_mv1(ffi.Pointer<ffi.Opaque> provider);

@meta.RecordUse()
@ffi.Native<ffi.Pointer<ffi.Opaque> Function()>(isLeaf: true, symbol: 'icu4x_CodePointMapData8_create_indic_syllabic_category_mv1')
// ignore: non_constant_identifier_names
external ffi.Pointer<ffi.Opaque> _icu4x_CodePointMapData8_create_indic_syllabic_category_mv1();

@meta.RecordUse()
@ffi.Native<_ResultOpaqueInt32 Function(ffi.Pointer<ffi.Opaque>)>(isLeaf: true, symbol: 'icu4x_CodePointMapData8_create_indic_syllabic_category_with_provider_mv1')
// ignore: non_constant_identifier_names
external _ResultOpaqueInt32 _icu4x_CodePointMapData8_create_indic_syllabic_category_with_provider_mv1(ffi.Pointer<ffi.Opaque> provider);

@meta.RecordUse()
@ffi.Native<ffi.Pointer<ffi.Opaque> Function()>(isLeaf: true, symbol: 'icu4x_CodePointMapData8_create_line_break_mv1')
// ignore: non_constant_identifier_names
external ffi.Pointer<ffi.Opaque> _icu4x_CodePointMapData8_create_line_break_mv1();

@meta.RecordUse()
@ffi.Native<_ResultOpaqueInt32 Function(ffi.Pointer<ffi.Opaque>)>(isLeaf: true, symbol: 'icu4x_CodePointMapData8_create_line_break_with_provider_mv1')
// ignore: non_constant_identifier_names
external _ResultOpaqueInt32 _icu4x_CodePointMapData8_create_line_break_with_provider_mv1(ffi.Pointer<ffi.Opaque> provider);

@meta.RecordUse()
@ffi.Native<ffi.Pointer<ffi.Opaque> Function()>(isLeaf: true, symbol: 'icu4x_CodePointMapData8_create_grapheme_cluster_break_mv1')
// ignore: non_constant_identifier_names
external ffi.Pointer<ffi.Opaque> _icu4x_CodePointMapData8_create_grapheme_cluster_break_mv1();

@meta.RecordUse()
@ffi.Native<_ResultOpaqueInt32 Function(ffi.Pointer<ffi.Opaque>)>(isLeaf: true, symbol: 'icu4x_CodePointMapData8_create_grapheme_cluster_break_with_provider_mv1')
// ignore: non_constant_identifier_names
external _ResultOpaqueInt32 _icu4x_CodePointMapData8_create_grapheme_cluster_break_with_provider_mv1(ffi.Pointer<ffi.Opaque> provider);

@meta.RecordUse()
@ffi.Native<ffi.Pointer<ffi.Opaque> Function()>(isLeaf: true, symbol: 'icu4x_CodePointMapData8_create_word_break_mv1')
// ignore: non_constant_identifier_names
external ffi.Pointer<ffi.Opaque> _icu4x_CodePointMapData8_create_word_break_mv1();

@meta.RecordUse()
@ffi.Native<_ResultOpaqueInt32 Function(ffi.Pointer<ffi.Opaque>)>(isLeaf: true, symbol: 'icu4x_CodePointMapData8_create_word_break_with_provider_mv1')
// ignore: non_constant_identifier_names
external _ResultOpaqueInt32 _icu4x_CodePointMapData8_create_word_break_with_provider_mv1(ffi.Pointer<ffi.Opaque> provider);

@meta.RecordUse()
@ffi.Native<ffi.Pointer<ffi.Opaque> Function()>(isLeaf: true, symbol: 'icu4x_CodePointMapData8_create_sentence_break_mv1')
// ignore: non_constant_identifier_names
external ffi.Pointer<ffi.Opaque> _icu4x_CodePointMapData8_create_sentence_break_mv1();

@meta.RecordUse()
@ffi.Native<_ResultOpaqueInt32 Function(ffi.Pointer<ffi.Opaque>)>(isLeaf: true, symbol: 'icu4x_CodePointMapData8_create_sentence_break_with_provider_mv1')
// ignore: non_constant_identifier_names
external _ResultOpaqueInt32 _icu4x_CodePointMapData8_create_sentence_break_with_provider_mv1(ffi.Pointer<ffi.Opaque> provider);

@meta.RecordUse()
@ffi.Native<ffi.Pointer<ffi.Opaque> Function()>(isLeaf: true, symbol: 'icu4x_CodePointMapData8_create_joining_type_mv1')
// ignore: non_constant_identifier_names
external ffi.Pointer<ffi.Opaque> _icu4x_CodePointMapData8_create_joining_type_mv1();

@meta.RecordUse()
@ffi.Native<_ResultOpaqueInt32 Function(ffi.Pointer<ffi.Opaque>)>(isLeaf: true, symbol: 'icu4x_CodePointMapData8_create_joining_type_with_provider_mv1')
// ignore: non_constant_identifier_names
external _ResultOpaqueInt32 _icu4x_CodePointMapData8_create_joining_type_with_provider_mv1(ffi.Pointer<ffi.Opaque> provider);

@meta.RecordUse()
@ffi.Native<ffi.Pointer<ffi.Opaque> Function()>(isLeaf: true, symbol: 'icu4x_CodePointMapData8_create_canonical_combining_class_mv1')
// ignore: non_constant_identifier_names
external ffi.Pointer<ffi.Opaque> _icu4x_CodePointMapData8_create_canonical_combining_class_mv1();

@meta.RecordUse()
@ffi.Native<_ResultOpaqueInt32 Function(ffi.Pointer<ffi.Opaque>)>(isLeaf: true, symbol: 'icu4x_CodePointMapData8_create_canonical_combining_class_with_provider_mv1')
// ignore: non_constant_identifier_names
external _ResultOpaqueInt32 _icu4x_CodePointMapData8_create_canonical_combining_class_with_provider_mv1(ffi.Pointer<ffi.Opaque> provider);
