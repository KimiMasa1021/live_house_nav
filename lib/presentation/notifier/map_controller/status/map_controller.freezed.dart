// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MapController {
  GoogleMapController? get controller => throw _privateConstructorUsedError;
  bool get isCameraMoved => throw _privateConstructorUsedError;
  LatLng? get previousLatLng => throw _privateConstructorUsedError;
  LatLng? get latLng => throw _privateConstructorUsedError;
  double get radiusInKm => throw _privateConstructorUsedError;
  double get previousRadiusInKm => throw _privateConstructorUsedError;
  String get markerId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MapControllerCopyWith<MapController> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapControllerCopyWith<$Res> {
  factory $MapControllerCopyWith(
          MapController value, $Res Function(MapController) then) =
      _$MapControllerCopyWithImpl<$Res, MapController>;
  @useResult
  $Res call(
      {GoogleMapController? controller,
      bool isCameraMoved,
      LatLng? previousLatLng,
      LatLng? latLng,
      double radiusInKm,
      double previousRadiusInKm,
      String markerId});
}

/// @nodoc
class _$MapControllerCopyWithImpl<$Res, $Val extends MapController>
    implements $MapControllerCopyWith<$Res> {
  _$MapControllerCopyWithImpl(this._value, this._then);

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
    Object? markerId = null,
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
      markerId: null == markerId
          ? _value.markerId
          : markerId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MapControllerCopyWith<$Res>
    implements $MapControllerCopyWith<$Res> {
  factory _$$_MapControllerCopyWith(
          _$_MapController value, $Res Function(_$_MapController) then) =
      __$$_MapControllerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {GoogleMapController? controller,
      bool isCameraMoved,
      LatLng? previousLatLng,
      LatLng? latLng,
      double radiusInKm,
      double previousRadiusInKm,
      String markerId});
}

/// @nodoc
class __$$_MapControllerCopyWithImpl<$Res>
    extends _$MapControllerCopyWithImpl<$Res, _$_MapController>
    implements _$$_MapControllerCopyWith<$Res> {
  __$$_MapControllerCopyWithImpl(
      _$_MapController _value, $Res Function(_$_MapController) _then)
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
    Object? markerId = null,
  }) {
    return _then(_$_MapController(
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
      markerId: null == markerId
          ? _value.markerId
          : markerId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_MapController implements _MapController {
  _$_MapController(
      {this.controller = null,
      this.isCameraMoved = false,
      this.previousLatLng = null,
      this.latLng = null,
      this.radiusInKm = 10.0,
      this.previousRadiusInKm = 10.0,
      this.markerId = ""});

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
  @JsonKey()
  final String markerId;

  @override
  String toString() {
    return 'MapController(controller: $controller, isCameraMoved: $isCameraMoved, previousLatLng: $previousLatLng, latLng: $latLng, radiusInKm: $radiusInKm, previousRadiusInKm: $previousRadiusInKm, markerId: $markerId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MapController &&
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
                other.previousRadiusInKm == previousRadiusInKm) &&
            (identical(other.markerId, markerId) ||
                other.markerId == markerId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, controller, isCameraMoved,
      previousLatLng, latLng, radiusInKm, previousRadiusInKm, markerId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MapControllerCopyWith<_$_MapController> get copyWith =>
      __$$_MapControllerCopyWithImpl<_$_MapController>(this, _$identity);
}

abstract class _MapController implements MapController {
  factory _MapController(
      {final GoogleMapController? controller,
      final bool isCameraMoved,
      final LatLng? previousLatLng,
      final LatLng? latLng,
      final double radiusInKm,
      final double previousRadiusInKm,
      final String markerId}) = _$_MapController;

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
  String get markerId;
  @override
  @JsonKey(ignore: true)
  _$$_MapControllerCopyWith<_$_MapController> get copyWith =>
      throw _privateConstructorUsedError;
}
