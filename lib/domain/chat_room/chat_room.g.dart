// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatRoom _$$_ChatRoomFromJson(Map<String, dynamic> json) => _$_ChatRoom(
      id: json['id'] as String?,
      proposerId: json['proposerId'] as String,
      largeCategoryName: json['largeCategoryName'] as String,
      smallCategoryName: json['smallCategoryName'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      isSolved: json['isSolved'] as bool,
      solverIdList: (json['solverIdList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      solveContentList: (json['solveContentList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      praisedSolverIdList: (json['praisedSolverIdList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_ChatRoomToJson(_$_ChatRoom instance) =>
    <String, dynamic>{
      'id': instance.id,
      'proposerId': instance.proposerId,
      'largeCategoryName': instance.largeCategoryName,
      'smallCategoryName': instance.smallCategoryName,
      'title': instance.title,
      'content': instance.content,
      'isSolved': instance.isSolved,
      'solverIdList': instance.solverIdList,
      'solveContentList': instance.solveContentList,
      'praisedSolverIdList': instance.praisedSolverIdList,
    };
