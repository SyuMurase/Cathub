import 'package:flutter/material.dart';
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
                return SingleChildScrollView(
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: chatRoomList.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ChatRoomCard(
                        chatRoom: chatRoomList.data![index],
                      );
                    },
                  ),
                );
                // }
              } else {
                return const Center(child: Text("エラーが発生しています"));
              }
            }));
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_demo_firebase/domain/repository/chat_room_repository.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../../domain/chat_room/chat_room.dart';
// import '../widget/chat_room_card.dart';

// final searchTextFieldTextEditProvider = StateProvider((ref) => false);

// class ChatRoomListScreen extends ConsumerStatefulWidget {
//   const ChatRoomListScreen(
//       {required this.largeCategory, required this.smallCategory, Key? key})
//       : super(key: key);
//   final String largeCategory;
//   final String smallCategory;

//   @override
//   ChatRoomListScreenState createState() => ChatRoomListScreenState();
// }

// class ChatRoomListScreenState extends ConsumerState<ChatRoomListScreen> {
//   static const searchDelayMillSec = 1000;
//   List<ChatRoom> allChatRoomlist = [];
//   List<String> allChatRoomTitleList = [];
//   List<ChatRoom> searchChatRoomList = [];
//   List<String> searchedNames = [];
//   DateTime _lastChangedDate = DateTime.now();

//   void search(String text) {
//     setState(() {
//       if (text.trim().isEmpty) {
//         searchedNames = [];
//       } else {
//         print(allChatRoomTitleList);
//         allChatRoomlist.forEach((element) {
//           if (element.title.contains(text)) {
//             searchChatRoomList.add(element);
//             searchedNames.add(element.title);
//           }
//         });
//         // searchedNames = _namelist
//         //     .where((element) => element.contains(text))
//         //     .toList();
//       }
//     });
//   }

//   void delayedSearch(String text) {
//     if (text != "") {
//       ref.watch(searchTextFieldTextEditProvider.notifier).state = true;
//     } else {
//       ref.watch(searchTextFieldTextEditProvider.notifier).state = false;
//     }
//     Future.delayed(const Duration(milliseconds: searchDelayMillSec), () {
//       final nowDate = DateTime.now();
//       if (nowDate.difference(_lastChangedDate).inMilliseconds >
//           searchDelayMillSec) {
//         _lastChangedDate = nowDate;
//         search(text);
//       }
//     });
//     //キーワードが入力されるごとに、検索処理を待たずに_lastChangedDateを更新する
//     _lastChangedDate = DateTime.now();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text("発案一覧"),
//         ),
//         body: Column(
//           children: [
//             SizedBox(
//               width: MediaQuery.of(context).size.width * 0.9,
//               child: TextField(
//                 onChanged: delayedSearch,
//                 maxLines: 1,
//                 decoration: InputDecoration(
//                   hintText: "検索",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//             ),
//             FutureBuilder(
//                 //  自作のクラス chatRoom と chat_ui で使用されているクラスが異なるため、nullになる
//                 future: ref
//                     .watch(chatRoomRepositoryProvider)
//                     .retrieveChatRoomList(
//                         largeCategoryName: widget.largeCategory,
//                         smallCategoryName: widget.smallCategory),
//                 builder: (BuildContext context,
//                     AsyncSnapshot<List<ChatRoom>> chatRoomList) {
//                   if (chatRoomList.connectionState != ConnectionState.done) {
//                     return Center(child: CircularProgressIndicator());
//                   }
//                   if (chatRoomList.hasError) {
//                     return Text(chatRoomList.error.toString());
//                   }
//                   if (chatRoomList.hasData) {
//                     chatRoomList.data!.forEach((element) {
//                       allChatRoomlist.add(element);
//                     });
//                     // void delayedSearch(String text) {
//                     //   if (text != "") {
//                     //     ref.watch(searchTextFieldTextEditProvider.notifier).state =
//                     //         true;
//                     //   } else {
//                     //     ref.watch(searchTextFieldTextEditProvider.notifier).state =
//                     //         false;
//                     //   }
//                     //   Future.delayed(
//                     //       const Duration(milliseconds: searchDelayMillSec), () {
//                     //     final nowDate = DateTime.now();
//                     //     if (nowDate.difference(_lastChangedDate).inMilliseconds >
//                     //         searchDelayMillSec) {
//                     //       _lastChangedDate = nowDate;
//                     //       search(text);
//                     //     }
//                     //   });
//                     //   //キーワードが入力されるごとに、検索処理を待たずに_lastChangedDateを更新する
//                     //   _lastChangedDate = DateTime.now();
//                     // }
//                     return Center(
//                       child: Column(
//                         children: [
//                           // SizedBox(
//                           //   width: MediaQuery.of(context).size.width * 0.9,
//                           //   child: TextField(
//                           //     onChanged: delayedSearch,
//                           //     maxLines: 1,
//                           //     decoration: InputDecoration(
//                           //       hintText: "検索",
//                           //       border: OutlineInputBorder(
//                           //         borderRadius: BorderRadius.circular(10),
//                           //       ),
//                           //     ),
//                           //   ),
//                           // ),
//                           // ListView.builder(
//                           //     itemCount: _namelist.length,
//                           //     itemBuilder: (BuildContext context, int index) {
//                           //       return (Text("$index: " + _namelist[index]));
//                           //     }),
//                           ref.watch(searchTextFieldTextEditProvider)
//                               ? ListView.builder(
//                                   // physics: const NeverScrollableScrollPhysics(),
//                                   shrinkWrap: true,
//                                   itemCount: searchedNames.length,
//                                   itemBuilder:
//                                       (BuildContext context, int index) {
//                                     return ChatRoomCard(
//                                       chatRoom: searchChatRoomList[index],
//                                     );
//                                   },
//                                 )
//                               : ListView.builder(
//                                   // physics: const NeverScrollableScrollPhysics(),
//                                   shrinkWrap: true,
//                                   itemCount: chatRoomList.data!.length,
//                                   itemBuilder:
//                                       (BuildContext context, int index) {
//                                     return ChatRoomCard(
//                                       chatRoom: chatRoomList.data![index],
//                                     );
//                                   },
//                                 ),
//                         ],
//                       ),
//                     );
//                     // }
//                   } else {
//                     return const Center(child: Text("エラーが発生しています"));
//                   }
//                 }),
//           ],
//         ));
//   }
// }
