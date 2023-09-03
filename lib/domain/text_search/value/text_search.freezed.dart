// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'text_search.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TextSearch _$TextSearchFromJson(Map<String, dynamic> json) {
  return _TextSearch.fromJson(json);
}

/// @nodoc
mixin _$TextSearch {
  String get name => throw _privateConstructorUsedError;
  String get place_id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TextSearchCopyWith<TextSearch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextSearchCopyWith<$Res> {
  factory $TextSearchCopyWith(
          TextSearch value, $Res Function(TextSearch) then) =
      _$TextSearchCopyWithImpl<$Res, TextSearch>;
  @useResult
  $Res call({String name, String place_id});
}

/// @nodoc
class _$TextSearchCopyWithImpl<$Res, $Val extends TextSearch>
    implements $TextSearchCopyWith<$Res> {
  _$TextSearchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? place_id = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      place_id: null == place_id
          ? _value.place_id
          : place_id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TextSearchCopyWith<$Res>
    implements $TextSearchCopyWith<$Res> {
  factory _$$_TextSearchCopyWith(
          _$_TextSearch value, $Res Function(_$_TextSearch) then) =
      __$$_TextSearchCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String place_id});
}

/// @nodoc
class __$$_TextSearchCopyWithImpl<$Res>
    extends _$TextSearchCopyWithImpl<$Res, _$_TextSearch>
    implements _$$_TextSearchCopyWith<$Res> {
  __$$_TextSearchCopyWithImpl(
      _$_TextSearch _value, $Res Function(_$_TextSearch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? place_id = null,
  }) {
    return _then(_$_TextSearch(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      place_id: null == place_id
          ? _value.place_id
          : place_id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TextSearch implements _TextSearch {
  _$_TextSearch({this.name = "", this.place_id = ""});

  factory _$_TextSearch.fromJson(Map<String, dynamic> json) =>
      _$$_TextSearchFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String place_id;

  @override
  String toString() {
    return 'TextSearch(name: $name, place_id: $place_id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TextSearch &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.place_id, place_id) ||
                other.place_id == place_id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, place_id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TextSearchCopyWith<_$_TextSearch> get copyWith =>
      __$$_TextSearchCopyWithImpl<_$_TextSearch>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TextSearchToJson(
      this,
    );
  }
}

abstract class _TextSearch implements TextSearch {
  factory _TextSearch({final String name, final String place_id}) =
      _$_TextSearch;

  factory _TextSearch.fromJson(Map<String, dynamic> json) =
      _$_TextSearch.fromJson;

  @override
  String get name;
  @override
  String get place_id;
  @override
  @JsonKey(ignore: true)
  _$$_TextSearchCopyWith<_$_TextSearch> get copyWith =>
      throw _privateConstructorUsedError;
}
