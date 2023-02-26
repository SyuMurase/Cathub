// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Report _$$_ReportFromJson(Map<String, dynamic> json) => _$_Report(
      id: json['id'] as String?,
      reportUserEmail: json['reportUserEmail'] as String,
      accusedUserEmail: json['accusedUserEmail'] as String,
      content: json['content'] as String,
    );

Map<String, dynamic> _$$_ReportToJson(_$_Report instance) => <String, dynamic>{
      'id': instance.id,
      'reportUserEmail': instance.reportUserEmail,
      'accusedUserEmail': instance.accusedUserEmail,
      'content': instance.content,
    };
