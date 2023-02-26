import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_demo_firebase/domain/chat_room/chat_room.dart';
import 'package:flutter_demo_firebase/domain/repository/chat_room_repository.dart';
import 'package:flutter_demo_firebase/presentation/screen/chat_page.dart';
import 'package:flutter_demo_firebase/presentation/screen/roomList_page.dart';
import 'package:flutter_demo_firebase/presentation/screen/small_category_set_screen.dart';
import 'package:flutter_demo_firebase/presentation/screen/chat_room_list_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SmallCategoryCard extends HookConsumerWidget {
  SmallCategoryCard(
      {this.ideaContent,
      this.ideaTitle,
      required this.largeCategory,
      required this.smallCategory,
      Key? key})
      : super(key: key);

  final String? ideaContent;
  final String? ideaTitle;
  final String largeCategory;
  final String smallCategory;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User? currentUser = FirebaseAuth.instance.currentUser;
    return GestureDetector(
      onTap: () async {
        // title または content が null の時 = 登録された発案を見るとき = 解決の時
        if (ideaContent == null || ideaTitle == null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatRoomListScreen(
                largeCategory: largeCategory,
                smallCategory: smallCategory,
              ),
            ),
          );
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => OwnChatRoomListScreen(
          //         largeCategory: largeCategory, smallCategory: smallCategory),
          //   ),
          // );
        } else {
          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (context) {
              return AlertDialog(
                title: Text("発案しますか？"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("いいえ")),
                  TextButton(
                    child: Text(
                      "はい",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () async {
                      await ref.watch(chatRoomRepositoryProvider).addChatRoom(
                            chatRoom: ChatRoom(
                              proposerId: currentUser!.uid,
                              largeCategoryName: largeCategory,
                              smallCategoryName: smallCategory,
                              title: ideaTitle!,
                              content: ideaContent!,
                              isSolved: false,
                            ),
                          );
                      // FirebaseFirestore.instance
                      //     .collection('chat_room')
                      //     .doc(currentUser!.uid)
                      //     .set(ChatRoom(
                      //             proposerId: currentUser.uid,
                      //             largeCategoryName: largeCategory,
                      //             smallCategoryName: smallCategory,
                      //             title: ideaTitle!,
                      //             content: ideaContent!,
                      //             isSolved: false)
                      //         .toDocument());
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatPage(
                            name: "",
                            ideaContent: ideaContent,
                            ideaTitle: ideaTitle,
                            largeCategory: largeCategory,
                            smallCategory: smallCategory,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          );
        }
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => ChatRoomListScreen(
        //       largeCategory: largeCategory,
        //       smallCategory: smallCategory,
        //     ),
        //   ),
        // );
        // } else {
        //   try {
        // final proposerId = FirebaseAuth.instance.currentUser!.uid;
        // await FirebaseFirestore.instance
        //     .collection("largeCategory")
        //     .doc(largeCategory)
        //     .collection("smallCategory")
        //     .doc(smallCategory)
        //     .collection("chat_room")
        //     .doc(ideaTitle)
        //     .set(ChatRoom(
        //             proposerId: proposerId,
        //             largeCategoryName: largeCategory,
        //             smallCategoryName: smallCategory,
        //             title: ideaTitle!,
        //             content: ideaContent!,
        //             isSolved: false)
        //         .toDocument());
        // } catch (e) {
        //   print(e);
        // }
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => ChatPage(
        //               name: "",
        //               ideaContent: ideaContent,
        //               ideaTitle: ideaTitle,
        //               largeCategory: largeCategory,
        //               smallCategory: smallCategory,
        //             )));
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => RoomListPage()));
        // }
      },
      child: Card(
        elevation: 3,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(smallCategory),
          ),
        ]),
      ),
    );
  }
}
