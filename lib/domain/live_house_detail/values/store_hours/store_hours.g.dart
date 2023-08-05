// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_hours.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StoreHours _$$_StoreHoursFromJson(Map<String, dynamic> json) =>
    _$_StoreHours(
      open: BusinessHour.fromJson(json['open'] as Map<String, dynamic>),
      close: BusinessHour.fromJson(json['close'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_StoreHoursToJson(_$_StoreHours instance) =>
    <String, dynamic>{
      'open': instance.open,
      'close': instance.close,
    };
