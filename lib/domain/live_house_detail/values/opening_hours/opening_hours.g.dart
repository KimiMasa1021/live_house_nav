// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opening_hours.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OpeingHours _$$_OpeingHoursFromJson(Map<String, dynamic> json) =>
    _$_OpeingHours(
      openNow: json['open_now'] as bool? ?? false,
      periods: (json['periods'] as List<dynamic>?)
              ?.map((e) => StoreHours.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_OpeingHoursToJson(_$_OpeingHours instance) =>
    <String, dynamic>{
      'open_now': instance.openNow,
      'periods': instance.periods,
    };
