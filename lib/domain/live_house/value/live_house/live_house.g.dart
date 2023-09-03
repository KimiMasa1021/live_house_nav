// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_house.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LiveHouse _$$_LiveHouseFromJson(Map<String, dynamic> json) => _$_LiveHouse(
      placeId: json['placeId'] as String? ?? "",
      name: json['name'] as String? ?? "",
      vicinity: json['vicinity'] as String? ?? "",
      imageUrl: json['imageUrl'] as String? ?? "",
      distance: (json['distance'] as num?)?.toDouble() ?? 0.0,
      prefectureValue: json['prefectureValue'] as String? ?? "",
      facilityType: json['facilityType'] as String? ?? "",
      geo: Geo.fromJson(json['geo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_LiveHouseToJson(_$_LiveHouse instance) =>
    <String, dynamic>{
      'placeId': instance.placeId,
      'name': instance.name,
      'vicinity': instance.vicinity,
      'imageUrl': instance.imageUrl,
      'distance': instance.distance,
      'prefectureValue': instance.prefectureValue,
      'facilityType': instance.facilityType,
      'geo': instance.geo,
    };
