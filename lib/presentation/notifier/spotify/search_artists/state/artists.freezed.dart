// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'artists.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Artists _$ArtistsFromJson(Map<String, dynamic> json) {
  return _Artists.fromJson(json);
}

/// @nodoc
mixin _$Artists {
  List<Artist> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArtistsCopyWith<Artists> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtistsCopyWith<$Res> {
  factory $ArtistsCopyWith(Artists value, $Res Function(Artists) then) =
      _$ArtistsCopyWithImpl<$Res, Artists>;
  @useResult
  $Res call({List<Artist> items});
}

/// @nodoc
class _$ArtistsCopyWithImpl<$Res, $Val extends Artists>
    implements $ArtistsCopyWith<$Res> {
  _$ArtistsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Artist>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ArtistsCopyWith<$Res> implements $ArtistsCopyWith<$Res> {
  factory _$$_ArtistsCopyWith(
          _$_Artists value, $Res Function(_$_Artists) then) =
      __$$_ArtistsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Artist> items});
}

/// @nodoc
class __$$_ArtistsCopyWithImpl<$Res>
    extends _$ArtistsCopyWithImpl<$Res, _$_Artists>
    implements _$$_ArtistsCopyWith<$Res> {
  __$$_ArtistsCopyWithImpl(_$_Artists _value, $Res Function(_$_Artists) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$_Artists(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Artist>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Artists implements _Artists {
  _$_Artists({final List<Artist> items = const []}) : _items = items;

  factory _$_Artists.fromJson(Map<String, dynamic> json) =>
      _$$_ArtistsFromJson(json);

  final List<Artist> _items;
  @override
  @JsonKey()
  List<Artist> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'Artists(items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Artists &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ArtistsCopyWith<_$_Artists> get copyWith =>
      __$$_ArtistsCopyWithImpl<_$_Artists>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ArtistsToJson(
      this,
    );
  }
}

abstract class _Artists implements Artists {
  factory _Artists({final List<Artist> items}) = _$_Artists;

  factory _Artists.fromJson(Map<String, dynamic> json) = _$_Artists.fromJson;

  @override
  List<Artist> get items;
  @override
  @JsonKey(ignore: true)
  _$$_ArtistsCopyWith<_$_Artists> get copyWith =>
      throw _privateConstructorUsedError;
}
