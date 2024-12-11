// generated by diplomat-tool

part of 'lib.g.dart';

/// An object that runs the ICU4X locale fallback algorithm.
///
/// See the [Rust documentation for `LocaleFallbacker`](https://docs.rs/icu/latest/icu/locale/fallback/struct.LocaleFallbacker.html) for more information.
final class LocaleFallbacker implements ffi.Finalizable {
  final ffi.Pointer<ffi.Opaque> _ffi;

  // These are "used" in the sense that they keep dependencies alive
  // ignore: unused_field
  final core.List<Object> _selfEdge;

  // This takes in a list of lifetime edges (including for &self borrows)
  // corresponding to data this may borrow from. These should be flat arrays containing
  // references to objects, and this object will hold on to them to keep them alive and
  // maintain borrow validity.
  LocaleFallbacker._fromFfi(this._ffi, this._selfEdge) {
    if (_selfEdge.isEmpty) {
      _finalizer.attach(this, _ffi.cast());
    }
  }

  static final _finalizer = ffi.NativeFinalizer(ffi.Native.addressOf(_icu4x_LocaleFallbacker_destroy_mv1));

  /// Creates a new `LocaleFallbacker` from compiled data.
  ///
  /// See the [Rust documentation for `new`](https://docs.rs/icu/latest/icu/locale/fallback/struct.LocaleFallbacker.html#method.new) for more information.
  factory LocaleFallbacker() {
    final result = _icu4x_LocaleFallbacker_create_mv1();
    return LocaleFallbacker._fromFfi(result, []);
  }

  /// Creates a new `LocaleFallbacker` from a data provider.
  ///
  /// See the [Rust documentation for `new`](https://docs.rs/icu/latest/icu/locale/fallback/struct.LocaleFallbacker.html#method.new) for more information.
  ///
  /// Throws [DataError] on failure.
  factory LocaleFallbacker.withProvider(DataProvider provider) {
    final result = _icu4x_LocaleFallbacker_create_with_provider_mv1(provider._ffi);
    if (!result.isOk) {
      throw DataError.values[result.union.err];
    }
    return LocaleFallbacker._fromFfi(result.union.ok, []);
  }

  /// Creates a new `LocaleFallbacker` without data for limited functionality.
  ///
  /// See the [Rust documentation for `new_without_data`](https://docs.rs/icu/latest/icu/locale/fallback/struct.LocaleFallbacker.html#method.new_without_data) for more information.
  factory LocaleFallbacker.withoutData() {
    final result = _icu4x_LocaleFallbacker_without_data_mv1();
    return LocaleFallbacker._fromFfi(result, []);
  }

  /// Associates this `LocaleFallbacker` with configuration options.
  ///
  /// See the [Rust documentation for `for_config`](https://docs.rs/icu/latest/icu/locale/fallback/struct.LocaleFallbacker.html#method.for_config) for more information.
  LocaleFallbackerWithConfig forConfig(LocaleFallbackConfig config) {
    final temp = _FinalizedArena();
    // This lifetime edge depends on lifetimes: 'a
    core.List<Object> aEdges = [this];
    final result = _icu4x_LocaleFallbacker_for_config_mv1(_ffi, config._toFfi(temp.arena));
    return LocaleFallbackerWithConfig._fromFfi(result, [], aEdges);
  }
}

@meta.RecordUse()
@ffi.Native<ffi.Void Function(ffi.Pointer<ffi.Void>)>(isLeaf: true, symbol: 'icu4x_LocaleFallbacker_destroy_mv1')
// ignore: non_constant_identifier_names
external void _icu4x_LocaleFallbacker_destroy_mv1(ffi.Pointer<ffi.Void> self);

@meta.RecordUse()
@ffi.Native<ffi.Pointer<ffi.Opaque> Function()>(isLeaf: true, symbol: 'icu4x_LocaleFallbacker_create_mv1')
// ignore: non_constant_identifier_names
external ffi.Pointer<ffi.Opaque> _icu4x_LocaleFallbacker_create_mv1();

@meta.RecordUse()
@ffi.Native<_ResultOpaqueInt32 Function(ffi.Pointer<ffi.Opaque>)>(isLeaf: true, symbol: 'icu4x_LocaleFallbacker_create_with_provider_mv1')
// ignore: non_constant_identifier_names
external _ResultOpaqueInt32 _icu4x_LocaleFallbacker_create_with_provider_mv1(ffi.Pointer<ffi.Opaque> provider);

@meta.RecordUse()
@ffi.Native<ffi.Pointer<ffi.Opaque> Function()>(isLeaf: true, symbol: 'icu4x_LocaleFallbacker_without_data_mv1')
// ignore: non_constant_identifier_names
external ffi.Pointer<ffi.Opaque> _icu4x_LocaleFallbacker_without_data_mv1();

@meta.RecordUse()
@ffi.Native<ffi.Pointer<ffi.Opaque> Function(ffi.Pointer<ffi.Opaque>, _LocaleFallbackConfigFfi)>(isLeaf: true, symbol: 'icu4x_LocaleFallbacker_for_config_mv1')
// ignore: non_constant_identifier_names
external ffi.Pointer<ffi.Opaque> _icu4x_LocaleFallbacker_for_config_mv1(ffi.Pointer<ffi.Opaque> self, _LocaleFallbackConfigFfi config);
