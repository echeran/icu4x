// generated by diplomat-tool

part of 'lib.g.dart';

/// See the [Rust documentation for `WordType`](https://docs.rs/icu/latest/icu/segmenter/enum.WordType.html) for more information.
enum SegmenterWordType {
  none,

  number,

  letter;

  /// See the [Rust documentation for `is_word_like`](https://docs.rs/icu/latest/icu/segmenter/enum.WordType.html#method.is_word_like) for more information.
  bool get isWordLike {
    final result = _icu4x_SegmenterWordType_is_word_like_mv1(index);
    return result;
  }
}

@meta.RecordUse()
@ffi.Native<ffi.Bool Function(ffi.Int32)>(isLeaf: true, symbol: 'icu4x_SegmenterWordType_is_word_like_mv1')
// ignore: non_constant_identifier_names
external bool _icu4x_SegmenterWordType_is_word_like_mv1(int self);
