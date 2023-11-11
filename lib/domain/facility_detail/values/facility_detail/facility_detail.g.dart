// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FacilityDetail _$$_FacilityDetailFromJson(Map<String, dynamic> json) =>
    _$_FacilityDetail(
      placeId: json['place_id'] as String? ?? "",
      name: json['name'] as String? ?? "",
      vicinity: json['vicinity'] as String? ?? "",
      formattedPhoneNumber: json['formatted_phone_number'] as String? ?? "",
      internationalPhoneNumber:
          json['international_phone_number'] as String? ?? "",
      website: json['website'] as String? ?? "",
      photos: (json['photos'] as List<dynamic>?)
              ?.map((e) => Photo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      imageList: (json['image_list'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      openingHours: json['opening_hours'] == null
          ? null
          : OpeingHours.fromJson(json['opening_hours'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_FacilityDetailToJson(_$_FacilityDetail instance) =>
    <String, dynamic>{
      'place_id': instance.placeId,
      'name': instance.name,
      'vicinity': instance.vicinity,
      'formatted_phone_number': instance.formattedPhoneNumber,
      'international_phone_number': instance.internationalPhoneNumber,
      'website': instance.website,
      'photos': instance.photos,
      'image_list': instance.imageList,
      'opening_hours': instance.openingHours,
    };
