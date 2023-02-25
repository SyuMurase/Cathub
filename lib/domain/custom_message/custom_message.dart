import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_message.freezed.dart';
part 'custom_message.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs

@freezed
abstract class CustomMessage implements _$CustomMessage {
  const CustomMessage._();

  const factory CustomMessage({
    String? id,
    required String sendUserId,
    required String content,
    required DateTime sendAt,
  }) = _CustomMessage;

  factory CustomMessage.empty() =>
      CustomMessage(sendUserId: "", content: "", sendAt: DateTime.now());

  factory CustomMessage.fromJson(json) => _$CustomMessageFromJson(json);

  factory CustomMessage.fromDocument(DocumentSnapshot doc) {
    final data = doc.data()!;
    return CustomMessage.fromJson(data).copyWith(id: doc.id);
  }
  Map<String, dynamic> toDocument() => toJson()..remove('id');
}
