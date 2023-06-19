// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_house_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LiveHouseList _$LiveHouseListFromJson(Map<String, dynamic> json) {
  return _LiveHouseList.fromJson(json);
}

/// @nodoc
mixin _$LiveHouseList {
  List<LiveHouse> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LiveHouseListCopyWith<LiveHouseList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiveHouseListCopyWith<$Res> {
  factory $LiveHouseListCopyWith(
          LiveHouseList value, $Res Function(LiveHouseList) then) =
      _$LiveHouseListCopyWithImpl<$Res, LiveHouseList>;
  @useResult
  $Res call({List<LiveHouse> results});
}

/// @nodoc
class _$LiveHouseListCopyWithImpl<$Res, $Val extends LiveHouseList>
    implements $LiveHouseListCopyWith<$Res> {
  _$LiveHouseListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<LiveHouse>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LiveHouseListCopyWith<$Res>
    implements $LiveHouseListCopyWith<$Res> {
  factory _$$_LiveHouseListCopyWith(
          _$_LiveHouseList value, $Res Function(_$_LiveHouseList) then) =
      __$$_LiveHouseListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<LiveHouse> results});
}

/// @nodoc
class __$$_LiveHouseListCopyWithImpl<$Res>
    extends _$LiveHouseListCopyWithImpl<$Res, _$_LiveHouseList>
    implements _$$_LiveHouseListCopyWith<$Res> {
  __$$_LiveHouseListCopyWithImpl(
      _$_LiveHouseList _value, $Res Function(_$_LiveHouseList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
  }) {
    return _then(_$_LiveHouseList(
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<LiveHouse>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LiveHouseList implements _LiveHouseList {
  _$_LiveHouseList({final List<LiveHouse> results = const []})
      : _results = results;

  factory _$_LiveHouseList.fromJson(Map<String, dynamic> json) =>
      _$$_LiveHouseListFromJson(json);

  final List<LiveHouse> _results;
  @override
  @JsonKey()
  List<LiveHouse> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'LiveHouseList(results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LiveHouseList &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LiveHouseListCopyWith<_$_LiveHouseList> get copyWith =>
      __$$_LiveHouseListCopyWithImpl<_$_LiveHouseList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LiveHouseListToJson(
      this,
    );
  }
}

abstract class _LiveHouseList implements LiveHouseList {
  factory _LiveHouseList({final List<LiveHouse> results}) = _$_LiveHouseList;

  factory _LiveHouseList.fromJson(Map<String, dynamic> json) =
      _$_LiveHouseList.fromJson;

  @override
  List<LiveHouse> get results;
  @override
  @JsonKey(ignore: true)
  _$$_LiveHouseListCopyWith<_$_LiveHouseList> get copyWith =>
      throw _privateConstructorUsedError;
}
