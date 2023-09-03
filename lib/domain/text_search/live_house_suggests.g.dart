// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_house_suggests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LiveHoueSuggests _$$_LiveHoueSuggestsFromJson(Map<String, dynamic> json) =>
    _$_LiveHoueSuggests(
      candidates: (json['candidates'] as List<dynamic>?)
              ?.map((e) => TextSearch.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_LiveHoueSuggestsToJson(_$_LiveHoueSuggests instance) =>
    <String, dynamic>{
      'candidates': instance.candidates,
    };
