// generated by diplomat-tool

part of 'lib.g.dart';

/// See the [Rust documentation for `AnyCalendar`](https://docs.rs/icu/latest/icu/calendar/enum.AnyCalendar.html) for more information.
final class Calendar implements ffi.Finalizable {
  final ffi.Pointer<ffi.Opaque> _ffi;

  // These are "used" in the sense that they keep dependencies alive
  // ignore: unused_field
  final core.List<Object> _selfEdge;

  // This takes in a list of lifetime edges (including for &self borrows)
  // corresponding to data this may borrow from. These should be flat arrays containing
  // references to objects, and this object will hold on to them to keep them alive and
  // maintain borrow validity.
  Calendar._fromFfi(this._ffi, this._selfEdge) {
    if (_selfEdge.isEmpty) {
      _finalizer.attach(this, _ffi.cast());
    }
  }

  static final _finalizer = ffi.NativeFinalizer(ffi.Native.addressOf(_icu4x_Calendar_destroy_mv1));

  /// Creates a new [`Calendar`] from the specified date and time.
  ///
  /// See the [Rust documentation for `new_for_locale`](https://docs.rs/icu/latest/icu/calendar/enum.AnyCalendar.html#method.new_for_locale) for more information.
  ///
  /// Throws [DataError] on failure.
  factory Calendar.forLocale(DataProvider provider, Locale locale) {
    final result = _icu4x_Calendar_create_for_locale_mv1(provider._ffi, locale._ffi);
    if (!result.isOk) {
      throw DataError.values[result.union.err];
    }
    return Calendar._fromFfi(result.union.ok, []);
  }

  /// Creates a new [`Calendar`] from the specified date and time.
  ///
  /// See the [Rust documentation for `new`](https://docs.rs/icu/latest/icu/calendar/enum.AnyCalendar.html#method.new) for more information.
  ///
  /// Throws [DataError] on failure.
  factory Calendar.forKind(DataProvider provider, AnyCalendarKind kind) {
    final result = _icu4x_Calendar_create_for_kind_mv1(provider._ffi, kind.index);
    if (!result.isOk) {
      throw DataError.values[result.union.err];
    }
    return Calendar._fromFfi(result.union.ok, []);
  }

  /// Returns the kind of this calendar
  ///
  /// See the [Rust documentation for `kind`](https://docs.rs/icu/latest/icu/calendar/enum.AnyCalendar.html#method.kind) for more information.
  AnyCalendarKind get kind {
    final result = _icu4x_Calendar_kind_mv1(_ffi);
    return AnyCalendarKind.values[result];
  }
}

@meta.RecordUse()
@ffi.Native<ffi.Void Function(ffi.Pointer<ffi.Void>)>(isLeaf: true, symbol: 'icu4x_Calendar_destroy_mv1')
// ignore: non_constant_identifier_names
external void _icu4x_Calendar_destroy_mv1(ffi.Pointer<ffi.Void> self);

@meta.RecordUse()
@ffi.Native<_ResultOpaqueInt32 Function(ffi.Pointer<ffi.Opaque>, ffi.Pointer<ffi.Opaque>)>(isLeaf: true, symbol: 'icu4x_Calendar_create_for_locale_mv1')
// ignore: non_constant_identifier_names
external _ResultOpaqueInt32 _icu4x_Calendar_create_for_locale_mv1(ffi.Pointer<ffi.Opaque> provider, ffi.Pointer<ffi.Opaque> locale);

@meta.RecordUse()
@ffi.Native<_ResultOpaqueInt32 Function(ffi.Pointer<ffi.Opaque>, ffi.Int32)>(isLeaf: true, symbol: 'icu4x_Calendar_create_for_kind_mv1')
// ignore: non_constant_identifier_names
external _ResultOpaqueInt32 _icu4x_Calendar_create_for_kind_mv1(ffi.Pointer<ffi.Opaque> provider, int kind);

@meta.RecordUse()
@ffi.Native<ffi.Int32 Function(ffi.Pointer<ffi.Opaque>)>(isLeaf: true, symbol: 'icu4x_Calendar_kind_mv1')
// ignore: non_constant_identifier_names
external int _icu4x_Calendar_kind_mv1(ffi.Pointer<ffi.Opaque> self);
