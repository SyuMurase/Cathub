import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'report.freezed.dart';
part 'report.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs

@freezed
abstract class Report implements _$Report {
  const Report._();

  const factory Report({
    String? id,
    required String reportUserEmail,
    required String accusedUserEmail,
    required String content,
  }) = _Report;

  factory Report.empty() => Report(
      reportUserEmail: "",
      accusedUserEmail: "",
      content: "",
      );

  factory Report.fromJson(json) => _$ReportFromJson(json);

  factory Report.fromDocument(DocumentSnapshot doc) {
    final data = doc.data()!;
    return Report.fromJson(data).copyWith(id: doc.id);
  }
  Map<String, dynamic> toDocument() => toJson()..remove('id');
}
