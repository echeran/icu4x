// generated by diplomat-tool

part of 'lib.g.dart';

/// See the [Rust documentation for `LocaleDirectionality`](https://docs.rs/icu/latest/icu/locale/struct.LocaleDirectionality.html) for more information.
final class LocaleDirectionality implements ffi.Finalizable {
  final ffi.Pointer<ffi.Opaque> _ffi;

  // These are "used" in the sense that they keep dependencies alive
  // ignore: unused_field
  final core.List<Object> _selfEdge;

  // This takes in a list of lifetime edges (including for &self borrows)
  // corresponding to data this may borrow from. These should be flat arrays containing
  // references to objects, and this object will hold on to them to keep them alive and
  // maintain borrow validity.
  LocaleDirectionality._fromFfi(this._ffi, this._selfEdge) {
    if (_selfEdge.isEmpty) {
      _finalizer.attach(this, _ffi.cast());
    }
  }

  static final _finalizer = ffi.NativeFinalizer(ffi.Native.addressOf(_icu4x_LocaleDirectionality_destroy_mv1));

  /// Construct a new LocaleDirectionality instance using compiled data.
  ///
  /// See the [Rust documentation for `new`](https://docs.rs/icu/latest/icu/locale/struct.LocaleDirectionality.html#method.new) for more information.
  factory LocaleDirectionality() {
    final result = _icu4x_LocaleDirectionality_create_mv1();
    return LocaleDirectionality._fromFfi(result, []);
  }

  /// Construct a new LocaleDirectionality instance using a particular data source.
  ///
  /// See the [Rust documentation for `new`](https://docs.rs/icu/latest/icu/locale/struct.LocaleDirectionality.html#method.new) for more information.
  ///
  /// Throws [DataError] on failure.
  factory LocaleDirectionality.withProvider(DataProvider provider) {
    final result = _icu4x_LocaleDirectionality_create_with_provider_mv1(provider._ffi);
    if (!result.isOk) {
      throw DataError.values[result.union.err];
    }
    return LocaleDirectionality._fromFfi(result.union.ok, []);
  }

  /// Construct a new LocaleDirectionality instance with a custom expander and compiled data.
  ///
  /// See the [Rust documentation for `new_with_expander`](https://docs.rs/icu/latest/icu/locale/struct.LocaleDirectionality.html#method.new_with_expander) for more information.
  factory LocaleDirectionality.withExpander(LocaleExpander expander) {
    final result = _icu4x_LocaleDirectionality_create_with_expander_mv1(expander._ffi);
    return LocaleDirectionality._fromFfi(result, []);
  }

  /// Construct a new LocaleDirectionality instance with a custom expander and a particular data source.
  ///
  /// See the [Rust documentation for `new_with_expander`](https://docs.rs/icu/latest/icu/locale/struct.LocaleDirectionality.html#method.new_with_expander) for more information.
  ///
  /// Throws [DataError] on failure.
  factory LocaleDirectionality.withExpanderAndProvider(DataProvider provider, LocaleExpander expander) {
    final result = _icu4x_LocaleDirectionality_create_with_expander_and_provider_mv1(provider._ffi, expander._ffi);
    if (!result.isOk) {
      throw DataError.values[result.union.err];
    }
    return LocaleDirectionality._fromFfi(result.union.ok, []);
  }

  /// See the [Rust documentation for `get`](https://docs.rs/icu/latest/icu/locale/struct.LocaleDirectionality.html#method.get) for more information.
  LocaleDirection operator [](Locale locale) {
    final result = _icu4x_LocaleDirectionality_get_mv1(_ffi, locale._ffi);
    return LocaleDirection.values[result];
  }

  /// See the [Rust documentation for `is_left_to_right`](https://docs.rs/icu/latest/icu/locale/struct.LocaleDirectionality.html#method.is_left_to_right) for more information.
  bool isLeftToRight(Locale locale) {
    final result = _icu4x_LocaleDirectionality_is_left_to_right_mv1(_ffi, locale._ffi);
    return result;
  }

  /// See the [Rust documentation for `is_right_to_left`](https://docs.rs/icu/latest/icu/locale/struct.LocaleDirectionality.html#method.is_right_to_left) for more information.
  bool isRightToLeft(Locale locale) {
    final result = _icu4x_LocaleDirectionality_is_right_to_left_mv1(_ffi, locale._ffi);
    return result;
  }
}

@meta.RecordUse()
@ffi.Native<ffi.Void Function(ffi.Pointer<ffi.Void>)>(isLeaf: true, symbol: 'icu4x_LocaleDirectionality_destroy_mv1')
// ignore: non_constant_identifier_names
external void _icu4x_LocaleDirectionality_destroy_mv1(ffi.Pointer<ffi.Void> self);

@meta.RecordUse()
@ffi.Native<ffi.Pointer<ffi.Opaque> Function()>(isLeaf: true, symbol: 'icu4x_LocaleDirectionality_create_mv1')
// ignore: non_constant_identifier_names
external ffi.Pointer<ffi.Opaque> _icu4x_LocaleDirectionality_create_mv1();

@meta.RecordUse()
@ffi.Native<_ResultOpaqueInt32 Function(ffi.Pointer<ffi.Opaque>)>(isLeaf: true, symbol: 'icu4x_LocaleDirectionality_create_with_provider_mv1')
// ignore: non_constant_identifier_names
external _ResultOpaqueInt32 _icu4x_LocaleDirectionality_create_with_provider_mv1(ffi.Pointer<ffi.Opaque> provider);

@meta.RecordUse()
@ffi.Native<ffi.Pointer<ffi.Opaque> Function(ffi.Pointer<ffi.Opaque>)>(isLeaf: true, symbol: 'icu4x_LocaleDirectionality_create_with_expander_mv1')
// ignore: non_constant_identifier_names
external ffi.Pointer<ffi.Opaque> _icu4x_LocaleDirectionality_create_with_expander_mv1(ffi.Pointer<ffi.Opaque> expander);

@meta.RecordUse()
@ffi.Native<_ResultOpaqueInt32 Function(ffi.Pointer<ffi.Opaque>, ffi.Pointer<ffi.Opaque>)>(isLeaf: true, symbol: 'icu4x_LocaleDirectionality_create_with_expander_and_provider_mv1')
// ignore: non_constant_identifier_names
external _ResultOpaqueInt32 _icu4x_LocaleDirectionality_create_with_expander_and_provider_mv1(ffi.Pointer<ffi.Opaque> provider, ffi.Pointer<ffi.Opaque> expander);

@meta.RecordUse()
@ffi.Native<ffi.Int32 Function(ffi.Pointer<ffi.Opaque>, ffi.Pointer<ffi.Opaque>)>(isLeaf: true, symbol: 'icu4x_LocaleDirectionality_get_mv1')
// ignore: non_constant_identifier_names
external int _icu4x_LocaleDirectionality_get_mv1(ffi.Pointer<ffi.Opaque> self, ffi.Pointer<ffi.Opaque> locale);

@meta.RecordUse()
@ffi.Native<ffi.Bool Function(ffi.Pointer<ffi.Opaque>, ffi.Pointer<ffi.Opaque>)>(isLeaf: true, symbol: 'icu4x_LocaleDirectionality_is_left_to_right_mv1')
// ignore: non_constant_identifier_names
external bool _icu4x_LocaleDirectionality_is_left_to_right_mv1(ffi.Pointer<ffi.Opaque> self, ffi.Pointer<ffi.Opaque> locale);

@meta.RecordUse()
@ffi.Native<ffi.Bool Function(ffi.Pointer<ffi.Opaque>, ffi.Pointer<ffi.Opaque>)>(isLeaf: true, symbol: 'icu4x_LocaleDirectionality_is_right_to_left_mv1')
// ignore: non_constant_identifier_names
external bool _icu4x_LocaleDirectionality_is_right_to_left_mv1(ffi.Pointer<ffi.Opaque> self, ffi.Pointer<ffi.Opaque> locale);
