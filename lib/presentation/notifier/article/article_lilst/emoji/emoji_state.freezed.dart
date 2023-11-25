// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'emoji_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EmojiState _$EmojiStateFromJson(Map<String, dynamic> json) {
  return _EmojiState.fromJson(json);
}

/// @nodoc
mixin _$EmojiState {
  String get articleRef => throw _privateConstructorUsedError;
  String get docId => throw _privateConstructorUsedError;
  String get emoji => throw _privateConstructorUsedError;
  List<String> get userList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmojiStateCopyWith<EmojiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmojiStateCopyWith<$Res> {
  factory $EmojiStateCopyWith(
          EmojiState value, $Res Function(EmojiState) then) =
      _$EmojiStateCopyWithImpl<$Res, EmojiState>;
  @useResult
  $Res call(
      {String articleRef, String docId, String emoji, List<String> userList});
}

/// @nodoc
class _$EmojiStateCopyWithImpl<$Res, $Val extends EmojiState>
    implements $EmojiStateCopyWith<$Res> {
  _$EmojiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articleRef = null,
    Object? docId = null,
    Object? emoji = null,
    Object? userList = null,
  }) {
    return _then(_value.copyWith(
      articleRef: null == articleRef
          ? _value.articleRef
          : articleRef // ignore: cast_nullable_to_non_nullable
              as String,
      docId: null == docId
          ? _value.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String,
      emoji: null == emoji
          ? _value.emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as String,
      userList: null == userList
          ? _value.userList
          : userList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EmojiStateCopyWith<$Res>
    implements $EmojiStateCopyWith<$Res> {
  factory _$$_EmojiStateCopyWith(
          _$_EmojiState value, $Res Function(_$_EmojiState) then) =
      __$$_EmojiStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String articleRef, String docId, String emoji, List<String> userList});
}

/// @nodoc
class __$$_EmojiStateCopyWithImpl<$Res>
    extends _$EmojiStateCopyWithImpl<$Res, _$_EmojiState>
    implements _$$_EmojiStateCopyWith<$Res> {
  __$$_EmojiStateCopyWithImpl(
      _$_EmojiState _value, $Res Function(_$_EmojiState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articleRef = null,
    Object? docId = null,
    Object? emoji = null,
    Object? userList = null,
  }) {
    return _then(_$_EmojiState(
      articleRef: null == articleRef
          ? _value.articleRef
          : articleRef // ignore: cast_nullable_to_non_nullable
              as String,
      docId: null == docId
          ? _value.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String,
      emoji: null == emoji
          ? _value.emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as String,
      userList: null == userList
          ? _value._userList
          : userList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EmojiState implements _EmojiState {
  _$_EmojiState(
      {this.articleRef = "",
      this.docId = "",
      this.emoji = "",
      final List<String> userList = const []})
      : _userList = userList;

  factory _$_EmojiState.fromJson(Map<String, dynamic> json) =>
      _$$_EmojiStateFromJson(json);

  @override
  @JsonKey()
  final String articleRef;
  @override
  @JsonKey()
  final String docId;
  @override
  @JsonKey()
  final String emoji;
  final List<String> _userList;
  @override
  @JsonKey()
  List<String> get userList {
    if (_userList is EqualUnmodifiableListView) return _userList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userList);
  }

  @override
  String toString() {
    return 'EmojiState(articleRef: $articleRef, docId: $docId, emoji: $emoji, userList: $userList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EmojiState &&
            (identical(other.articleRef, articleRef) ||
                other.articleRef == articleRef) &&
            (identical(other.docId, docId) || other.docId == docId) &&
            (identical(other.emoji, emoji) || other.emoji == emoji) &&
            const DeepCollectionEquality().equals(other._userList, _userList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, articleRef, docId, emoji,
      const DeepCollectionEquality().hash(_userList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EmojiStateCopyWith<_$_EmojiState> get copyWith =>
      __$$_EmojiStateCopyWithImpl<_$_EmojiState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EmojiStateToJson(
      this,
    );
  }
}

abstract class _EmojiState implements EmojiState {
  factory _EmojiState(
      {final String articleRef,
      final String docId,
      final String emoji,
      final List<String> userList}) = _$_EmojiState;

  factory _EmojiState.fromJson(Map<String, dynamic> json) =
      _$_EmojiState.fromJson;

  @override
  String get articleRef;
  @override
  String get docId;
  @override
  String get emoji;
  @override
  List<String> get userList;
  @override
  @JsonKey(ignore: true)
  _$$_EmojiStateCopyWith<_$_EmojiState> get copyWith =>
      throw _privateConstructorUsedError;
}
