// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomUser _$$_CustomUserFromJson(Map<String, dynamic> json) =>
    _$_CustomUser(
      id: json['id'] as String?,
      email: json['email'] as String,
      password: json['password'] as String,
      point: json['point'] as int,
    );

Map<String, dynamic> _$$_CustomUserToJson(_$_CustomUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'password': instance.password,
      'point': instance.point,
    };
