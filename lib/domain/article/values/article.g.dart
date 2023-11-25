// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Article _$$_ArticleFromJson(Map<String, dynamic> json) => _$_Article(
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      artists: (json['artists'] as List<dynamic>?)
              ?.map((e) => Artist.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      placeId: json['placeId'] as String? ?? "",
      facilityName: json['facilityName'] as String? ?? "",
      text: json['text'] as String? ?? "",
      userId: json['userId'] as String? ?? "",
      docId: json['docId'] as String? ?? "",
      emojis: (json['emojis'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      minImageHeight: (json['minImageHeight'] as num?)?.toDouble() ?? 0,
      createdAt: const UpdatedAtField().fromJson(json['createdAt']),
      eventedAt: const UpdatedAtField().fromJson(json['eventedAt']),
    );

Map<String, dynamic> _$$_ArticleToJson(_$_Article instance) =>
    <String, dynamic>{
      'images': instance.images,
      'artists': instance.artists,
      'placeId': instance.placeId,
      'facilityName': instance.facilityName,
      'text': instance.text,
      'userId': instance.userId,
      'docId': instance.docId,
      'emojis': instance.emojis,
      'minImageHeight': instance.minImageHeight,
      'createdAt': const UpdatedAtField().toJson(instance.createdAt),
      'eventedAt': const UpdatedAtField().toJson(instance.eventedAt),
    };
