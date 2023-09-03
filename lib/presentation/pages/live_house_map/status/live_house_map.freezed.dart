// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_house_map.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LiveHouseMap {
  GoogleMapController? get controller => throw _privateConstructorUsedError;
  bool get isCameraMoved => throw _privateConstructorUsedError;
  LatLng? get previousLatLng => throw _privateConstructorUsedError;
  LatLng? get latLng => throw _privateConstructorUsedError;
  double get radiusInKm => throw _privateConstructorUsedError;
  double get previousRadiusInKm => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LiveHouseMapCopyWith<LiveHouseMap> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiveHouseMapCopyWith<$Res> {
  factory $LiveHouseMapCopyWith(
          LiveHouseMap value, $Res Function(LiveHouseMap) then) =
      _$LiveHouseMapCopyWithImpl<$Res, LiveHouseMap>;
  @useResult
  $Res call(
      {GoogleMapController? controller,
      bool isCameraMoved,
      LatLng? previousLatLng,
      LatLng? latLng,
      double radiusInKm,
      double previousRadiusInKm});
}

/// @nodoc
class _$LiveHouseMapCopyWithImpl<$Res, $Val extends LiveHouseMap>
    implements $LiveHouseMapCopyWith<$Res> {
  _$LiveHouseMapCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? controller = freezed,
    Object? isCameraMoved = null,
    Object? previousLatLng = freezed,
    Object? latLng = freezed,
    Object? radiusInKm = null,
    Object? previousRadiusInKm = null,
  }) {
    return _then(_value.copyWith(
      controller: freezed == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as GoogleMapController?,
      isCameraMoved: null == isCameraMoved
          ? _value.isCameraMoved
          : isCameraMoved // ignore: cast_nullable_to_non_nullable
              as bool,
      previousLatLng: freezed == previousLatLng
          ? _value.previousLatLng
          : previousLatLng // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      latLng: freezed == latLng
          ? _value.latLng
          : latLng // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      radiusInKm: null == radiusInKm
          ? _value.radiusInKm
          : radiusInKm // ignore: cast_nullable_to_non_nullable
              as double,
      previousRadiusInKm: null == previousRadiusInKm
          ? _value.previousRadiusInKm
          : previousRadiusInKm // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LiveHouseMapCopyWith<$Res>
    implements $LiveHouseMapCopyWith<$Res> {
  factory _$$_LiveHouseMapCopyWith(
          _$_LiveHouseMap value, $Res Function(_$_LiveHouseMap) then) =
      __$$_LiveHouseMapCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {GoogleMapController? controller,
      bool isCameraMoved,
      LatLng? previousLatLng,
      LatLng? latLng,
      double radiusInKm,
      double previousRadiusInKm});
}

/// @nodoc
class __$$_LiveHouseMapCopyWithImpl<$Res>
    extends _$LiveHouseMapCopyWithImpl<$Res, _$_LiveHouseMap>
    implements _$$_LiveHouseMapCopyWith<$Res> {
  __$$_LiveHouseMapCopyWithImpl(
      _$_LiveHouseMap _value, $Res Function(_$_LiveHouseMap) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? controller = freezed,
    Object? isCameraMoved = null,
    Object? previousLatLng = freezed,
    Object? latLng = freezed,
    Object? radiusInKm = null,
    Object? previousRadiusInKm = null,
  }) {
    return _then(_$_LiveHouseMap(
      controller: freezed == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as GoogleMapController?,
      isCameraMoved: null == isCameraMoved
          ? _value.isCameraMoved
          : isCameraMoved // ignore: cast_nullable_to_non_nullable
              as bool,
      previousLatLng: freezed == previousLatLng
          ? _value.previousLatLng
          : previousLatLng // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      latLng: freezed == latLng
          ? _value.latLng
          : latLng // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      radiusInKm: null == radiusInKm
          ? _value.radiusInKm
          : radiusInKm // ignore: cast_nullable_to_non_nullable
              as double,
      previousRadiusInKm: null == previousRadiusInKm
          ? _value.previousRadiusInKm
          : previousRadiusInKm // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_LiveHouseMap implements _LiveHouseMap {
  _$_LiveHouseMap(
      {this.controller = null,
      this.isCameraMoved = false,
      this.previousLatLng = null,
      this.latLng = null,
      this.radiusInKm = 10.0,
      this.previousRadiusInKm = 10.0});

  @override
  @JsonKey()
  final GoogleMapController? controller;
  @override
  @JsonKey()
  final bool isCameraMoved;
  @override
  @JsonKey()
  final LatLng? previousLatLng;
  @override
  @JsonKey()
  final LatLng? latLng;
  @override
  @JsonKey()
  final double radiusInKm;
  @override
  @JsonKey()
  final double previousRadiusInKm;

  @override
  String toString() {
    return 'LiveHouseMap(controller: $controller, isCameraMoved: $isCameraMoved, previousLatLng: $previousLatLng, latLng: $latLng, radiusInKm: $radiusInKm, previousRadiusInKm: $previousRadiusInKm)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LiveHouseMap &&
            (identical(other.controller, controller) ||
                other.controller == controller) &&
            (identical(other.isCameraMoved, isCameraMoved) ||
                other.isCameraMoved == isCameraMoved) &&
            (identical(other.previousLatLng, previousLatLng) ||
                other.previousLatLng == previousLatLng) &&
            (identical(other.latLng, latLng) || other.latLng == latLng) &&
            (identical(other.radiusInKm, radiusInKm) ||
                other.radiusInKm == radiusInKm) &&
            (identical(other.previousRadiusInKm, previousRadiusInKm) ||
                other.previousRadiusInKm == previousRadiusInKm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, controller, isCameraMoved,
      previousLatLng, latLng, radiusInKm, previousRadiusInKm);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LiveHouseMapCopyWith<_$_LiveHouseMap> get copyWith =>
      __$$_LiveHouseMapCopyWithImpl<_$_LiveHouseMap>(this, _$identity);
}

abstract class _LiveHouseMap implements LiveHouseMap {
  factory _LiveHouseMap(
      {final GoogleMapController? controller,
      final bool isCameraMoved,
      final LatLng? previousLatLng,
      final LatLng? latLng,
      final double radiusInKm,
      final double previousRadiusInKm}) = _$_LiveHouseMap;

  @override
  GoogleMapController? get controller;
  @override
  bool get isCameraMoved;
  @override
  LatLng? get previousLatLng;
  @override
  LatLng? get latLng;
  @override
  double get radiusInKm;
  @override
  double get previousRadiusInKm;
  @override
  @JsonKey(ignore: true)
  _$$_LiveHouseMapCopyWith<_$_LiveHouseMap> get copyWith =>
      throw _privateConstructorUsedError;
}
