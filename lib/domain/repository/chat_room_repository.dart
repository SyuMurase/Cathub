import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_demo_firebase/custom_exception.dart';
import 'package:flutter_demo_firebase/domain/custom_message/custom_message.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../chat_room/chat_room.dart';

abstract class BaseChatRoomRepository {
  Future<List<String>> retrieveLargeCategoryList();
  Future<List<String>> retrieveSmallCategoryList(
      {required String largeCategoryName});
  Future<List<ChatRoom>> retrieveChatRoomList(
      {required String largeCategoryName, required String smallCategoryName});
  // Stream retrieveCustomMessageList({
  //   required String largeCategoryName,
  //   required String smallCategoryName,
  //   required String title,
  // });
  Future<List<ChatRoom>> retrieveOwnChatRoomList();
  Future addChatRoom({required ChatRoom chatRoom});
}

final chatRoomRepositoryProvider = Provider((ref) => ChatRoomRepository());

class ChatRoomRepository implements BaseChatRoomRepository {
  ChatRoomRepository();

  @override
  Future<List<String>> retrieveLargeCategoryList() async {
    List<String> largeCategoryList = [];
    try {
      await FirebaseFirestore.instance
          // idea -> lagrgeCategoryName -> smallCategory ->  smallCategoryName -> chat_room(title, content, )
          .collection("largeCategory")
          .get()
          .then((QuerySnapshot querySnapshot) =>
              querySnapshot.docs.forEach((doc) {
                largeCategoryList.add(doc.id);
              }));
      return largeCategoryList;
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<List<String>> retrieveSmallCategoryList(
      {required String largeCategoryName}) async {
    List<String> smallCategoryList = [];
    try {
      await FirebaseFirestore.instance
          .collection("largeCategory")
          .doc(largeCategoryName)
          .collection("smallCategory")
          .get()
          .then((QuerySnapshot querySnapshot) =>
              querySnapshot.docs.forEach((doc) {
                smallCategoryList.add(doc.id);
              }));
      return smallCategoryList;
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<List<ChatRoom>> retrieveChatRoomList(
      {required String largeCategoryName,
      required String smallCategoryName}) async {
    List<ChatRoom> chatRoomCategoryList = [];
    try {
      final snap = await FirebaseFirestore.instance
          .collection("largeCategory")
          .doc(largeCategoryName)
          .collection("smallCategory")
          .doc(smallCategoryName)
          .collection("chat_room")
          .get()
          .then((QuerySnapshot querySnapshot) =>
              querySnapshot.docs.forEach((doc) {
                chatRoomCategoryList.add(ChatRoom.fromDocument(doc));
              }));
      // final snap2 = await FirebaseFirestore.instance
      //     .collection("largeCategory")
      //     .doc(largeCategoryName)
      //     .collection("smallCategory")
      //     .doc(smallCategoryName)
      //     .collection("chat_room")
      //     .get();
      // print(snap2);
      return chatRoomCategoryList;
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  // @override
  // // Stream<List<CustomMessage>> retrieveCustomMessageList({
  // Stream retrieveCustomMessageList({
  //   required String largeCategoryName,
  //   required String smallCategoryName,
  //   required String title,
  // }) async* {
  //   // List<CustomMessage> chatRoomCategoryList = [];
  //   try {
  //     final snap = FirebaseFirestore.instance
  //         .collection("largeCategory")
  //         .doc(largeCategoryName)
  //         .collection("smallCategory")
  //         .doc(smallCategoryName)
  //         .collection("chat_room")
  //         .doc(title)
  //         .collection("messageList")
  //         .snapshots();
  //     yield snap;
  //     // .get()
  //     // .then((QuerySnapshot querySnapshot) =>
  //     //     querySnapshot.docs.forEach((doc) {
  //     //       chatRoomCategoryList.add(CustomMessage.fromDocument(doc));
  //     //     }));
  //     // return chatRoomCategoryList;
  //   } on FirebaseException catch (e) {
  //     throw CustomException(message: e.message);
  //   }
  // }

  @override
  Future<List<ChatRoom>> retrieveOwnChatRoomList() async {
    List<ChatRoom> ownChatRoomList = [];
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance
          .collection("largeCategory")
          .get()
          .then((largeCategoryList) {
        largeCategoryList.docs.forEach((largeCategoryElement) async {
          await FirebaseFirestore.instance
              .collection("largeCategory")
              .doc(largeCategoryElement.id)
              .collection("smallCollection")
              .get()
              .then((smallCategoryList) async {
            smallCategoryList.docs.forEach((smallCategoryElement) async {
              await FirebaseFirestore.instance
                  .collection("largeCategory")
                  .doc(largeCategoryElement.id)
                  .collection("smallCollection")
                  .doc(smallCategoryElement.id)
                  .collection("chat_room")
                  .get()
                  .then((chatRoomList) {
                chatRoomList.docs.forEach((chatRoomElement) {
                  if (ChatRoom.fromDocument(chatRoomElement).proposerId ==
                      currentUser!.uid) {
                    ownChatRoomList.add(ChatRoom.fromDocument(chatRoomElement));
                  }
                });
              });
            });
          });
        });
      });
      //     .doc(largeCategoryName)
      //     .collection("smallCategory")
      //     .doc(smallCategoryName)
      //     .collection("chat_room")
      //     .get()
      //     .then((QuerySnapshot querySnapshot) {
      //   querySnapshot.docs.forEach((doc) {
      //     if (ChatRoom.fromDocument(doc).proposerId == currentUser!.uid)
      //       ownChatRoomCategoryList.add(ChatRoom.fromDocument(doc));
      //   });
      // });
      // final snap2 = await FirebaseFirestore.instance
      //     .collection("largeCategory")
      //     .doc(largeCategoryName)
      //     .collection("smallCategory")
      //     .doc(smallCategoryName)
      //     .collection("chat_room")
      //     .get();
      // print(snap2);
      return ownChatRoomList;
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future addChatRoom({required ChatRoom chatRoom}) async {
    try {
      await FirebaseFirestore.instance
          .collection("largeCategory")
          .doc(chatRoom.largeCategoryName)
          .collection("smallCategory")
          .doc(chatRoom.smallCategoryName)
          .collection("chat_room")
          .add(chatRoom.toDocument());

      await FirebaseFirestore.instance
          .collection("largeCategory")
          .doc(chatRoom.largeCategoryName)
          .collection("smallCategory")
          .doc(chatRoom.smallCategoryName)
          .collection("chat_room")
          .doc(chatRoom.title)
          .set(chatRoom.toDocument());
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }
}
