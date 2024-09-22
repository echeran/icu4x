// generated by diplomat-tool

part of 'lib.g.dart';

/// See the [Rust documentation for `FixedDecimal`](https://docs.rs/fixed_decimal/latest/fixed_decimal/struct.FixedDecimal.html) for more information.
final class FixedDecimal implements ffi.Finalizable {
  final ffi.Pointer<ffi.Opaque> _ffi;

  // These are "used" in the sense that they keep dependencies alive
  // ignore: unused_field
  final core.List<Object> _selfEdge;

  // This takes in a list of lifetime edges (including for &self borrows)
  // corresponding to data this may borrow from. These should be flat arrays containing
  // references to objects, and this object will hold on to them to keep them alive and
  // maintain borrow validity.
  FixedDecimal._fromFfi(this._ffi, this._selfEdge) {
    if (_selfEdge.isEmpty) {
      _finalizer.attach(this, _ffi.cast());
    }
  }

  static final _finalizer = ffi.NativeFinalizer(ffi.Native.addressOf(_icu4x_FixedDecimal_destroy_mv1));

  /// Construct an [`FixedDecimal`] from an integer.
  ///
  /// See the [Rust documentation for `FixedDecimal`](https://docs.rs/fixed_decimal/latest/fixed_decimal/struct.FixedDecimal.html) for more information.
  factory FixedDecimal.fromInt(int v) {
    final result = _icu4x_FixedDecimal_from_int64_mv1(v);
    return FixedDecimal._fromFfi(result, []);
  }

  /// Construct an [`FixedDecimal`] from an float, with a given power of 10 for the lower magnitude
  ///
  /// See the [Rust documentation for `try_from_f64`](https://docs.rs/fixed_decimal/latest/fixed_decimal/struct.FixedDecimal.html#method.try_from_f64) for more information.
  ///
  /// See the [Rust documentation for `FloatPrecision`](https://docs.rs/fixed_decimal/latest/fixed_decimal/enum.FloatPrecision.html) for more information.
  ///
  /// Throws [FixedDecimalLimitError] on failure.
  factory FixedDecimal.fromDoubleWithLowerMagnitude(double f, int magnitude) {
    final result = _icu4x_FixedDecimal_from_double_with_lower_magnitude_mv1(f, magnitude);
    if (!result.isOk) {
      throw FixedDecimalLimitError();
    }
    return FixedDecimal._fromFfi(result.union.ok, []);
  }

  /// Construct an [`FixedDecimal`] from an float, for a given number of significant digits
  ///
  /// See the [Rust documentation for `try_from_f64`](https://docs.rs/fixed_decimal/latest/fixed_decimal/struct.FixedDecimal.html#method.try_from_f64) for more information.
  ///
  /// See the [Rust documentation for `FloatPrecision`](https://docs.rs/fixed_decimal/latest/fixed_decimal/enum.FloatPrecision.html) for more information.
  ///
  /// Throws [FixedDecimalLimitError] on failure.
  factory FixedDecimal.fromDoubleWithSignificantDigits(double f, int digits) {
    final result = _icu4x_FixedDecimal_from_double_with_significant_digits_mv1(f, digits);
    if (!result.isOk) {
      throw FixedDecimalLimitError();
    }
    return FixedDecimal._fromFfi(result.union.ok, []);
  }

  /// Construct an [`FixedDecimal`] from an float, with enough digits to recover
  /// the original floating point in IEEE 754 without needing trailing zeros
  ///
  /// See the [Rust documentation for `try_from_f64`](https://docs.rs/fixed_decimal/latest/fixed_decimal/struct.FixedDecimal.html#method.try_from_f64) for more information.
  ///
  /// See the [Rust documentation for `FloatPrecision`](https://docs.rs/fixed_decimal/latest/fixed_decimal/enum.FloatPrecision.html) for more information.
  ///
  /// Throws [FixedDecimalLimitError] on failure.
  factory FixedDecimal.fromDoubleWithFloatingPrecision(double f) {
    final result = _icu4x_FixedDecimal_from_double_with_floating_precision_mv1(f);
    if (!result.isOk) {
      throw FixedDecimalLimitError();
    }
    return FixedDecimal._fromFfi(result.union.ok, []);
  }

  /// Construct an [`FixedDecimal`] from a string.
  ///
  /// See the [Rust documentation for `try_from_str`](https://docs.rs/fixed_decimal/latest/fixed_decimal/struct.FixedDecimal.html#method.try_from_str) for more information.
  ///
  /// Throws [FixedDecimalParseError] on failure.
  factory FixedDecimal.fromString(String v) {
    final temp = _FinalizedArena();
    final result = _icu4x_FixedDecimal_from_string_mv1(v._utf8AllocIn(temp.arena));
    if (!result.isOk) {
      throw FixedDecimalParseError.values[result.union.err];
    }
    return FixedDecimal._fromFfi(result.union.ok, []);
  }

  /// See the [Rust documentation for `digit_at`](https://docs.rs/fixed_decimal/latest/fixed_decimal/struct.FixedDecimal.html#method.digit_at) for more information.
  int digitAt(int magnitude) {
    final result = _icu4x_FixedDecimal_digit_at_mv1(_ffi, magnitude);
    return result;
  }

  /// See the [Rust documentation for `magnitude_range`](https://docs.rs/fixed_decimal/latest/fixed_decimal/struct.FixedDecimal.html#method.magnitude_range) for more information.
  int get magnitudeStart {
    final result = _icu4x_FixedDecimal_magnitude_start_mv1(_ffi);
    return result;
  }

  /// See the [Rust documentation for `magnitude_range`](https://docs.rs/fixed_decimal/latest/fixed_decimal/struct.FixedDecimal.html#method.magnitude_range) for more information.
  int get magnitudeEnd {
    final result = _icu4x_FixedDecimal_magnitude_end_mv1(_ffi);
    return result;
  }

  /// See the [Rust documentation for `nonzero_magnitude_start`](https://docs.rs/fixed_decimal/latest/fixed_decimal/struct.FixedDecimal.html#method.nonzero_magnitude_start) for more information.
  int get nonzeroMagnitudeStart {
    final result = _icu4x_FixedDecimal_nonzero_magnitude_start_mv1(_ffi);
    return result;
  }

  /// See the [Rust documentation for `nonzero_magnitude_end`](https://docs.rs/fixed_decimal/latest/fixed_decimal/struct.FixedDecimal.html#method.nonzero_magnitude_end) for more information.
  int get nonzeroMagnitudeEnd {
    final result = _icu4x_FixedDecimal_nonzero_magnitude_end_mv1(_ffi);
    return result;
  }

  /// See the [Rust documentation for `is_zero`](https://docs.rs/fixed_decimal/latest/fixed_decimal/struct.FixedDecimal.html#method.is_zero) for more information.
  bool get isZero {
    final result = _icu4x_FixedDecimal_is_zero_mv1(_ffi);
    return result;
  }

  /// Multiply the [`FixedDecimal`] by a given power of ten.
  ///
  /// See the [Rust documentation for `multiply_pow10`](https://docs.rs/fixed_decimal/latest/fixed_decimal/struct.FixedDecimal.html#method.multiply_pow10) for more information.
  void multiplyPow10(int power) {
    _icu4x_FixedDecimal_multiply_pow10_mv1(_ffi, power);
  }

  /// See the [Rust documentation for `sign`](https://docs.rs/fixed_decimal/latest/fixed_decimal/struct.FixedDecimal.html#method.sign) for more information.
  FixedDecimalSign get sign {
    final result = _icu4x_FixedDecimal_sign_mv1(_ffi);
    return FixedDecimalSign.values[result];
  }

  /// Set the sign of the [`FixedDecimal`].
  ///
  /// See the [Rust documentation for `set_sign`](https://docs.rs/fixed_decimal/latest/fixed_decimal/struct.FixedDecimal.html#method.set_sign) for more information.
  set sign(FixedDecimalSign sign) {
    _icu4x_FixedDecimal_set_sign_mv1(_ffi, sign.index);
  }

  /// See the [Rust documentation for `apply_sign_display`](https://docs.rs/fixed_decimal/latest/fixed_decimal/struct.FixedDecimal.html#method.apply_sign_display) for more information.
  void applySignDisplay(FixedDecimalSignDisplay signDisplay) {
    _icu4x_FixedDecimal_apply_sign_display_mv1(_ffi, signDisplay.index);
  }

  /// See the [Rust documentation for `trim_start`](https://docs.rs/fixed_decimal/latest/fixed_decimal/struct.FixedDecimal.html#method.trim_start) for more information.
  void trimStart() {
    _icu4x_FixedDecimal_trim_start_mv1(_ffi);
  }

  /// See the [Rust documentation for `trim_end`](https://docs.rs/fixed_decimal/latest/fixed_decimal/struct.FixedDecimal.html#method.trim_end) for more information.
  void trimEnd() {
    _icu4x_FixedDecimal_trim_end_mv1(_ffi);
  }

  /// Zero-pad the [`FixedDecimal`] on the left to a particular position
  ///
  /// See the [Rust documentation for `pad_start`](https://docs.rs/fixed_decimal/latest/fixed_decimal/struct.FixedDecimal.html#method.pad_start) for more information.
  void padStart(int position) {
    _icu4x_FixedDecimal_pad_start_mv1(_ffi, position);
  }

  /// Zero-pad the [`FixedDecimal`] on the right to a particular position
  ///
  /// See the [Rust documentation for `pad_end`](https://docs.rs/fixed_decimal/latest/fixed_decimal/struct.FixedDecimal.html#method.pad_end) for more information.
  void padEnd(int position) {
    _icu4x_FixedDecimal_pad_end_mv1(_ffi, position);
  }

  /// Truncate the [`FixedDecimal`] on the left to a particular position, deleting digits if necessary. This is useful for, e.g. abbreviating years
  /// ("2022" -> "22")
  ///
  /// See the [Rust documentation for `set_max_position`](https://docs.rs/fixed_decimal/latest/fixed_decimal/struct.FixedDecimal.html#method.set_max_position) for more information.
  void setMaxPosition(int position) {
    _icu4x_FixedDecimal_set_max_position_mv1(_ffi, position);
  }

  /// Round the number at a particular digit position.
  ///
  /// This uses half to even rounding, which resolves ties by selecting the nearest
  /// even integer to the original value.
  ///
  /// See the [Rust documentation for `round`](https://docs.rs/fixed_decimal/latest/fixed_decimal/struct.FixedDecimal.html#method.round) for more information.
  void round(int position) {
    _icu4x_FixedDecimal_round_mv1(_ffi, position);
  }

  /// See the [Rust documentation for `ceil`](https://docs.rs/fixed_decimal/latest/fixed_decimal/struct.FixedDecimal.html#method.ceil) for more information.
  void ceil(int position) {
    _icu4x_FixedDecimal_ceil_mv1(_ffi, position);
  }

  /// See the [Rust documentation for `expand`](https://docs.rs/fixed_decimal/latest/fixed_decimal/struct.FixedDecimal.html#method.expand) for more information.
  void expand(int position) {
    _icu4x_FixedDecimal_expand_mv1(_ffi, position);
  }

  /// See the [Rust documentation for `floor`](https://docs.rs/fixed_decimal/latest/fixed_decimal/struct.FixedDecimal.html#method.floor) for more information.
  void floor(int position) {
    _icu4x_FixedDecimal_floor_mv1(_ffi, position);
  }

  /// See the [Rust documentation for `trunc`](https://docs.rs/fixed_decimal/latest/fixed_decimal/struct.FixedDecimal.html#method.trunc) for more information.
  void trunc(int position) {
    _icu4x_FixedDecimal_trunc_mv1(_ffi, position);
  }

  /// See the [Rust documentation for `round_with_mode`](https://docs.rs/fixed_decimal/latest/fixed_decimal/struct.FixedDecimal.html#method.round_with_mode) for more information.
  void roundWithMode(int position, FixedDecimalRoundingMode mode) {
    _icu4x_FixedDecimal_round_with_mode_mv1(_ffi, position, mode.index);
  }

  /// See the [Rust documentation for `round_with_mode_and_increment`](https://docs.rs/fixed_decimal/latest/fixed_decimal/struct.FixedDecimal.html#method.round_with_mode_and_increment) for more information.
  void roundWithModeAndIncrement(int position, FixedDecimalRoundingMode mode, FixedDecimalRoundingIncrement increment) {
    _icu4x_FixedDecimal_round_with_mode_and_increment_mv1(_ffi, position, mode.index, increment.index);
  }

  /// Concatenates `other` to the end of `self`.
  ///
  /// If successful, `other` will be set to 0 and a successful status is returned.
  ///
  /// If not successful, `other` will be unchanged and an error is returned.
  ///
  /// See the [Rust documentation for `concatenate_end`](https://docs.rs/fixed_decimal/latest/fixed_decimal/struct.FixedDecimal.html#method.concatenate_end) for more information.
  bool concatenateEnd(FixedDecimal other) {
    final result = _icu4x_FixedDecimal_concatenate_end_mv1(_ffi, other._ffi);
    return result.isOk;
  }

  /// Format the [`FixedDecimal`] as a string.
  ///
  /// See the [Rust documentation for `write_to`](https://docs.rs/fixed_decimal/latest/fixed_decimal/struct.FixedDecimal.html#method.write_to) for more information.
  @core.override
  String toString() {
    final write = _Write();
    _icu4x_FixedDecimal_to_string_mv1(_ffi, write._ffi);
    return write.finalize();
  }
}

@meta.RecordUse()
@ffi.Native<ffi.Void Function(ffi.Pointer<ffi.Void>)>(isLeaf: true, symbol: 'icu4x_FixedDecimal_destroy_mv1')
// ignore: non_constant_identifier_names
external void _icu4x_FixedDecimal_destroy_mv1(ffi.Pointer<ffi.Void> self);

@meta.RecordUse()
@ffi.Native<ffi.Pointer<ffi.Opaque> Function(ffi.Int64)>(isLeaf: true, symbol: 'icu4x_FixedDecimal_from_int64_mv1')
// ignore: non_constant_identifier_names
external ffi.Pointer<ffi.Opaque> _icu4x_FixedDecimal_from_int64_mv1(int v);

@meta.RecordUse()
@ffi.Native<_ResultOpaqueFixedDecimalLimitErrorFfi Function(ffi.Double, ffi.Int16)>(isLeaf: true, symbol: 'icu4x_FixedDecimal_from_double_with_lower_magnitude_mv1')
// ignore: non_constant_identifier_names
external _ResultOpaqueFixedDecimalLimitErrorFfi _icu4x_FixedDecimal_from_double_with_lower_magnitude_mv1(double f, int magnitude);

@meta.RecordUse()
@ffi.Native<_ResultOpaqueFixedDecimalLimitErrorFfi Function(ffi.Double, ffi.Uint8)>(isLeaf: true, symbol: 'icu4x_FixedDecimal_from_double_with_significant_digits_mv1')
// ignore: non_constant_identifier_names
external _ResultOpaqueFixedDecimalLimitErrorFfi _icu4x_FixedDecimal_from_double_with_significant_digits_mv1(double f, int digits);

@meta.RecordUse()
@ffi.Native<_ResultOpaqueFixedDecimalLimitErrorFfi Function(ffi.Double)>(isLeaf: true, symbol: 'icu4x_FixedDecimal_from_double_with_floating_precision_mv1')
// ignore: non_constant_identifier_names
external _ResultOpaqueFixedDecimalLimitErrorFfi _icu4x_FixedDecimal_from_double_with_floating_precision_mv1(double f);

@meta.RecordUse()
@ffi.Native<_ResultOpaqueInt32 Function(_SliceUtf8)>(isLeaf: true, symbol: 'icu4x_FixedDecimal_from_string_mv1')
// ignore: non_constant_identifier_names
external _ResultOpaqueInt32 _icu4x_FixedDecimal_from_string_mv1(_SliceUtf8 v);

@meta.RecordUse()
@ffi.Native<ffi.Uint8 Function(ffi.Pointer<ffi.Opaque>, ffi.Int16)>(isLeaf: true, symbol: 'icu4x_FixedDecimal_digit_at_mv1')
// ignore: non_constant_identifier_names
external int _icu4x_FixedDecimal_digit_at_mv1(ffi.Pointer<ffi.Opaque> self, int magnitude);

@meta.RecordUse()
@ffi.Native<ffi.Int16 Function(ffi.Pointer<ffi.Opaque>)>(isLeaf: true, symbol: 'icu4x_FixedDecimal_magnitude_start_mv1')
// ignore: non_constant_identifier_names
external int _icu4x_FixedDecimal_magnitude_start_mv1(ffi.Pointer<ffi.Opaque> self);

@meta.RecordUse()
@ffi.Native<ffi.Int16 Function(ffi.Pointer<ffi.Opaque>)>(isLeaf: true, symbol: 'icu4x_FixedDecimal_magnitude_end_mv1')
// ignore: non_constant_identifier_names
external int _icu4x_FixedDecimal_magnitude_end_mv1(ffi.Pointer<ffi.Opaque> self);

@meta.RecordUse()
@ffi.Native<ffi.Int16 Function(ffi.Pointer<ffi.Opaque>)>(isLeaf: true, symbol: 'icu4x_FixedDecimal_nonzero_magnitude_start_mv1')
// ignore: non_constant_identifier_names
external int _icu4x_FixedDecimal_nonzero_magnitude_start_mv1(ffi.Pointer<ffi.Opaque> self);

@meta.RecordUse()
@ffi.Native<ffi.Int16 Function(ffi.Pointer<ffi.Opaque>)>(isLeaf: true, symbol: 'icu4x_FixedDecimal_nonzero_magnitude_end_mv1')
// ignore: non_constant_identifier_names
external int _icu4x_FixedDecimal_nonzero_magnitude_end_mv1(ffi.Pointer<ffi.Opaque> self);

@meta.RecordUse()
@ffi.Native<ffi.Bool Function(ffi.Pointer<ffi.Opaque>)>(isLeaf: true, symbol: 'icu4x_FixedDecimal_is_zero_mv1')
// ignore: non_constant_identifier_names
external bool _icu4x_FixedDecimal_is_zero_mv1(ffi.Pointer<ffi.Opaque> self);

@meta.RecordUse()
@ffi.Native<ffi.Void Function(ffi.Pointer<ffi.Opaque>, ffi.Int16)>(isLeaf: true, symbol: 'icu4x_FixedDecimal_multiply_pow10_mv1')
// ignore: non_constant_identifier_names
external void _icu4x_FixedDecimal_multiply_pow10_mv1(ffi.Pointer<ffi.Opaque> self, int power);

@meta.RecordUse()
@ffi.Native<ffi.Int32 Function(ffi.Pointer<ffi.Opaque>)>(isLeaf: true, symbol: 'icu4x_FixedDecimal_sign_mv1')
// ignore: non_constant_identifier_names
external int _icu4x_FixedDecimal_sign_mv1(ffi.Pointer<ffi.Opaque> self);

@meta.RecordUse()
@ffi.Native<ffi.Void Function(ffi.Pointer<ffi.Opaque>, ffi.Int32)>(isLeaf: true, symbol: 'icu4x_FixedDecimal_set_sign_mv1')
// ignore: non_constant_identifier_names
external void _icu4x_FixedDecimal_set_sign_mv1(ffi.Pointer<ffi.Opaque> self, int sign);

@meta.RecordUse()
@ffi.Native<ffi.Void Function(ffi.Pointer<ffi.Opaque>, ffi.Int32)>(isLeaf: true, symbol: 'icu4x_FixedDecimal_apply_sign_display_mv1')
// ignore: non_constant_identifier_names
external void _icu4x_FixedDecimal_apply_sign_display_mv1(ffi.Pointer<ffi.Opaque> self, int signDisplay);

@meta.RecordUse()
@ffi.Native<ffi.Void Function(ffi.Pointer<ffi.Opaque>)>(isLeaf: true, symbol: 'icu4x_FixedDecimal_trim_start_mv1')
// ignore: non_constant_identifier_names
external void _icu4x_FixedDecimal_trim_start_mv1(ffi.Pointer<ffi.Opaque> self);

@meta.RecordUse()
@ffi.Native<ffi.Void Function(ffi.Pointer<ffi.Opaque>)>(isLeaf: true, symbol: 'icu4x_FixedDecimal_trim_end_mv1')
// ignore: non_constant_identifier_names
external void _icu4x_FixedDecimal_trim_end_mv1(ffi.Pointer<ffi.Opaque> self);

@meta.RecordUse()
@ffi.Native<ffi.Void Function(ffi.Pointer<ffi.Opaque>, ffi.Int16)>(isLeaf: true, symbol: 'icu4x_FixedDecimal_pad_start_mv1')
// ignore: non_constant_identifier_names
external void _icu4x_FixedDecimal_pad_start_mv1(ffi.Pointer<ffi.Opaque> self, int position);

@meta.RecordUse()
@ffi.Native<ffi.Void Function(ffi.Pointer<ffi.Opaque>, ffi.Int16)>(isLeaf: true, symbol: 'icu4x_FixedDecimal_pad_end_mv1')
// ignore: non_constant_identifier_names
external void _icu4x_FixedDecimal_pad_end_mv1(ffi.Pointer<ffi.Opaque> self, int position);

@meta.RecordUse()
@ffi.Native<ffi.Void Function(ffi.Pointer<ffi.Opaque>, ffi.Int16)>(isLeaf: true, symbol: 'icu4x_FixedDecimal_set_max_position_mv1')
// ignore: non_constant_identifier_names
external void _icu4x_FixedDecimal_set_max_position_mv1(ffi.Pointer<ffi.Opaque> self, int position);

@meta.RecordUse()
@ffi.Native<ffi.Void Function(ffi.Pointer<ffi.Opaque>, ffi.Int16)>(isLeaf: true, symbol: 'icu4x_FixedDecimal_round_mv1')
// ignore: non_constant_identifier_names
external void _icu4x_FixedDecimal_round_mv1(ffi.Pointer<ffi.Opaque> self, int position);

@meta.RecordUse()
@ffi.Native<ffi.Void Function(ffi.Pointer<ffi.Opaque>, ffi.Int16)>(isLeaf: true, symbol: 'icu4x_FixedDecimal_ceil_mv1')
// ignore: non_constant_identifier_names
external void _icu4x_FixedDecimal_ceil_mv1(ffi.Pointer<ffi.Opaque> self, int position);

@meta.RecordUse()
@ffi.Native<ffi.Void Function(ffi.Pointer<ffi.Opaque>, ffi.Int16)>(isLeaf: true, symbol: 'icu4x_FixedDecimal_expand_mv1')
// ignore: non_constant_identifier_names
external void _icu4x_FixedDecimal_expand_mv1(ffi.Pointer<ffi.Opaque> self, int position);

@meta.RecordUse()
@ffi.Native<ffi.Void Function(ffi.Pointer<ffi.Opaque>, ffi.Int16)>(isLeaf: true, symbol: 'icu4x_FixedDecimal_floor_mv1')
// ignore: non_constant_identifier_names
external void _icu4x_FixedDecimal_floor_mv1(ffi.Pointer<ffi.Opaque> self, int position);

@meta.RecordUse()
@ffi.Native<ffi.Void Function(ffi.Pointer<ffi.Opaque>, ffi.Int16)>(isLeaf: true, symbol: 'icu4x_FixedDecimal_trunc_mv1')
// ignore: non_constant_identifier_names
external void _icu4x_FixedDecimal_trunc_mv1(ffi.Pointer<ffi.Opaque> self, int position);

@meta.RecordUse()
@ffi.Native<ffi.Void Function(ffi.Pointer<ffi.Opaque>, ffi.Int16, ffi.Int32)>(isLeaf: true, symbol: 'icu4x_FixedDecimal_round_with_mode_mv1')
// ignore: non_constant_identifier_names
external void _icu4x_FixedDecimal_round_with_mode_mv1(ffi.Pointer<ffi.Opaque> self, int position, int mode);

@meta.RecordUse()
@ffi.Native<ffi.Void Function(ffi.Pointer<ffi.Opaque>, ffi.Int16, ffi.Int32, ffi.Int32)>(isLeaf: true, symbol: 'icu4x_FixedDecimal_round_with_mode_and_increment_mv1')
// ignore: non_constant_identifier_names
external void _icu4x_FixedDecimal_round_with_mode_and_increment_mv1(ffi.Pointer<ffi.Opaque> self, int position, int mode, int increment);

@meta.RecordUse()
@ffi.Native<_ResultVoidVoid Function(ffi.Pointer<ffi.Opaque>, ffi.Pointer<ffi.Opaque>)>(isLeaf: true, symbol: 'icu4x_FixedDecimal_concatenate_end_mv1')
// ignore: non_constant_identifier_names
external _ResultVoidVoid _icu4x_FixedDecimal_concatenate_end_mv1(ffi.Pointer<ffi.Opaque> self, ffi.Pointer<ffi.Opaque> other);

@meta.RecordUse()
@ffi.Native<ffi.Void Function(ffi.Pointer<ffi.Opaque>, ffi.Pointer<ffi.Opaque>)>(isLeaf: true, symbol: 'icu4x_FixedDecimal_to_string_mv1')
// ignore: non_constant_identifier_names
external void _icu4x_FixedDecimal_to_string_mv1(ffi.Pointer<ffi.Opaque> self, ffi.Pointer<ffi.Opaque> write);
