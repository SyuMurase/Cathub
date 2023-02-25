import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_demo_firebase/domain/repository/chat_room_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/chat_room/chat_room.dart';
import '../widget/chat_room_card.dart';

class ChatRoomListScreen extends HookConsumerWidget {
  const ChatRoomListScreen(
      {required this.largeCategory, required this.smallCategory, Key? key})
      : super(key: key);

  final String largeCategory;
  final String smallCategory;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("発案一覧"),
        ),
        body: FutureBuilder(
          //  自作のクラス chatRoom と chat_ui で使用されているクラスが異なるため、nullになる
            future: ref.watch(chatRoomRepositoryProvider).retrieveChatRoomList(
                largeCategoryName: largeCategory,
                smallCategoryName: smallCategory),
            builder: (BuildContext context,
                AsyncSnapshot<List<ChatRoom>> chatRoomList) {
              if (chatRoomList.connectionState != ConnectionState.done) {
                return Center(child: CircularProgressIndicator());
              }
              if (chatRoomList.hasError) {
                return Text(chatRoomList.error.toString());
              }
              if (chatRoomList.hasData) {
                // if (chatRoomList.data!.isEmpty) {
                //   return Center(
                //     child: Text("カテゴリがありません"),
                //   );
                // } else {

                return Center(
                  child: SingleChildScrollView(
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: chatRoomList.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ChatRoomCard(chatRoom: chatRoomList.data![index],);
                      },
                    ),
                  ),
                );
                // }
              } else {
                return const Center(child: Text("エラーが発生しています"));
              }
            }));
  }
}
