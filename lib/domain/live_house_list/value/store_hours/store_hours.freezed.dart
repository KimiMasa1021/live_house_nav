// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_hours.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StoreHours _$StoreHoursFromJson(Map<String, dynamic> json) {
  return _StoreHours.fromJson(json);
}

/// @nodoc
mixin _$StoreHours {
  BusinessHour get open => throw _privateConstructorUsedError;
  BusinessHour get close => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoreHoursCopyWith<StoreHours> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreHoursCopyWith<$Res> {
  factory $StoreHoursCopyWith(
          StoreHours value, $Res Function(StoreHours) then) =
      _$StoreHoursCopyWithImpl<$Res, StoreHours>;
  @useResult
  $Res call({BusinessHour open, BusinessHour close});

  $BusinessHourCopyWith<$Res> get open;
  $BusinessHourCopyWith<$Res> get close;
}

/// @nodoc
class _$StoreHoursCopyWithImpl<$Res, $Val extends StoreHours>
    implements $StoreHoursCopyWith<$Res> {
  _$StoreHoursCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? open = null,
    Object? close = null,
  }) {
    return _then(_value.copyWith(
      open: null == open
          ? _value.open
          : open // ignore: cast_nullable_to_non_nullable
              as BusinessHour,
      close: null == close
          ? _value.close
          : close // ignore: cast_nullable_to_non_nullable
              as BusinessHour,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BusinessHourCopyWith<$Res> get open {
    return $BusinessHourCopyWith<$Res>(_value.open, (value) {
      return _then(_value.copyWith(open: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BusinessHourCopyWith<$Res> get close {
    return $BusinessHourCopyWith<$Res>(_value.close, (value) {
      return _then(_value.copyWith(close: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_StoreHoursCopyWith<$Res>
    implements $StoreHoursCopyWith<$Res> {
  factory _$$_StoreHoursCopyWith(
          _$_StoreHours value, $Res Function(_$_StoreHours) then) =
      __$$_StoreHoursCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BusinessHour open, BusinessHour close});

  @override
  $BusinessHourCopyWith<$Res> get open;
  @override
  $BusinessHourCopyWith<$Res> get close;
}

/// @nodoc
class __$$_StoreHoursCopyWithImpl<$Res>
    extends _$StoreHoursCopyWithImpl<$Res, _$_StoreHours>
    implements _$$_StoreHoursCopyWith<$Res> {
  __$$_StoreHoursCopyWithImpl(
      _$_StoreHours _value, $Res Function(_$_StoreHours) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? open = null,
    Object? close = null,
  }) {
    return _then(_$_StoreHours(
      open: null == open
          ? _value.open
          : open // ignore: cast_nullable_to_non_nullable
              as BusinessHour,
      close: null == close
          ? _value.close
          : close // ignore: cast_nullable_to_non_nullable
              as BusinessHour,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StoreHours implements _StoreHours {
  _$_StoreHours({required this.open, required this.close});

  factory _$_StoreHours.fromJson(Map<String, dynamic> json) =>
      _$$_StoreHoursFromJson(json);

  @override
  final BusinessHour open;
  @override
  final BusinessHour close;

  @override
  String toString() {
    return 'StoreHours(open: $open, close: $close)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StoreHours &&
            (identical(other.open, open) || other.open == open) &&
            (identical(other.close, close) || other.close == close));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, open, close);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StoreHoursCopyWith<_$_StoreHours> get copyWith =>
      __$$_StoreHoursCopyWithImpl<_$_StoreHours>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StoreHoursToJson(
      this,
    );
  }
}

abstract class _StoreHours implements StoreHours {
  factory _StoreHours(
      {required final BusinessHour open,
      required final BusinessHour close}) = _$_StoreHours;

  factory _StoreHours.fromJson(Map<String, dynamic> json) =
      _$_StoreHours.fromJson;

  @override
  BusinessHour get open;
  @override
  BusinessHour get close;
  @override
  @JsonKey(ignore: true)
  _$$_StoreHoursCopyWith<_$_StoreHours> get copyWith =>
      throw _privateConstructorUsedError;
}
