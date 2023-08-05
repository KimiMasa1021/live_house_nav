// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'business_hour.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BusinessHour _$BusinessHourFromJson(Map<String, dynamic> json) {
  return _OpeingHours.fromJson(json);
}

/// @nodoc
mixin _$BusinessHour {
  int get day => throw _privateConstructorUsedError;
  String get time => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BusinessHourCopyWith<BusinessHour> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusinessHourCopyWith<$Res> {
  factory $BusinessHourCopyWith(
          BusinessHour value, $Res Function(BusinessHour) then) =
      _$BusinessHourCopyWithImpl<$Res, BusinessHour>;
  @useResult
  $Res call({int day, String time});
}

/// @nodoc
class _$BusinessHourCopyWithImpl<$Res, $Val extends BusinessHour>
    implements $BusinessHourCopyWith<$Res> {
  _$BusinessHourCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? time = null,
  }) {
    return _then(_value.copyWith(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OpeingHoursCopyWith<$Res>
    implements $BusinessHourCopyWith<$Res> {
  factory _$$_OpeingHoursCopyWith(
          _$_OpeingHours value, $Res Function(_$_OpeingHours) then) =
      __$$_OpeingHoursCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int day, String time});
}

/// @nodoc
class __$$_OpeingHoursCopyWithImpl<$Res>
    extends _$BusinessHourCopyWithImpl<$Res, _$_OpeingHours>
    implements _$$_OpeingHoursCopyWith<$Res> {
  __$$_OpeingHoursCopyWithImpl(
      _$_OpeingHours _value, $Res Function(_$_OpeingHours) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? time = null,
  }) {
    return _then(_$_OpeingHours(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_OpeingHours implements _OpeingHours {
  _$_OpeingHours({this.day = 0, this.time = ""});

  factory _$_OpeingHours.fromJson(Map<String, dynamic> json) =>
      _$$_OpeingHoursFromJson(json);

  @override
  @JsonKey()
  final int day;
  @override
  @JsonKey()
  final String time;

  @override
  String toString() {
    return 'BusinessHour(day: $day, time: $time)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OpeingHours &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.time, time) || other.time == time));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, day, time);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OpeingHoursCopyWith<_$_OpeingHours> get copyWith =>
      __$$_OpeingHoursCopyWithImpl<_$_OpeingHours>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OpeingHoursToJson(
      this,
    );
  }
}

abstract class _OpeingHours implements BusinessHour {
  factory _OpeingHours({final int day, final String time}) = _$_OpeingHours;

  factory _OpeingHours.fromJson(Map<String, dynamic> json) =
      _$_OpeingHours.fromJson;

  @override
  int get day;
  @override
  String get time;
  @override
  @JsonKey(ignore: true)
  _$$_OpeingHoursCopyWith<_$_OpeingHours> get copyWith =>
      throw _privateConstructorUsedError;
}
