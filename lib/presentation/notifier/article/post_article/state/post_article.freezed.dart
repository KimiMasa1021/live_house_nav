// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_article.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PostArticle {
  List<File> get pickedImages => throw _privateConstructorUsedError;
  Artists get artists => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PostArticleCopyWith<PostArticle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostArticleCopyWith<$Res> {
  factory $PostArticleCopyWith(
          PostArticle value, $Res Function(PostArticle) then) =
      _$PostArticleCopyWithImpl<$Res, PostArticle>;
  @useResult
  $Res call({List<File> pickedImages, Artists artists, String text});

  $ArtistsCopyWith<$Res> get artists;
}

/// @nodoc
class _$PostArticleCopyWithImpl<$Res, $Val extends PostArticle>
    implements $PostArticleCopyWith<$Res> {
  _$PostArticleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pickedImages = null,
    Object? artists = null,
    Object? text = null,
  }) {
    return _then(_value.copyWith(
      pickedImages: null == pickedImages
          ? _value.pickedImages
          : pickedImages // ignore: cast_nullable_to_non_nullable
              as List<File>,
      artists: null == artists
          ? _value.artists
          : artists // ignore: cast_nullable_to_non_nullable
              as Artists,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ArtistsCopyWith<$Res> get artists {
    return $ArtistsCopyWith<$Res>(_value.artists, (value) {
      return _then(_value.copyWith(artists: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PostArticleCopyWith<$Res>
    implements $PostArticleCopyWith<$Res> {
  factory _$$_PostArticleCopyWith(
          _$_PostArticle value, $Res Function(_$_PostArticle) then) =
      __$$_PostArticleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<File> pickedImages, Artists artists, String text});

  @override
  $ArtistsCopyWith<$Res> get artists;
}

/// @nodoc
class __$$_PostArticleCopyWithImpl<$Res>
    extends _$PostArticleCopyWithImpl<$Res, _$_PostArticle>
    implements _$$_PostArticleCopyWith<$Res> {
  __$$_PostArticleCopyWithImpl(
      _$_PostArticle _value, $Res Function(_$_PostArticle) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pickedImages = null,
    Object? artists = null,
    Object? text = null,
  }) {
    return _then(_$_PostArticle(
      pickedImages: null == pickedImages
          ? _value._pickedImages
          : pickedImages // ignore: cast_nullable_to_non_nullable
              as List<File>,
      artists: null == artists
          ? _value.artists
          : artists // ignore: cast_nullable_to_non_nullable
              as Artists,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PostArticle implements _PostArticle {
  _$_PostArticle(
      {final List<File> pickedImages = const [],
      required this.artists,
      this.text = ""})
      : _pickedImages = pickedImages;

  final List<File> _pickedImages;
  @override
  @JsonKey()
  List<File> get pickedImages {
    if (_pickedImages is EqualUnmodifiableListView) return _pickedImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pickedImages);
  }

  @override
  final Artists artists;
  @override
  @JsonKey()
  final String text;

  @override
  String toString() {
    return 'PostArticle(pickedImages: $pickedImages, artists: $artists, text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostArticle &&
            const DeepCollectionEquality()
                .equals(other._pickedImages, _pickedImages) &&
            (identical(other.artists, artists) || other.artists == artists) &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_pickedImages), artists, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostArticleCopyWith<_$_PostArticle> get copyWith =>
      __$$_PostArticleCopyWithImpl<_$_PostArticle>(this, _$identity);
}

abstract class _PostArticle implements PostArticle {
  factory _PostArticle(
      {final List<File> pickedImages,
      required final Artists artists,
      final String text}) = _$_PostArticle;

  @override
  List<File> get pickedImages;
  @override
  Artists get artists;
  @override
  String get text;
  @override
  @JsonKey(ignore: true)
  _$$_PostArticleCopyWith<_$_PostArticle> get copyWith =>
      throw _privateConstructorUsedError;
}