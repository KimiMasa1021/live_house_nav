// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_house.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LiveHouse _$$_LiveHouseFromJson(Map<String, dynamic> json) => _$_LiveHouse(
      placeId: json['place_id'] as String,
      name: json['name'] as String,
      vicinity: json['vicinity'] as String,
      imageUrl: json['image_url'] as String? ?? "",
      reference: json['reference'] as String,
      geometry: Geometry.fromJson(json['geometry'] as Map<String, dynamic>),
      photos: (json['photos'] as List<dynamic>?)
              ?.map((e) => Photo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_LiveHouseToJson(_$_LiveHouse instance) =>
    <String, dynamic>{
      'place_id': instance.placeId,
      'name': instance.name,
      'vicinity': instance.vicinity,
      'image_url': instance.imageUrl,
      'reference': instance.reference,
      'geometry': instance.geometry,
      'photos': instance.photos,
    };
