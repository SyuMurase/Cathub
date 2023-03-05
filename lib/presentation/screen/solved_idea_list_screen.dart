import 'package:flutter/material.dart';
import 'package:flutter_demo_firebase/presentation/screen/setting/setting_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/chat_room/chat_room.dart';
import '../../domain/repository/chat_room_repository.dart';
import '../widget/chat_room_card.dart';

class SolvedIdeaListScreen extends HookConsumerWidget {
  const SolvedIdeaListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("発案の例"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingScreen()));
              },
              icon: Icon(Icons.settings))
        ],
      ),
      body: FutureBuilder(
          future:
              ref.watch(chatRoomRepositoryProvider).retrieveRandomChatRoomList(),
          builder: (BuildContext context,
              AsyncSnapshot<List<ChatRoom>> randomChatRoomList) {
            if (randomChatRoomList.connectionState != ConnectionState.done) {
              return Center(child: CircularProgressIndicator());
            }
            if (randomChatRoomList.hasError) {
              return Text(randomChatRoomList.error.toString());
            }
            if (randomChatRoomList.hasData) {
              // print("chatRoomList.data : ${chatRoomList.data}");
              if (randomChatRoomList.data == []) {
                return Center(
                  child: Text("まだ自分の発案がありません"),
                );
              }
              return SingleChildScrollView(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: randomChatRoomList.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    // final List<String> chatRoomTitleList = [];
                    // chatRoomList.data!.forEach(
                    //   (element) {
                    //     if (element.)
                    //     chatRoomTitleList.add(element.title);
                    //   },
                    // );
                    return ChatRoomCard(
                      chatRoom: randomChatRoomList.data![index],
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
