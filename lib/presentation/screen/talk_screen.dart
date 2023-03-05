import 'package:flutter/material.dart';
import 'package:flutter_demo_firebase/domain/repository/chat_room_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/chat_room/chat_room.dart';
import '../widget/chat_room_card.dart';

class TalkScreen extends HookConsumerWidget {
  const TalkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("発案一覧"),
      ),
      body: FutureBuilder(
          future:
              ref.watch(chatRoomRepositoryProvider).retrieveOwnChatRoomList(),
          builder: (BuildContext context,
              AsyncSnapshot<List<ChatRoom>> chatRoomList) {
            if (chatRoomList.connectionState != ConnectionState.done) {
              return Center(child: CircularProgressIndicator());
            }
            if (chatRoomList.hasError) {
              return Text(chatRoomList.error.toString());
            }
            if (chatRoomList.hasData) {
              // print("chatRoomList.data : ${chatRoomList.data}");
              if (chatRoomList.data == []) {
                return Center(
                  child: Text("まだ自分の発案がありません"),
                );
              }
              return SingleChildScrollView(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: chatRoomList.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    // final List<String> chatRoomTitleList = [];
                    // chatRoomList.data!.forEach(
                    //   (element) {
                    //     if (element.)
                    //     chatRoomTitleList.add(element.title);
                    //   },
                    // );
                    return ChatRoomCard(
                      chatRoom: chatRoomList.data![index],
                    );
                  },
                ),
              );
            } else {
              return const Center(child: Text("エラーが発生しています"));
            }
          }),
    );
  }
}
