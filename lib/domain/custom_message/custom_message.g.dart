// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomMessage _$$_CustomMessageFromJson(Map<String, dynamic> json) =>
    _$_CustomMessage(
      id: json['id'] as String?,
      sendUserId: json['sendUserId'] as String,
      content: json['content'] as String,
      sendAt: DateTime.parse(json['sendAt'] as String),
    );

Map<String, dynamic> _$$_CustomMessageToJson(_$_CustomMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sendUserId': instance.sendUserId,
      'content': instance.content,
      'sendAt': instance.sendAt.toIso8601String(),
    };
