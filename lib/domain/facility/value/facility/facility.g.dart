// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Facility _$$_FacilityFromJson(Map<String, dynamic> json) => _$_Facility(
      placeId: json['placeId'] as String? ?? "",
      name: json['name'] as String? ?? "",
      vicinity: json['vicinity'] as String? ?? "",
      imageUrl: json['imageUrl'] as String? ?? "",
      distance: (json['distance'] as num?)?.toDouble() ?? 0.0,
      prefectureValue: json['prefectureValue'] as String? ?? "",
      facilityType: json['facilityType'] as String? ?? "",
      geo: Geo.fromJson(json['geo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_FacilityToJson(_$_Facility instance) =>
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
