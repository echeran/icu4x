// generated by diplomat-tool

part of 'lib.g.dart';

/// An ICU4X Fixed Decimal Format object, capable of formatting a [`FixedDecimal`] as a string.
///
/// See the [Rust documentation for `FixedDecimalFormatter`](https://docs.rs/icu/latest/icu/decimal/struct.FixedDecimalFormatter.html) for more information.
final class FixedDecimalFormatter implements ffi.Finalizable {
  final ffi.Pointer<ffi.Opaque> _ffi;

  // These are "used" in the sense that they keep dependencies alive
  // ignore: unused_field
  final core.List<Object> _selfEdge;

  // This takes in a list of lifetime edges (including for &self borrows)
  // corresponding to data this may borrow from. These should be flat arrays containing
  // references to objects, and this object will hold on to them to keep them alive and
  // maintain borrow validity.
  FixedDecimalFormatter._fromFfi(this._ffi, this._selfEdge) {
    if (_selfEdge.isEmpty) {
      _finalizer.attach(this, _ffi.cast());
    }
  }

  static final _finalizer = ffi.NativeFinalizer(ffi.Native.addressOf(_icu4x_FixedDecimalFormatter_destroy_mv1));

  /// Creates a new [`FixedDecimalFormatter`] from locale data.
  ///
  /// See the [Rust documentation for `try_new`](https://docs.rs/icu/latest/icu/decimal/struct.FixedDecimalFormatter.html#method.try_new) for more information.
  ///
  /// Throws [DataError] on failure.
  factory FixedDecimalFormatter.withGroupingStrategy(DataProvider provider, Locale locale, FixedDecimalGroupingStrategy? groupingStrategy) {
    final result = _icu4x_FixedDecimalFormatter_create_with_grouping_strategy_mv1(provider._ffi, locale._ffi, groupingStrategy != null ? _ResultInt32Void.ok(groupingStrategy.index) : _ResultInt32Void.err());
    if (!result.isOk) {
      throw DataError.values[result.union.err];
    }
    return FixedDecimalFormatter._fromFfi(result.union.ok, []);
  }

  /// Creates a new [`FixedDecimalFormatter`] from preconstructed locale data.
  ///
  /// See the [Rust documentation for `DecimalSymbolsV2`](https://docs.rs/icu/latest/icu/decimal/provider/struct.DecimalSymbolsV2.html) for more information.
  ///
  /// Throws [DataError] on failure.
  static FixedDecimalFormatter createWithManualData(String plusSignPrefix, String plusSignSuffix, String minusSignPrefix, String minusSignSuffix, String decimalSeparator, String groupingSeparator, int primaryGroupSize, int secondaryGroupSize, int minGroupSize, core.List<Rune> digits, FixedDecimalGroupingStrategy? groupingStrategy) {
    final temp = _FinalizedArena();
    final result = _icu4x_FixedDecimalFormatter_create_with_manual_data_mv1(plusSignPrefix._utf8AllocIn(temp.arena), plusSignSuffix._utf8AllocIn(temp.arena), minusSignPrefix._utf8AllocIn(temp.arena), minusSignSuffix._utf8AllocIn(temp.arena), decimalSeparator._utf8AllocIn(temp.arena), groupingSeparator._utf8AllocIn(temp.arena), primaryGroupSize, secondaryGroupSize, minGroupSize, digits._uint32AllocIn(temp.arena), groupingStrategy != null ? _ResultInt32Void.ok(groupingStrategy.index) : _ResultInt32Void.err());
    if (!result.isOk) {
      throw DataError.values[result.union.err];
    }
    return FixedDecimalFormatter._fromFfi(result.union.ok, []);
  }

  /// Formats a [`FixedDecimal`] to a string.
  ///
  /// See the [Rust documentation for `format`](https://docs.rs/icu/latest/icu/decimal/struct.FixedDecimalFormatter.html#method.format) for more information.
  String format(FixedDecimal value) {
    final write = _Write();
    _icu4x_FixedDecimalFormatter_format_mv1(_ffi, value._ffi, write._ffi);
    return write.finalize();
  }
}

@meta.RecordUse()
@ffi.Native<ffi.Void Function(ffi.Pointer<ffi.Void>)>(isLeaf: true, symbol: 'icu4x_FixedDecimalFormatter_destroy_mv1')
// ignore: non_constant_identifier_names
external void _icu4x_FixedDecimalFormatter_destroy_mv1(ffi.Pointer<ffi.Void> self);

@meta.RecordUse()
@ffi.Native<_ResultOpaqueInt32 Function(ffi.Pointer<ffi.Opaque>, ffi.Pointer<ffi.Opaque>, _ResultInt32Void)>(isLeaf: true, symbol: 'icu4x_FixedDecimalFormatter_create_with_grouping_strategy_mv1')
// ignore: non_constant_identifier_names
external _ResultOpaqueInt32 _icu4x_FixedDecimalFormatter_create_with_grouping_strategy_mv1(ffi.Pointer<ffi.Opaque> provider, ffi.Pointer<ffi.Opaque> locale, _ResultInt32Void groupingStrategy);

@meta.RecordUse()
@ffi.Native<_ResultOpaqueInt32 Function(_SliceUtf8, _SliceUtf8, _SliceUtf8, _SliceUtf8, _SliceUtf8, _SliceUtf8, ffi.Uint8, ffi.Uint8, ffi.Uint8, _SliceRune, _ResultInt32Void)>(isLeaf: true, symbol: 'icu4x_FixedDecimalFormatter_create_with_manual_data_mv1')
// ignore: non_constant_identifier_names
external _ResultOpaqueInt32 _icu4x_FixedDecimalFormatter_create_with_manual_data_mv1(_SliceUtf8 plusSignPrefix, _SliceUtf8 plusSignSuffix, _SliceUtf8 minusSignPrefix, _SliceUtf8 minusSignSuffix, _SliceUtf8 decimalSeparator, _SliceUtf8 groupingSeparator, int primaryGroupSize, int secondaryGroupSize, int minGroupSize, _SliceRune digits, _ResultInt32Void groupingStrategy);

@meta.RecordUse()
@ffi.Native<ffi.Void Function(ffi.Pointer<ffi.Opaque>, ffi.Pointer<ffi.Opaque>, ffi.Pointer<ffi.Opaque>)>(isLeaf: true, symbol: 'icu4x_FixedDecimalFormatter_format_mv1')
// ignore: non_constant_identifier_names
external void _icu4x_FixedDecimalFormatter_format_mv1(ffi.Pointer<ffi.Opaque> self, ffi.Pointer<ffi.Opaque> value, ffi.Pointer<ffi.Opaque> write);
