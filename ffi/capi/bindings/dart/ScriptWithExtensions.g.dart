// generated by diplomat-tool

part of 'lib.g.dart';

/// An ICU4X ScriptWithExtensions map object, capable of holding a map of codepoints to scriptextensions values
///
/// See the [Rust documentation for `ScriptWithExtensions`](https://docs.rs/icu/latest/icu/properties/script/struct.ScriptWithExtensions.html) for more information.
final class ScriptWithExtensions implements ffi.Finalizable {
  final ffi.Pointer<ffi.Opaque> _ffi;

  // These are "used" in the sense that they keep dependencies alive
  // ignore: unused_field
  final core.List<Object> _selfEdge;

  // This takes in a list of lifetime edges (including for &self borrows)
  // corresponding to data this may borrow from. These should be flat arrays containing
  // references to objects, and this object will hold on to them to keep them alive and
  // maintain borrow validity.
  ScriptWithExtensions._fromFfi(this._ffi, this._selfEdge) {
    if (_selfEdge.isEmpty) {
      _finalizer.attach(this, _ffi.cast());
    }
  }

  static final _finalizer = ffi.NativeFinalizer(ffi.Native.addressOf(_icu4x_ScriptWithExtensions_destroy_mv1));

  /// See the [Rust documentation for `new`](https://docs.rs/icu/latest/icu/properties/script/struct.ScriptWithExtensions.html#method.new) for more information.
  factory ScriptWithExtensions() {
    final result = _icu4x_ScriptWithExtensions_create_mv1();
    return ScriptWithExtensions._fromFfi(result, []);
  }

  /// See the [Rust documentation for `new`](https://docs.rs/icu/latest/icu/properties/script/struct.ScriptWithExtensions.html#method.new) for more information.
  ///
  /// Throws [DataError] on failure.
  factory ScriptWithExtensions.withProvider(DataProvider provider) {
    final result = _icu4x_ScriptWithExtensions_create_with_provider_mv1(provider._ffi);
    if (!result.isOk) {
      throw DataError.values[result.union.err];
    }
    return ScriptWithExtensions._fromFfi(result.union.ok, []);
  }

  /// Get the Script property value for a code point
  ///
  /// See the [Rust documentation for `get_script_val`](https://docs.rs/icu/latest/icu/properties/script/struct.ScriptWithExtensionsBorrowed.html#method.get_script_val) for more information.
  int getScriptVal(Rune ch) {
    final result = _icu4x_ScriptWithExtensions_get_script_val_mv1(_ffi, ch);
    return result;
  }

  /// Check if the Script_Extensions property of the given code point covers the given script
  ///
  /// See the [Rust documentation for `has_script`](https://docs.rs/icu/latest/icu/properties/script/struct.ScriptWithExtensionsBorrowed.html#method.has_script) for more information.
  bool hasScript(Rune ch, int script) {
    final result = _icu4x_ScriptWithExtensions_has_script_mv1(_ffi, ch, script);
    return result;
  }

  /// Borrow this object for a slightly faster variant with more operations
  ///
  /// See the [Rust documentation for `as_borrowed`](https://docs.rs/icu/latest/icu/properties/script/struct.ScriptWithExtensions.html#method.as_borrowed) for more information.
  ScriptWithExtensionsBorrowed get asBorrowed {
    // This lifetime edge depends on lifetimes: 'a
    core.List<Object> aEdges = [this];
    final result = _icu4x_ScriptWithExtensions_as_borrowed_mv1(_ffi);
    return ScriptWithExtensionsBorrowed._fromFfi(result, [], aEdges);
  }

  /// Get a list of ranges of code points that contain this script in their Script_Extensions values
  ///
  /// See the [Rust documentation for `get_script_extensions_ranges`](https://docs.rs/icu/latest/icu/properties/script/struct.ScriptWithExtensionsBorrowed.html#method.get_script_extensions_ranges) for more information.
  CodePointRangeIterator iterRangesForScript(int script) {
    // This lifetime edge depends on lifetimes: 'a
    core.List<Object> aEdges = [this];
    final result = _icu4x_ScriptWithExtensions_iter_ranges_for_script_mv1(_ffi, script);
    return CodePointRangeIterator._fromFfi(result, [], aEdges);
  }
}

@meta.RecordUse()
@ffi.Native<ffi.Void Function(ffi.Pointer<ffi.Void>)>(isLeaf: true, symbol: 'icu4x_ScriptWithExtensions_destroy_mv1')
// ignore: non_constant_identifier_names
external void _icu4x_ScriptWithExtensions_destroy_mv1(ffi.Pointer<ffi.Void> self);

@meta.RecordUse()
@ffi.Native<ffi.Pointer<ffi.Opaque> Function()>(isLeaf: true, symbol: 'icu4x_ScriptWithExtensions_create_mv1')
// ignore: non_constant_identifier_names
external ffi.Pointer<ffi.Opaque> _icu4x_ScriptWithExtensions_create_mv1();

@meta.RecordUse()
@ffi.Native<_ResultOpaqueInt32 Function(ffi.Pointer<ffi.Opaque>)>(isLeaf: true, symbol: 'icu4x_ScriptWithExtensions_create_with_provider_mv1')
// ignore: non_constant_identifier_names
external _ResultOpaqueInt32 _icu4x_ScriptWithExtensions_create_with_provider_mv1(ffi.Pointer<ffi.Opaque> provider);

@meta.RecordUse()
@ffi.Native<ffi.Uint16 Function(ffi.Pointer<ffi.Opaque>, ffi.Uint32)>(isLeaf: true, symbol: 'icu4x_ScriptWithExtensions_get_script_val_mv1')
// ignore: non_constant_identifier_names
external int _icu4x_ScriptWithExtensions_get_script_val_mv1(ffi.Pointer<ffi.Opaque> self, Rune ch);

@meta.RecordUse()
@ffi.Native<ffi.Bool Function(ffi.Pointer<ffi.Opaque>, ffi.Uint32, ffi.Uint16)>(isLeaf: true, symbol: 'icu4x_ScriptWithExtensions_has_script_mv1')
// ignore: non_constant_identifier_names
external bool _icu4x_ScriptWithExtensions_has_script_mv1(ffi.Pointer<ffi.Opaque> self, Rune ch, int script);

@meta.RecordUse()
@ffi.Native<ffi.Pointer<ffi.Opaque> Function(ffi.Pointer<ffi.Opaque>)>(isLeaf: true, symbol: 'icu4x_ScriptWithExtensions_as_borrowed_mv1')
// ignore: non_constant_identifier_names
external ffi.Pointer<ffi.Opaque> _icu4x_ScriptWithExtensions_as_borrowed_mv1(ffi.Pointer<ffi.Opaque> self);

@meta.RecordUse()
@ffi.Native<ffi.Pointer<ffi.Opaque> Function(ffi.Pointer<ffi.Opaque>, ffi.Uint16)>(isLeaf: true, symbol: 'icu4x_ScriptWithExtensions_iter_ranges_for_script_mv1')
// ignore: non_constant_identifier_names
external ffi.Pointer<ffi.Opaque> _icu4x_ScriptWithExtensions_iter_ranges_for_script_mv1(ffi.Pointer<ffi.Opaque> self, int script);
