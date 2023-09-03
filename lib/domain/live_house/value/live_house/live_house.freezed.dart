// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_house.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LiveHouse _$LiveHouseFromJson(Map<String, dynamic> json) {
  return _LiveHouse.fromJson(json);
}

/// @nodoc
mixin _$LiveHouse {
  String get placeId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get vicinity => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  double get distance => throw _privateConstructorUsedError;
  String get prefectureValue => throw _privateConstructorUsedError;
  String get facilityType => throw _privateConstructorUsedError;
  Geo get geo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LiveHouseCopyWith<LiveHouse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiveHouseCopyWith<$Res> {
  factory $LiveHouseCopyWith(LiveHouse value, $Res Function(LiveHouse) then) =
      _$LiveHouseCopyWithImpl<$Res, LiveHouse>;
  @useResult
  $Res call(
      {String placeId,
      String name,
      String vicinity,
      String imageUrl,
      double distance,
      String prefectureValue,
      String facilityType,
      Geo geo});

  $GeoCopyWith<$Res> get geo;
}

/// @nodoc
class _$LiveHouseCopyWithImpl<$Res, $Val extends LiveHouse>
    implements $LiveHouseCopyWith<$Res> {
  _$LiveHouseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeId = null,
    Object? name = null,
    Object? vicinity = null,
    Object? imageUrl = null,
    Object? distance = null,
    Object? prefectureValue = null,
    Object? facilityType = null,
    Object? geo = null,
  }) {
    return _then(_value.copyWith(
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      vicinity: null == vicinity
          ? _value.vicinity
          : vicinity // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      prefectureValue: null == prefectureValue
          ? _value.prefectureValue
          : prefectureValue // ignore: cast_nullable_to_non_nullable
              as String,
      facilityType: null == facilityType
          ? _value.facilityType
          : facilityType // ignore: cast_nullable_to_non_nullable
              as String,
      geo: null == geo
          ? _value.geo
          : geo // ignore: cast_nullable_to_non_nullable
              as Geo,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GeoCopyWith<$Res> get geo {
    return $GeoCopyWith<$Res>(_value.geo, (value) {
      return _then(_value.copyWith(geo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_LiveHouseCopyWith<$Res> implements $LiveHouseCopyWith<$Res> {
  factory _$$_LiveHouseCopyWith(
          _$_LiveHouse value, $Res Function(_$_LiveHouse) then) =
      __$$_LiveHouseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String placeId,
      String name,
      String vicinity,
      String imageUrl,
      double distance,
      String prefectureValue,
      String facilityType,
      Geo geo});

  @override
  $GeoCopyWith<$Res> get geo;
}

/// @nodoc
class __$$_LiveHouseCopyWithImpl<$Res>
    extends _$LiveHouseCopyWithImpl<$Res, _$_LiveHouse>
    implements _$$_LiveHouseCopyWith<$Res> {
  __$$_LiveHouseCopyWithImpl(
      _$_LiveHouse _value, $Res Function(_$_LiveHouse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeId = null,
    Object? name = null,
    Object? vicinity = null,
    Object? imageUrl = null,
    Object? distance = null,
    Object? prefectureValue = null,
    Object? facilityType = null,
    Object? geo = null,
  }) {
    return _then(_$_LiveHouse(
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      vicinity: null == vicinity
          ? _value.vicinity
          : vicinity // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      prefectureValue: null == prefectureValue
          ? _value.prefectureValue
          : prefectureValue // ignore: cast_nullable_to_non_nullable
              as String,
      facilityType: null == facilityType
          ? _value.facilityType
          : facilityType // ignore: cast_nullable_to_non_nullable
              as String,
      geo: null == geo
          ? _value.geo
          : geo // ignore: cast_nullable_to_non_nullable
              as Geo,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LiveHouse implements _LiveHouse {
  _$_LiveHouse(
      {this.placeId = "",
      this.name = "",
      this.vicinity = "",
      this.imageUrl = "",
      this.distance = 0.0,
      this.prefectureValue = "",
      this.facilityType = "",
      required this.geo});

  factory _$_LiveHouse.fromJson(Map<String, dynamic> json) =>
      _$$_LiveHouseFromJson(json);

  @override
  @JsonKey()
  final String placeId;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String vicinity;
  @override
  @JsonKey()
  final String imageUrl;
  @override
  @JsonKey()
  final double distance;
  @override
  @JsonKey()
  final String prefectureValue;
  @override
  @JsonKey()
  final String facilityType;
  @override
  final Geo geo;

  @override
  String toString() {
    return 'LiveHouse(placeId: $placeId, name: $name, vicinity: $vicinity, imageUrl: $imageUrl, distance: $distance, prefectureValue: $prefectureValue, facilityType: $facilityType, geo: $geo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LiveHouse &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.vicinity, vicinity) ||
                other.vicinity == vicinity) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.prefectureValue, prefectureValue) ||
                other.prefectureValue == prefectureValue) &&
            (identical(other.facilityType, facilityType) ||
                other.facilityType == facilityType) &&
            (identical(other.geo, geo) || other.geo == geo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, placeId, name, vicinity,
      imageUrl, distance, prefectureValue, facilityType, geo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LiveHouseCopyWith<_$_LiveHouse> get copyWith =>
      __$$_LiveHouseCopyWithImpl<_$_LiveHouse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LiveHouseToJson(
      this,
    );
  }
}

abstract class _LiveHouse implements LiveHouse {
  factory _LiveHouse(
      {final String placeId,
      final String name,
      final String vicinity,
      final String imageUrl,
      final double distance,
      final String prefectureValue,
      final String facilityType,
      required final Geo geo}) = _$_LiveHouse;

  factory _LiveHouse.fromJson(Map<String, dynamic> json) =
      _$_LiveHouse.fromJson;

  @override
  String get placeId;
  @override
  String get name;
  @override
  String get vicinity;
  @override
  String get imageUrl;
  @override
  double get distance;
  @override
  String get prefectureValue;
  @override
  String get facilityType;
  @override
  Geo get geo;
  @override
  @JsonKey(ignore: true)
  _$$_LiveHouseCopyWith<_$_LiveHouse> get copyWith =>
      throw _privateConstructorUsedError;
}
