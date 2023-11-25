// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emoji_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EmojiState _$$_EmojiStateFromJson(Map<String, dynamic> json) =>
    _$_EmojiState(
      articleRef: json['articleRef'] as String? ?? "",
      docId: json['docId'] as String? ?? "",
      emoji: json['emoji'] as String? ?? "",
      userList: (json['userList'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_EmojiStateToJson(_$_EmojiState instance) =>
    <String, dynamic>{
      'articleRef': instance.articleRef,
      'docId': instance.docId,
      'emoji': instance.emoji,
      'userList': instance.userList,
    };
