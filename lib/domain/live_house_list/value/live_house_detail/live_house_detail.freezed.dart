// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_house_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LiveHouseDetail _$LiveHouseDetailFromJson(Map<String, dynamic> json) {
  return _LiveHouseDetail.fromJson(json);
}

/// @nodoc
mixin _$LiveHouseDetail {
  String get website => throw _privateConstructorUsedError;
  List<Photo> get photos => throw _privateConstructorUsedError;
  List<String> get imageList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LiveHouseDetailCopyWith<LiveHouseDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiveHouseDetailCopyWith<$Res> {
  factory $LiveHouseDetailCopyWith(
          LiveHouseDetail value, $Res Function(LiveHouseDetail) then) =
      _$LiveHouseDetailCopyWithImpl<$Res, LiveHouseDetail>;
  @useResult
  $Res call({String website, List<Photo> photos, List<String> imageList});
}

/// @nodoc
class _$LiveHouseDetailCopyWithImpl<$Res, $Val extends LiveHouseDetail>
    implements $LiveHouseDetailCopyWith<$Res> {
  _$LiveHouseDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? website = null,
    Object? photos = null,
    Object? imageList = null,
  }) {
    return _then(_value.copyWith(
      website: null == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String,
      photos: null == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<Photo>,
      imageList: null == imageList
          ? _value.imageList
          : imageList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LiveHouseDetailCopyWith<$Res>
    implements $LiveHouseDetailCopyWith<$Res> {
  factory _$$_LiveHouseDetailCopyWith(
          _$_LiveHouseDetail value, $Res Function(_$_LiveHouseDetail) then) =
      __$$_LiveHouseDetailCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String website, List<Photo> photos, List<String> imageList});
}

/// @nodoc
class __$$_LiveHouseDetailCopyWithImpl<$Res>
    extends _$LiveHouseDetailCopyWithImpl<$Res, _$_LiveHouseDetail>
    implements _$$_LiveHouseDetailCopyWith<$Res> {
  __$$_LiveHouseDetailCopyWithImpl(
      _$_LiveHouseDetail _value, $Res Function(_$_LiveHouseDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? website = null,
    Object? photos = null,
    Object? imageList = null,
  }) {
    return _then(_$_LiveHouseDetail(
      website: null == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String,
      photos: null == photos
          ? _value._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<Photo>,
      imageList: null == imageList
          ? _value._imageList
          : imageList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LiveHouseDetail implements _LiveHouseDetail {
  _$_LiveHouseDetail(
      {this.website = "",
      final List<Photo> photos = const [],
      final List<String> imageList = const []})
      : _photos = photos,
        _imageList = imageList;

  factory _$_LiveHouseDetail.fromJson(Map<String, dynamic> json) =>
      _$$_LiveHouseDetailFromJson(json);

  @override
  @JsonKey()
  final String website;
  final List<Photo> _photos;
  @override
  @JsonKey()
  List<Photo> get photos {
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photos);
  }

  final List<String> _imageList;
  @override
  @JsonKey()
  List<String> get imageList {
    if (_imageList is EqualUnmodifiableListView) return _imageList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageList);
  }

  @override
  String toString() {
    return 'LiveHouseDetail(website: $website, photos: $photos, imageList: $imageList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LiveHouseDetail &&
            (identical(other.website, website) || other.website == website) &&
            const DeepCollectionEquality().equals(other._photos, _photos) &&
            const DeepCollectionEquality()
                .equals(other._imageList, _imageList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      website,
      const DeepCollectionEquality().hash(_photos),
      const DeepCollectionEquality().hash(_imageList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LiveHouseDetailCopyWith<_$_LiveHouseDetail> get copyWith =>
      __$$_LiveHouseDetailCopyWithImpl<_$_LiveHouseDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LiveHouseDetailToJson(
      this,
    );
  }
}

abstract class _LiveHouseDetail implements LiveHouseDetail {
  factory _LiveHouseDetail(
      {final String website,
      final List<Photo> photos,
      final List<String> imageList}) = _$_LiveHouseDetail;

  factory _LiveHouseDetail.fromJson(Map<String, dynamic> json) =
      _$_LiveHouseDetail.fromJson;

  @override
  String get website;
  @override
  List<Photo> get photos;
  @override
  List<String> get imageList;
  @override
  @JsonKey(ignore: true)
  _$$_LiveHouseDetailCopyWith<_$_LiveHouseDetail> get copyWith =>
      throw _privateConstructorUsedError;
}
