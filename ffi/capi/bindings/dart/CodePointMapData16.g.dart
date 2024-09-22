// generated by diplomat-tool

part of 'lib.g.dart';

/// An ICU4X Unicode Map Property object, capable of querying whether a code point (key) to obtain the Unicode property value, for a specific Unicode property.
///
/// For properties whose values fit into 16 bits.
///
/// See the [Rust documentation for `properties`](https://docs.rs/icu/latest/icu/properties/index.html) for more information.
///
/// See the [Rust documentation for `CodePointMapData`](https://docs.rs/icu/latest/icu/properties/struct.CodePointMapData.html) for more information.
///
/// See the [Rust documentation for `CodePointMapDataBorrowed`](https://docs.rs/icu/latest/icu/properties/struct.CodePointMapDataBorrowed.html) for more information.
final class CodePointMapData16 implements ffi.Finalizable {
  final ffi.Pointer<ffi.Opaque> _ffi;

  // These are "used" in the sense that they keep dependencies alive
  // ignore: unused_field
  final core.List<Object> _selfEdge;

  // This takes in a list of lifetime edges (including for &self borrows)
  // corresponding to data this may borrow from. These should be flat arrays containing
  // references to objects, and this object will hold on to them to keep them alive and
  // maintain borrow validity.
  CodePointMapData16._fromFfi(this._ffi, this._selfEdge) {
    if (_selfEdge.isEmpty) {
      _finalizer.attach(this, _ffi.cast());
    }
  }

  static final _finalizer = ffi.NativeFinalizer(ffi.Native.addressOf(_icu4x_CodePointMapData16_destroy_mv1));

  /// Gets the value for a code point.
  ///
  /// See the [Rust documentation for `get`](https://docs.rs/icu/latest/icu/properties/props/struct.CodePointMapDataBorrowed.html#method.get) for more information.
  int operator [](Rune cp) {
    final result = _icu4x_CodePointMapData16_get_mv1(_ffi, cp);
    return result;
  }

  /// Produces an iterator over ranges of code points that map to `value`
  ///
  /// See the [Rust documentation for `iter_ranges_for_value`](https://docs.rs/icu/latest/icu/properties/struct.CodePointMapDataBorrowed.html#method.iter_ranges_for_value) for more information.
  CodePointRangeIterator iterRangesForValue(int value) {
    // This lifetime edge depends on lifetimes: 'a
    core.List<Object> aEdges = [this];
    final result = _icu4x_CodePointMapData16_iter_ranges_for_value_mv1(_ffi, value);
    return CodePointRangeIterator._fromFfi(result, [], aEdges);
  }

  /// Produces an iterator over ranges of code points that do not map to `value`
  ///
  /// See the [Rust documentation for `iter_ranges_for_value_complemented`](https://docs.rs/icu/latest/icu/properties/struct.CodePointMapDataBorrowed.html#method.iter_ranges_for_value_complemented) for more information.
  CodePointRangeIterator iterRangesForValueComplemented(int value) {
    // This lifetime edge depends on lifetimes: 'a
    core.List<Object> aEdges = [this];
    final result = _icu4x_CodePointMapData16_iter_ranges_for_value_complemented_mv1(_ffi, value);
    return CodePointRangeIterator._fromFfi(result, [], aEdges);
  }

  /// Gets a [`CodePointSetData`] representing all entries in this map that map to the given value
  ///
  /// See the [Rust documentation for `get_set_for_value`](https://docs.rs/icu/latest/icu/properties/struct.CodePointMapDataBorrowed.html#method.get_set_for_value) for more information.
  CodePointSetData getSetForValue(int value) {
    final result = _icu4x_CodePointMapData16_get_set_for_value_mv1(_ffi, value);
    return CodePointSetData._fromFfi(result, []);
  }

  /// See the [Rust documentation for `Script`](https://docs.rs/icu/latest/icu/properties/props/struct.Script.html) for more information.
  ///
  /// Throws [DataError] on failure.
  factory CodePointMapData16.script(DataProvider provider) {
    final result = _icu4x_CodePointMapData16_load_script_mv1(provider._ffi);
    if (!result.isOk) {
      throw DataError.values[result.union.err];
    }
    return CodePointMapData16._fromFfi(result.union.ok, []);
  }
}

@meta.RecordUse()
@ffi.Native<ffi.Void Function(ffi.Pointer<ffi.Void>)>(isLeaf: true, symbol: 'icu4x_CodePointMapData16_destroy_mv1')
// ignore: non_constant_identifier_names
external void _icu4x_CodePointMapData16_destroy_mv1(ffi.Pointer<ffi.Void> self);

@meta.RecordUse()
@ffi.Native<ffi.Uint16 Function(ffi.Pointer<ffi.Opaque>, ffi.Uint32)>(isLeaf: true, symbol: 'icu4x_CodePointMapData16_get_mv1')
// ignore: non_constant_identifier_names
external int _icu4x_CodePointMapData16_get_mv1(ffi.Pointer<ffi.Opaque> self, Rune cp);

@meta.RecordUse()
@ffi.Native<ffi.Pointer<ffi.Opaque> Function(ffi.Pointer<ffi.Opaque>, ffi.Uint16)>(isLeaf: true, symbol: 'icu4x_CodePointMapData16_iter_ranges_for_value_mv1')
// ignore: non_constant_identifier_names
external ffi.Pointer<ffi.Opaque> _icu4x_CodePointMapData16_iter_ranges_for_value_mv1(ffi.Pointer<ffi.Opaque> self, int value);

@meta.RecordUse()
@ffi.Native<ffi.Pointer<ffi.Opaque> Function(ffi.Pointer<ffi.Opaque>, ffi.Uint16)>(isLeaf: true, symbol: 'icu4x_CodePointMapData16_iter_ranges_for_value_complemented_mv1')
// ignore: non_constant_identifier_names
external ffi.Pointer<ffi.Opaque> _icu4x_CodePointMapData16_iter_ranges_for_value_complemented_mv1(ffi.Pointer<ffi.Opaque> self, int value);

@meta.RecordUse()
@ffi.Native<ffi.Pointer<ffi.Opaque> Function(ffi.Pointer<ffi.Opaque>, ffi.Uint16)>(isLeaf: true, symbol: 'icu4x_CodePointMapData16_get_set_for_value_mv1')
// ignore: non_constant_identifier_names
external ffi.Pointer<ffi.Opaque> _icu4x_CodePointMapData16_get_set_for_value_mv1(ffi.Pointer<ffi.Opaque> self, int value);

@meta.RecordUse()
@ffi.Native<_ResultOpaqueInt32 Function(ffi.Pointer<ffi.Opaque>)>(isLeaf: true, symbol: 'icu4x_CodePointMapData16_load_script_mv1')
// ignore: non_constant_identifier_names
external _ResultOpaqueInt32 _icu4x_CodePointMapData16_load_script_mv1(ffi.Pointer<ffi.Opaque> provider);
