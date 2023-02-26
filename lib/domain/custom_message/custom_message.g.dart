// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomMessage _$$_CustomMessageFromJson(Map<String, dynamic> json) =>
    _$_CustomMessage(
      id: json['id'] as String?,
      name: json['name'] as String,
      text: json['text'] as String,
      uid: json['uid'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$_CustomMessageToJson(_$_CustomMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'text': instance.text,
      'uid': instance.uid,
      'createdAt': instance.createdAt.toIso8601String(),
    };
