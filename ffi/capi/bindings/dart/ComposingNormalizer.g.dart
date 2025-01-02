// generated by diplomat-tool

part of 'lib.g.dart';

/// See the [Rust documentation for `ComposingNormalizer`](https://docs.rs/icu/latest/icu/normalizer/struct.ComposingNormalizer.html) for more information.
final class ComposingNormalizer implements ffi.Finalizable {
  final ffi.Pointer<ffi.Opaque> _ffi;

  // These are "used" in the sense that they keep dependencies alive
  // ignore: unused_field
  final core.List<Object> _selfEdge;

  // This takes in a list of lifetime edges (including for &self borrows)
  // corresponding to data this may borrow from. These should be flat arrays containing
  // references to objects, and this object will hold on to them to keep them alive and
  // maintain borrow validity.
  ComposingNormalizer._fromFfi(this._ffi, this._selfEdge) {
    if (_selfEdge.isEmpty) {
      _finalizer.attach(this, _ffi.cast());
    }
  }

  static final _finalizer = ffi.NativeFinalizer(ffi.Native.addressOf(_icu4x_ComposingNormalizer_destroy_mv1));

  /// Construct a new ComposingNormalizer instance for NFC using compiled data.
  ///
  /// See the [Rust documentation for `new_nfc`](https://docs.rs/icu/latest/icu/normalizer/struct.ComposingNormalizer.html#method.new_nfc) for more information.
  factory ComposingNormalizer.nfc() {
    final result = _icu4x_ComposingNormalizer_create_nfc_mv1();
    return ComposingNormalizer._fromFfi(result, []);
  }

  /// Construct a new ComposingNormalizer instance for NFC using a particular data source.
  ///
  /// See the [Rust documentation for `new_nfc`](https://docs.rs/icu/latest/icu/normalizer/struct.ComposingNormalizer.html#method.new_nfc) for more information.
  ///
  /// Throws [DataError] on failure.
  factory ComposingNormalizer.nfcWithProvider(DataProvider provider) {
    final result = _icu4x_ComposingNormalizer_create_nfc_with_provider_mv1(provider._ffi);
    if (!result.isOk) {
      throw DataError.values[result.union.err];
    }
    return ComposingNormalizer._fromFfi(result.union.ok, []);
  }

  /// Construct a new ComposingNormalizer instance for NFKC using compiled data.
  ///
  /// See the [Rust documentation for `new_nfkc`](https://docs.rs/icu/latest/icu/normalizer/struct.ComposingNormalizer.html#method.new_nfkc) for more information.
  factory ComposingNormalizer.nfkc() {
    final result = _icu4x_ComposingNormalizer_create_nfkc_mv1();
    return ComposingNormalizer._fromFfi(result, []);
  }

  /// Construct a new ComposingNormalizer instance for NFKC using a particular data source.
  ///
  /// See the [Rust documentation for `new_nfkc`](https://docs.rs/icu/latest/icu/normalizer/struct.ComposingNormalizer.html#method.new_nfkc) for more information.
  ///
  /// Throws [DataError] on failure.
  factory ComposingNormalizer.nfkcWithProvider(DataProvider provider) {
    final result = _icu4x_ComposingNormalizer_create_nfkc_with_provider_mv1(provider._ffi);
    if (!result.isOk) {
      throw DataError.values[result.union.err];
    }
    return ComposingNormalizer._fromFfi(result.union.ok, []);
  }

  /// Normalize a string
  ///
  /// Ill-formed input is treated as if errors had been replaced with REPLACEMENT CHARACTERs according
  /// to the WHATWG Encoding Standard.
  ///
  /// See the [Rust documentation for `normalize_utf8`](https://docs.rs/icu/latest/icu/normalizer/struct.ComposingNormalizerBorrowed.html#method.normalize_utf8) for more information.
  String normalize(String s) {
    final temp = _FinalizedArena();
    final write = _Write();
    _icu4x_ComposingNormalizer_normalize_mv1(_ffi, s._utf8AllocIn(temp.arena), write._ffi);
    return write.finalize();
  }

  /// Check if a string is normalized
  ///
  /// Ill-formed input is treated as if errors had been replaced with REPLACEMENT CHARACTERs according
  /// to the WHATWG Encoding Standard.
  ///
  /// See the [Rust documentation for `is_normalized_utf16`](https://docs.rs/icu/latest/icu/normalizer/struct.ComposingNormalizerBorrowed.html#method.is_normalized_utf16) for more information.
  bool isNormalized(String s) {
    final temp = _FinalizedArena();
    final result = _icu4x_ComposingNormalizer_is_normalized_utf16_mv1(_ffi, s._utf16AllocIn(temp.arena));
    return result;
  }

  /// Return the index a slice of potentially-invalid UTF-16 is normalized up to
  ///
  /// See the [Rust documentation for `split_normalized_utf16`](https://docs.rs/icu/latest/icu/normalizer/struct.ComposingNormalizerBorrowed.html#method.split_normalized_utf16) for more information.
  ///
  /// See the [Rust documentation for `is_normalized_utf16_up_to`](https://docs.rs/icu/latest/icu/normalizer/struct.ComposingNormalizerBorrowed.html#method.is_normalized_utf16_up_to) for more information.
  int isNormalizedUpTo(String s) {
    final temp = _FinalizedArena();
    final result = _icu4x_ComposingNormalizer_is_normalized_utf16_up_to_mv1(_ffi, s._utf16AllocIn(temp.arena));
    return result;
  }
}

@meta.RecordUse()
@ffi.Native<ffi.Void Function(ffi.Pointer<ffi.Void>)>(isLeaf: true, symbol: 'icu4x_ComposingNormalizer_destroy_mv1')
// ignore: non_constant_identifier_names
external void _icu4x_ComposingNormalizer_destroy_mv1(ffi.Pointer<ffi.Void> self);

@meta.RecordUse()
@ffi.Native<ffi.Pointer<ffi.Opaque> Function()>(isLeaf: true, symbol: 'icu4x_ComposingNormalizer_create_nfc_mv1')
// ignore: non_constant_identifier_names
external ffi.Pointer<ffi.Opaque> _icu4x_ComposingNormalizer_create_nfc_mv1();

@meta.RecordUse()
@ffi.Native<_ResultOpaqueInt32 Function(ffi.Pointer<ffi.Opaque>)>(isLeaf: true, symbol: 'icu4x_ComposingNormalizer_create_nfc_with_provider_mv1')
// ignore: non_constant_identifier_names
external _ResultOpaqueInt32 _icu4x_ComposingNormalizer_create_nfc_with_provider_mv1(ffi.Pointer<ffi.Opaque> provider);

@meta.RecordUse()
@ffi.Native<ffi.Pointer<ffi.Opaque> Function()>(isLeaf: true, symbol: 'icu4x_ComposingNormalizer_create_nfkc_mv1')
// ignore: non_constant_identifier_names
external ffi.Pointer<ffi.Opaque> _icu4x_ComposingNormalizer_create_nfkc_mv1();

@meta.RecordUse()
@ffi.Native<_ResultOpaqueInt32 Function(ffi.Pointer<ffi.Opaque>)>(isLeaf: true, symbol: 'icu4x_ComposingNormalizer_create_nfkc_with_provider_mv1')
// ignore: non_constant_identifier_names
external _ResultOpaqueInt32 _icu4x_ComposingNormalizer_create_nfkc_with_provider_mv1(ffi.Pointer<ffi.Opaque> provider);

@meta.RecordUse()
@ffi.Native<ffi.Void Function(ffi.Pointer<ffi.Opaque>, _SliceUtf8, ffi.Pointer<ffi.Opaque>)>(isLeaf: true, symbol: 'icu4x_ComposingNormalizer_normalize_mv1')
// ignore: non_constant_identifier_names
external void _icu4x_ComposingNormalizer_normalize_mv1(ffi.Pointer<ffi.Opaque> self, _SliceUtf8 s, ffi.Pointer<ffi.Opaque> write);

@meta.RecordUse()
@ffi.Native<ffi.Bool Function(ffi.Pointer<ffi.Opaque>, _SliceUtf16)>(isLeaf: true, symbol: 'icu4x_ComposingNormalizer_is_normalized_utf16_mv1')
// ignore: non_constant_identifier_names
external bool _icu4x_ComposingNormalizer_is_normalized_utf16_mv1(ffi.Pointer<ffi.Opaque> self, _SliceUtf16 s);

@meta.RecordUse()
@ffi.Native<ffi.Size Function(ffi.Pointer<ffi.Opaque>, _SliceUtf16)>(isLeaf: true, symbol: 'icu4x_ComposingNormalizer_is_normalized_utf16_up_to_mv1')
// ignore: non_constant_identifier_names
external int _icu4x_ComposingNormalizer_is_normalized_utf16_up_to_mv1(ffi.Pointer<ffi.Opaque> self, _SliceUtf16 s);
