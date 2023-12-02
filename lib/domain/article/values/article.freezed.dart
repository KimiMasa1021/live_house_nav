// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'article.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Article _$ArticleFromJson(Map<String, dynamic> json) {
  return _Article.fromJson(json);
}

/// @nodoc
mixin _$Article {
  List<String> get images => throw _privateConstructorUsedError;
  List<Artist> get artists => throw _privateConstructorUsedError;
  String get placeId => throw _privateConstructorUsedError;
  String get facilityName => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get docId => throw _privateConstructorUsedError;
  List<String> get emojis => throw _privateConstructorUsedError;
  double get minImageHeight => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get eventedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArticleCopyWith<Article> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleCopyWith<$Res> {
  factory $ArticleCopyWith(Article value, $Res Function(Article) then) =
      _$ArticleCopyWithImpl<$Res, Article>;
  @useResult
  $Res call(
      {List<String> images,
      List<Artist> artists,
      String placeId,
      String facilityName,
      String text,
      String userId,
      String docId,
      List<String> emojis,
      double minImageHeight,
      @TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? eventedAt});
}

/// @nodoc
class _$ArticleCopyWithImpl<$Res, $Val extends Article>
    implements $ArticleCopyWith<$Res> {
  _$ArticleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? images = null,
    Object? artists = null,
    Object? placeId = null,
    Object? facilityName = null,
    Object? text = null,
    Object? userId = null,
    Object? docId = null,
    Object? emojis = null,
    Object? minImageHeight = null,
    Object? createdAt = freezed,
    Object? eventedAt = freezed,
  }) {
    return _then(_value.copyWith(
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      artists: null == artists
          ? _value.artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<Artist>,
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String,
      facilityName: null == facilityName
          ? _value.facilityName
          : facilityName // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      docId: null == docId
          ? _value.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String,
      emojis: null == emojis
          ? _value.emojis
          : emojis // ignore: cast_nullable_to_non_nullable
              as List<String>,
      minImageHeight: null == minImageHeight
          ? _value.minImageHeight
          : minImageHeight // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      eventedAt: freezed == eventedAt
          ? _value.eventedAt
          : eventedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ArticleCopyWith<$Res> implements $ArticleCopyWith<$Res> {
  factory _$$_ArticleCopyWith(
          _$_Article value, $Res Function(_$_Article) then) =
      __$$_ArticleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> images,
      List<Artist> artists,
      String placeId,
      String facilityName,
      String text,
      String userId,
      String docId,
      List<String> emojis,
      double minImageHeight,
      @TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? eventedAt});
}

/// @nodoc
class __$$_ArticleCopyWithImpl<$Res>
    extends _$ArticleCopyWithImpl<$Res, _$_Article>
    implements _$$_ArticleCopyWith<$Res> {
  __$$_ArticleCopyWithImpl(_$_Article _value, $Res Function(_$_Article) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? images = null,
    Object? artists = null,
    Object? placeId = null,
    Object? facilityName = null,
    Object? text = null,
    Object? userId = null,
    Object? docId = null,
    Object? emojis = null,
    Object? minImageHeight = null,
    Object? createdAt = freezed,
    Object? eventedAt = freezed,
  }) {
    return _then(_$_Article(
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      artists: null == artists
          ? _value._artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<Artist>,
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String,
      facilityName: null == facilityName
          ? _value.facilityName
          : facilityName // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      docId: null == docId
          ? _value.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String,
      emojis: null == emojis
          ? _value._emojis
          : emojis // ignore: cast_nullable_to_non_nullable
              as List<String>,
      minImageHeight: null == minImageHeight
          ? _value.minImageHeight
          : minImageHeight // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      eventedAt: freezed == eventedAt
          ? _value.eventedAt
          : eventedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Article implements _Article {
  _$_Article(
      {final List<String> images = const [],
      final List<Artist> artists = const [],
      this.placeId = "",
      this.facilityName = "",
      this.text = "",
      this.userId = "",
      this.docId = "",
      final List<String> emojis = const [],
      this.minImageHeight = 0,
      @TimestampConverter() this.createdAt,
      @TimestampConverter() this.eventedAt})
      : _images = images,
        _artists = artists,
        _emojis = emojis;

  factory _$_Article.fromJson(Map<String, dynamic> json) =>
      _$$_ArticleFromJson(json);

  final List<String> _images;
  @override
  @JsonKey()
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  final List<Artist> _artists;
  @override
  @JsonKey()
  List<Artist> get artists {
    if (_artists is EqualUnmodifiableListView) return _artists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_artists);
  }

  @override
  @JsonKey()
  final String placeId;
  @override
  @JsonKey()
  final String facilityName;
  @override
  @JsonKey()
  final String text;
  @override
  @JsonKey()
  final String userId;
  @override
  @JsonKey()
  final String docId;
  final List<String> _emojis;
  @override
  @JsonKey()
  List<String> get emojis {
    if (_emojis is EqualUnmodifiableListView) return _emojis;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_emojis);
  }

  @override
  @JsonKey()
  final double minImageHeight;
  @override
  @TimestampConverter()
  final DateTime? createdAt;
  @override
  @TimestampConverter()
  final DateTime? eventedAt;

  @override
  String toString() {
    return 'Article(images: $images, artists: $artists, placeId: $placeId, facilityName: $facilityName, text: $text, userId: $userId, docId: $docId, emojis: $emojis, minImageHeight: $minImageHeight, createdAt: $createdAt, eventedAt: $eventedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Article &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality().equals(other._artists, _artists) &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            (identical(other.facilityName, facilityName) ||
                other.facilityName == facilityName) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.docId, docId) || other.docId == docId) &&
            const DeepCollectionEquality().equals(other._emojis, _emojis) &&
            (identical(other.minImageHeight, minImageHeight) ||
                other.minImageHeight == minImageHeight) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.eventedAt, eventedAt) ||
                other.eventedAt == eventedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_images),
      const DeepCollectionEquality().hash(_artists),
      placeId,
      facilityName,
      text,
      userId,
      docId,
      const DeepCollectionEquality().hash(_emojis),
      minImageHeight,
      createdAt,
      eventedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ArticleCopyWith<_$_Article> get copyWith =>
      __$$_ArticleCopyWithImpl<_$_Article>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ArticleToJson(
      this,
    );
  }
}

abstract class _Article implements Article {
  factory _Article(
      {final List<String> images,
      final List<Artist> artists,
      final String placeId,
      final String facilityName,
      final String text,
      final String userId,
      final String docId,
      final List<String> emojis,
      final double minImageHeight,
      @TimestampConverter() final DateTime? createdAt,
      @TimestampConverter() final DateTime? eventedAt}) = _$_Article;

  factory _Article.fromJson(Map<String, dynamic> json) = _$_Article.fromJson;

  @override
  List<String> get images;
  @override
  List<Artist> get artists;
  @override
  String get placeId;
  @override
  String get facilityName;
  @override
  String get text;
  @override
  String get userId;
  @override
  String get docId;
  @override
  List<String> get emojis;
  @override
  double get minImageHeight;
  @override
  @TimestampConverter()
  DateTime? get createdAt;
  @override
  @TimestampConverter()
  DateTime? get eventedAt;
  @override
  @JsonKey(ignore: true)
  _$$_ArticleCopyWith<_$_Article> get copyWith =>
      throw _privateConstructorUsedError;
}
