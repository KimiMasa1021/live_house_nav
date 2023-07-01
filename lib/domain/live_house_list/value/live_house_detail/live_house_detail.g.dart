// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_house_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LiveHouseDetail _$$_LiveHouseDetailFromJson(Map<String, dynamic> json) =>
    _$_LiveHouseDetail(
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
      openingHours:
          OpeingHours.fromJson(json['opening_hours'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_LiveHouseDetailToJson(_$_LiveHouseDetail instance) =>
    <String, dynamic>{
      'formatted_phone_number': instance.formattedPhoneNumber,
      'international_phone_number': instance.internationalPhoneNumber,
      'website': instance.website,
      'photos': instance.photos,
      'image_list': instance.imageList,
      'opening_hours': instance.openingHours,
    };
