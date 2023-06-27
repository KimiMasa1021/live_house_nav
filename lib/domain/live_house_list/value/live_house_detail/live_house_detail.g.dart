// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_house_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LiveHouseDetail _$$_LiveHouseDetailFromJson(Map<String, dynamic> json) =>
    _$_LiveHouseDetail(
      website: json['website'] as String? ?? "",
      photos: (json['photos'] as List<dynamic>?)
              ?.map((e) => Photo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      imageList: (json['imageList'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_LiveHouseDetailToJson(_$_LiveHouseDetail instance) =>
    <String, dynamic>{
      'website': instance.website,
      'photos': instance.photos,
      'imageList': instance.imageList,
    };
