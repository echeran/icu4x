// generated by diplomat-tool

part of 'lib.g.dart';

/// An ICU4X sentence-break segmenter, capable of finding sentence breakpoints in strings.
///
/// See the [Rust documentation for `SentenceSegmenter`](https://docs.rs/icu/latest/icu/segmenter/struct.SentenceSegmenter.html) for more information.
final class SentenceSegmenter implements ffi.Finalizable {
  final ffi.Pointer<ffi.Opaque> _ffi;

  // These are "used" in the sense that they keep dependencies alive
  // ignore: unused_field
  final core.List<Object> _selfEdge;

  // This takes in a list of lifetime edges (including for &self borrows)
  // corresponding to data this may borrow from. These should be flat arrays containing
  // references to objects, and this object will hold on to them to keep them alive and
  // maintain borrow validity.
  SentenceSegmenter._fromFfi(this._ffi, this._selfEdge) {
    if (_selfEdge.isEmpty) {
      _finalizer.attach(this, _ffi.cast());
    }
  }

  static final _finalizer = ffi.NativeFinalizer(ffi.Native.addressOf(_icu4x_SentenceSegmenter_destroy_mv1));

  /// Construct an [`SentenceSegmenter`].
  ///
  /// Throws [DataError] on failure.
  static SentenceSegmenter create(DataProvider provider) {
    final result = _icu4x_SentenceSegmenter_create_mv1(provider._ffi);
    if (!result.isOk) {
      throw DataError.values[result.union.err];
    }
    return SentenceSegmenter._fromFfi(result.union.ok, []);
  }

  /// Construct an [`SentenceSegmenter`].
  ///
  /// Throws [DataError] on failure.
  factory SentenceSegmenter(DataProvider provider, Locale locale) {
    final result = _icu4x_SentenceSegmenter_create_with_content_locale_mv1(provider._ffi, locale._ffi);
    if (!result.isOk) {
      throw DataError.values[result.union.err];
    }
    return SentenceSegmenter._fromFfi(result.union.ok, []);
  }

  /// Segments a string.
  ///
  /// Ill-formed input is treated as if errors had been replaced with REPLACEMENT CHARACTERs according
  /// to the WHATWG Encoding Standard.
  ///
  /// See the [Rust documentation for `segment_utf16`](https://docs.rs/icu/latest/icu/segmenter/struct.SentenceSegmenter.html#method.segment_utf16) for more information.
  SentenceBreakIteratorUtf16 segment(String input) {
    final inputArena = _FinalizedArena();
    // This lifetime edge depends on lifetimes: 'a
    core.List<Object> aEdges = [this, inputArena];
    final result = _icu4x_SentenceSegmenter_segment_utf16_mv1(_ffi, input._utf16AllocIn(inputArena.arena));
    return SentenceBreakIteratorUtf16._fromFfi(result, [], aEdges);
  }
}

@meta.RecordUse()
@ffi.Native<ffi.Void Function(ffi.Pointer<ffi.Void>)>(isLeaf: true, symbol: 'icu4x_SentenceSegmenter_destroy_mv1')
// ignore: non_constant_identifier_names
external void _icu4x_SentenceSegmenter_destroy_mv1(ffi.Pointer<ffi.Void> self);

@meta.RecordUse()
@ffi.Native<_ResultOpaqueInt32 Function(ffi.Pointer<ffi.Opaque>)>(isLeaf: true, symbol: 'icu4x_SentenceSegmenter_create_mv1')
// ignore: non_constant_identifier_names
external _ResultOpaqueInt32 _icu4x_SentenceSegmenter_create_mv1(ffi.Pointer<ffi.Opaque> provider);

@meta.RecordUse()
@ffi.Native<_ResultOpaqueInt32 Function(ffi.Pointer<ffi.Opaque>, ffi.Pointer<ffi.Opaque>)>(isLeaf: true, symbol: 'icu4x_SentenceSegmenter_create_with_content_locale_mv1')
// ignore: non_constant_identifier_names
external _ResultOpaqueInt32 _icu4x_SentenceSegmenter_create_with_content_locale_mv1(ffi.Pointer<ffi.Opaque> provider, ffi.Pointer<ffi.Opaque> locale);

@meta.RecordUse()
@ffi.Native<ffi.Pointer<ffi.Opaque> Function(ffi.Pointer<ffi.Opaque>, _SliceUtf16)>(isLeaf: true, symbol: 'icu4x_SentenceSegmenter_segment_utf16_mv1')
// ignore: non_constant_identifier_names
external ffi.Pointer<ffi.Opaque> _icu4x_SentenceSegmenter_segment_utf16_mv1(ffi.Pointer<ffi.Opaque> self, _SliceUtf16 input);
