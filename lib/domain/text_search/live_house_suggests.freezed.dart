// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_house_suggests.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LiveHoueSuggests _$LiveHoueSuggestsFromJson(Map<String, dynamic> json) {
  return _LiveHoueSuggests.fromJson(json);
}

/// @nodoc
mixin _$LiveHoueSuggests {
  List<TextSearch> get candidates => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LiveHoueSuggestsCopyWith<LiveHoueSuggests> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiveHoueSuggestsCopyWith<$Res> {
  factory $LiveHoueSuggestsCopyWith(
          LiveHoueSuggests value, $Res Function(LiveHoueSuggests) then) =
      _$LiveHoueSuggestsCopyWithImpl<$Res, LiveHoueSuggests>;
  @useResult
  $Res call({List<TextSearch> candidates});
}

/// @nodoc
class _$LiveHoueSuggestsCopyWithImpl<$Res, $Val extends LiveHoueSuggests>
    implements $LiveHoueSuggestsCopyWith<$Res> {
  _$LiveHoueSuggestsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? candidates = null,
  }) {
    return _then(_value.copyWith(
      candidates: null == candidates
          ? _value.candidates
          : candidates // ignore: cast_nullable_to_non_nullable
              as List<TextSearch>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LiveHoueSuggestsCopyWith<$Res>
    implements $LiveHoueSuggestsCopyWith<$Res> {
  factory _$$_LiveHoueSuggestsCopyWith(
          _$_LiveHoueSuggests value, $Res Function(_$_LiveHoueSuggests) then) =
      __$$_LiveHoueSuggestsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TextSearch> candidates});
}

/// @nodoc
class __$$_LiveHoueSuggestsCopyWithImpl<$Res>
    extends _$LiveHoueSuggestsCopyWithImpl<$Res, _$_LiveHoueSuggests>
    implements _$$_LiveHoueSuggestsCopyWith<$Res> {
  __$$_LiveHoueSuggestsCopyWithImpl(
      _$_LiveHoueSuggests _value, $Res Function(_$_LiveHoueSuggests) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? candidates = null,
  }) {
    return _then(_$_LiveHoueSuggests(
      candidates: null == candidates
          ? _value._candidates
          : candidates // ignore: cast_nullable_to_non_nullable
              as List<TextSearch>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LiveHoueSuggests implements _LiveHoueSuggests {
  _$_LiveHoueSuggests({final List<TextSearch> candidates = const []})
      : _candidates = candidates;

  factory _$_LiveHoueSuggests.fromJson(Map<String, dynamic> json) =>
      _$$_LiveHoueSuggestsFromJson(json);

  final List<TextSearch> _candidates;
  @override
  @JsonKey()
  List<TextSearch> get candidates {
    if (_candidates is EqualUnmodifiableListView) return _candidates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_candidates);
  }

  @override
  String toString() {
    return 'LiveHoueSuggests(candidates: $candidates)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LiveHoueSuggests &&
            const DeepCollectionEquality()
                .equals(other._candidates, _candidates));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_candidates));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LiveHoueSuggestsCopyWith<_$_LiveHoueSuggests> get copyWith =>
      __$$_LiveHoueSuggestsCopyWithImpl<_$_LiveHoueSuggests>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LiveHoueSuggestsToJson(
      this,
    );
  }
}

abstract class _LiveHoueSuggests implements LiveHoueSuggests {
  factory _LiveHoueSuggests({final List<TextSearch> candidates}) =
      _$_LiveHoueSuggests;

  factory _LiveHoueSuggests.fromJson(Map<String, dynamic> json) =
      _$_LiveHoueSuggests.fromJson;

  @override
  List<TextSearch> get candidates;
  @override
  @JsonKey(ignore: true)
  _$$_LiveHoueSuggestsCopyWith<_$_LiveHoueSuggests> get copyWith =>
      throw _privateConstructorUsedError;
}
