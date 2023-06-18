// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_house_map.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LiveHouseList _$$_LiveHouseListFromJson(Map<String, dynamic> json) =>
    _$_LiveHouseList(
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => LiveHouse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_LiveHouseListToJson(_$_LiveHouseList instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
