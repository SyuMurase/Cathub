import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_firebase/presentation/screen/chat_page.dart';

import '../../domain/chat_room/chat_room.dart';

class ChatRoomCard extends StatelessWidget {
  ChatRoomCard({required this.chatRoom, Key? key}) : super(key: key);

  final ChatRoom chatRoom;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpandablePanel(
        header: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(chatRoom.title),
        ),
        collapsed: Padding(
          padding: const EdgeInsets.all(12.0),
          child: const Text("詳細"),
        ),
        expanded: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                child: Flexible(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      chatRoom.content,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextButton(
                  onPressed: () {
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
                  },
                  child: const Text("チャットへ")),
            )
          ],
        ),
      ),
    );
  }
}
