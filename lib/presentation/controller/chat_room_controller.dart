// import 'package:flutter_demo_firebase/custom_exception.dart';
// import 'package:flutter_demo_firebase/domain/repository/chat_room_repository.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../../domain/chat_room/chat_room.dart';

// final chatRoomExceptionProvider = StateProvider<CustomException?>((_) => null);

// final chatRoomControllerProvider = StateNotifierProvider<ChatRoomController, AsyncValue<List<ChatRoom>>> ((ref) {
//   return ChatRoomController(ref);
// });

// class ChatRoomController extends StateNotifier<AsyncValue<List<ChatRoom>>> {
//   ChatRoomController(this.ref) : super(const AsyncValue.loading()) {
//     final String largeCategoryName;
//     final String smallCategoryName;
//     retrieveChatRoomList(largeCategoryName, smallCategoryName);
//   }
//   final Ref ref;

//   Future<List<ChatRoom>> retrieveChatRoomList({required String largeCategoryName, required String smallCategoryName}) async {
//     try {
//       final chatRoomList = ref.watch(chatRoomRepositoryProvider).retrieveChatRoomList(largeCategoryName: largeCategoryName, smallCategoryName: smallCategoryName)
//     }
//   }
// }