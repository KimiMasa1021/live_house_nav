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
  String get reference => throw _privateConstructorUsedError;
  Geometry get geometry => throw _privateConstructorUsedError;

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
      String reference,
      Geometry geometry});

  $GeometryCopyWith<$Res> get geometry;
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
    Object? reference = null,
    Object? geometry = null,
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
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      geometry: null == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as Geometry,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GeometryCopyWith<$Res> get geometry {
    return $GeometryCopyWith<$Res>(_value.geometry, (value) {
      return _then(_value.copyWith(geometry: value) as $Val);
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
      String reference,
      Geometry geometry});

  @override
  $GeometryCopyWith<$Res> get geometry;
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
    Object? reference = null,
    Object? geometry = null,
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
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      geometry: null == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as Geometry,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_LiveHouse implements _LiveHouse {
  _$_LiveHouse(
      {required this.placeId,
      required this.name,
      required this.vicinity,
      required this.reference,
      required this.geometry});

  factory _$_LiveHouse.fromJson(Map<String, dynamic> json) =>
      _$$_LiveHouseFromJson(json);

  @override
  final String placeId;
  @override
  final String name;
  @override
  final String vicinity;
  @override
  final String reference;
  @override
  final Geometry geometry;

  @override
  String toString() {
    return 'LiveHouse(placeId: $placeId, name: $name, vicinity: $vicinity, reference: $reference, geometry: $geometry)';
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
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.geometry, geometry) ||
                other.geometry == geometry));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, placeId, name, vicinity, reference, geometry);

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
      {required final String placeId,
      required final String name,
      required final String vicinity,
      required final String reference,
      required final Geometry geometry}) = _$_LiveHouse;

  factory _LiveHouse.fromJson(Map<String, dynamic> json) =
      _$_LiveHouse.fromJson;

  @override
  String get placeId;
  @override
  String get name;
  @override
  String get vicinity;
  @override
  String get reference;
  @override
  Geometry get geometry;
  @override
  @JsonKey(ignore: true)
  _$$_LiveHouseCopyWith<_$_LiveHouse> get copyWith =>
      throw _privateConstructorUsedError;
}
