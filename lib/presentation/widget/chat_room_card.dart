import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_demo_firebase/presentation/screen/chat_page.dart';
import 'package:flutter_demo_firebase/presentation/screen/small_category_set_screen.dart';

import '../../domain/chat_room/chat_room.dart';

class ChatRoomCard extends StatelessWidget {
  ChatRoomCard({required this.chatRoom, Key? key}) : super(key: key);

  final ChatRoom chatRoom;

  @override
  Widget build(BuildContext context) {
    return 
    // GestureDetector(
    //   onTap: () {
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => ChatPage(
    //           largeCategory: chatRoom.largeCategoryName,
    //           smallCategory: chatRoom.smallCategoryName,
    //           ideaTitle: chatRoom.title,
    //           name: "",
    //         ),
    //       ),
    //     );
    //   },
    //   child: 
      Card(
        child: ExpandablePanel(
          header: Text(chatRoom.title),
          collapsed: const Text("詳細"),
          expanded: Row(
            children: [
              Text(
                chatRoom.content,
                overflow: TextOverflow.clip,
              ),
              TextButton(onPressed: () {
                        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatPage(
              largeCategory: chatRoom.largeCategoryName,
              smallCategory: chatRoom.smallCategoryName,
              ideaTitle: chatRoom.title,
              name: "",
            ),
          ),
        );
              }, child: const Text("チャットへ"))
            ],
          ),
        ),
        // elevation: 3,
        // child: Column(children: [
        //   Text(chatRoom.title),
        //   Text(chatRoom.content)
        // ]),
      // ),
    );
  }
}