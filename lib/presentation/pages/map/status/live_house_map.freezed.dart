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
  LiveHouseList get results => throw _privateConstructorUsedError;
  GoogleMapController? get controller => throw _privateConstructorUsedError;

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
  $Res call({LiveHouseList results, GoogleMapController? controller});

  $LiveHouseListCopyWith<$Res> get results;
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
    Object? results = null,
    Object? controller = freezed,
  }) {
    return _then(_value.copyWith(
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as LiveHouseList,
      controller: freezed == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as GoogleMapController?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LiveHouseListCopyWith<$Res> get results {
    return $LiveHouseListCopyWith<$Res>(_value.results, (value) {
      return _then(_value.copyWith(results: value) as $Val);
    });
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
  $Res call({LiveHouseList results, GoogleMapController? controller});

  @override
  $LiveHouseListCopyWith<$Res> get results;
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
    Object? results = null,
    Object? controller = freezed,
  }) {
    return _then(_$_LiveHouseMap(
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as LiveHouseList,
      controller: freezed == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as GoogleMapController?,
    ));
  }
}

/// @nodoc

class _$_LiveHouseMap implements _LiveHouseMap {
  _$_LiveHouseMap({required this.results, this.controller = null});

  @override
  final LiveHouseList results;
  @override
  @JsonKey()
  final GoogleMapController? controller;

  @override
  String toString() {
    return 'LiveHouseMap(results: $results, controller: $controller)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LiveHouseMap &&
            (identical(other.results, results) || other.results == results) &&
            (identical(other.controller, controller) ||
                other.controller == controller));
  }

  @override
  int get hashCode => Object.hash(runtimeType, results, controller);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LiveHouseMapCopyWith<_$_LiveHouseMap> get copyWith =>
      __$$_LiveHouseMapCopyWithImpl<_$_LiveHouseMap>(this, _$identity);
}

abstract class _LiveHouseMap implements LiveHouseMap {
  factory _LiveHouseMap(
      {required final LiveHouseList results,
      final GoogleMapController? controller}) = _$_LiveHouseMap;

  @override
  LiveHouseList get results;
  @override
  GoogleMapController? get controller;
  @override
  @JsonKey(ignore: true)
  _$$_LiveHouseMapCopyWith<_$_LiveHouseMap> get copyWith =>
      throw _privateConstructorUsedError;
}
