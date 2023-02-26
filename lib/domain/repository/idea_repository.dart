// import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class BaseIdeaRepository {
  Future retrieveIdeaNameList();
}

final ideaRepositoryProvider = Provider((ref) => IdeaRepository());

class IdeaRepository implements BaseIdeaRepository {
  IdeaRepository();

  @override
  Future retrieveIdeaNameList() async {
    try {
      final snap = await FirebaseFirestore.instance
          .collection("chat_room")
          .doc("chatroom1")
          .get();
      return snap.data();
    } catch (error) {
      print(error);
    }
    return ["try catch に入っていません"];
  }
}
