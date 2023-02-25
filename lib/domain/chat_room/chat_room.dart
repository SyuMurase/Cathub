import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_room.freezed.dart';
part 'chat_room.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs

@freezed
abstract class ChatRoom implements _$ChatRoom {
  const ChatRoom._();

  const factory ChatRoom({
    String? id,
    required String proposerId,
    required String largeCategoryName,
    required String smallCategoryName,
    required String title,
    required String content,
    required bool isSolved,
    List<String>? solverIdList,
    List<String>? solveContentList,
    List<String>? praisedSolverIdList,
  }) = _ChatRoom;

  factory ChatRoom.empty() => ChatRoom(
      proposerId: "",
      largeCategoryName: "",
      smallCategoryName: "",
      title: "",
      content: "",
      isSolved: false,
      solverIdList: [],
      solveContentList: [],
      praisedSolverIdList: []);

  factory ChatRoom.fromJson(json) => _$ChatRoomFromJson(json);

  factory ChatRoom.fromDocument(DocumentSnapshot doc) {
    final data = doc.data()!;
    return ChatRoom.fromJson(data).copyWith(id: doc.id);
  }
  Map<String, dynamic> toDocument() => toJson()..remove('id');
}
