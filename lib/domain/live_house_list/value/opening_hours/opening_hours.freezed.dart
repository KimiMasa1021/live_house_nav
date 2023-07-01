// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'opening_hours.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OpeingHours _$OpeingHoursFromJson(Map<String, dynamic> json) {
  return _OpeingHours.fromJson(json);
}

/// @nodoc
mixin _$OpeingHours {
  bool get openNow => throw _privateConstructorUsedError;
  List<StoreHours> get periods => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OpeingHoursCopyWith<OpeingHours> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpeingHoursCopyWith<$Res> {
  factory $OpeingHoursCopyWith(
          OpeingHours value, $Res Function(OpeingHours) then) =
      _$OpeingHoursCopyWithImpl<$Res, OpeingHours>;
  @useResult
  $Res call({bool openNow, List<StoreHours> periods});
}

/// @nodoc
class _$OpeingHoursCopyWithImpl<$Res, $Val extends OpeingHours>
    implements $OpeingHoursCopyWith<$Res> {
  _$OpeingHoursCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? openNow = null,
    Object? periods = null,
  }) {
    return _then(_value.copyWith(
      openNow: null == openNow
          ? _value.openNow
          : openNow // ignore: cast_nullable_to_non_nullable
              as bool,
      periods: null == periods
          ? _value.periods
          : periods // ignore: cast_nullable_to_non_nullable
              as List<StoreHours>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OpeingHoursCopyWith<$Res>
    implements $OpeingHoursCopyWith<$Res> {
  factory _$$_OpeingHoursCopyWith(
          _$_OpeingHours value, $Res Function(_$_OpeingHours) then) =
      __$$_OpeingHoursCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool openNow, List<StoreHours> periods});
}

/// @nodoc
class __$$_OpeingHoursCopyWithImpl<$Res>
    extends _$OpeingHoursCopyWithImpl<$Res, _$_OpeingHours>
    implements _$$_OpeingHoursCopyWith<$Res> {
  __$$_OpeingHoursCopyWithImpl(
      _$_OpeingHours _value, $Res Function(_$_OpeingHours) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? openNow = null,
    Object? periods = null,
  }) {
    return _then(_$_OpeingHours(
      openNow: null == openNow
          ? _value.openNow
          : openNow // ignore: cast_nullable_to_non_nullable
              as bool,
      periods: null == periods
          ? _value._periods
          : periods // ignore: cast_nullable_to_non_nullable
              as List<StoreHours>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_OpeingHours implements _OpeingHours {
  _$_OpeingHours(
      {this.openNow = false, final List<StoreHours> periods = const []})
      : _periods = periods;

  factory _$_OpeingHours.fromJson(Map<String, dynamic> json) =>
      _$$_OpeingHoursFromJson(json);

  @override
  @JsonKey()
  final bool openNow;
  final List<StoreHours> _periods;
  @override
  @JsonKey()
  List<StoreHours> get periods {
    if (_periods is EqualUnmodifiableListView) return _periods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_periods);
  }

  @override
  String toString() {
    return 'OpeingHours(openNow: $openNow, periods: $periods)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OpeingHours &&
            (identical(other.openNow, openNow) || other.openNow == openNow) &&
            const DeepCollectionEquality().equals(other._periods, _periods));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, openNow, const DeepCollectionEquality().hash(_periods));

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

abstract class _OpeingHours implements OpeingHours {
  factory _OpeingHours({final bool openNow, final List<StoreHours> periods}) =
      _$_OpeingHours;

  factory _OpeingHours.fromJson(Map<String, dynamic> json) =
      _$_OpeingHours.fromJson;

  @override
  bool get openNow;
  @override
  List<StoreHours> get periods;
  @override
  @JsonKey(ignore: true)
  _$$_OpeingHoursCopyWith<_$_OpeingHours> get copyWith =>
      throw _privateConstructorUsedError;
}
