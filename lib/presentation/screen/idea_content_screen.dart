// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class AddRoomPage extends StatefulWidget {
//   const AddRoomPage({Key? key}) : super(key: key);

//   @override
//   _AddPostPageState createState() => _AddPostPageState();
// }

// class _AddPostPageState extends State<AddRoomPage> {
//   String roomName = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('ルーム作成'),
//       ),
//       body: Center(
//         child: Container(
//           padding: EdgeInsets.all(32),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'チャットルーム名'),
//                 keyboardType: TextInputType.multiline,
//                 maxLines: 3,
//                 onChanged: (String value) {
//                   setState(() {
//                     roomName = value;
//                   });
//                 },
//               ),
//               const SizedBox(
//                 height: 8,
//               ),
//               Container(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   child: Text('投稿'),
//                   onPressed: () async {
//                     final date = DateTime.now().toLocal().toIso8601String();

//                     await FirebaseFirestore.instance
//                         .collection('chat_room')
//                         .doc(roomName)
//                         .set({
//                       'name': roomName,
//                       'createdAt': date,
//                     });
//                     Navigator.of(context).pop();
//                   },
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_demo_firebase/presentation/screen/idea_title_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../controller/add_room_text_controller.dart';

final ideaContentIsNullProvider = StateProvider((ref) => true);

class IdeaContentScreen extends HookConsumerWidget {
  const IdeaContentScreen({Key? key}) : super(key: key);
  // String roomName = '';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ideaContentController = ref.watch(ideaContentControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('あなたの発案'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Lottie.asset("assets/lf30_editor_xtyovlen.json",
                width: 250, height: 250),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("あなたの発案を書き殴ってください!"),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  onChanged: (text) {
                    text == ""
                        ? ref.watch(ideaContentIsNullProvider.notifier).state =
                            true
                        : ref.watch(ideaContentIsNullProvider.notifier).state =
                            false;
                  },
                  decoration: InputDecoration(
                    hintText: '発案内容',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  controller: ideaContentController,
                  // onChanged: (String value) {
                  // setState(() {
                  //   roomName = value;
                  // });
                  // },
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: (ref.watch(ideaContentIsNullProvider)) ? (){} :
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => IdeaTitleScreen(
                      ideaContent: ideaContentController.text,
                    ),
                  ),
                );
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                child: Text("次へ"),
              ),
            ),
            // Container(
            //   width: double.infinity,
            //   child: ElevatedButton(
            //     child: Text('決定'),
            //     onPressed: () async {
            // final date = DateTime.now().toLocal().toIso8601String();
            // await FirebaseFirestore.instance
            //     .collection('chat_room')
            //     .doc(roomName)
            //     .set({
            //   'name': roomName,
            //   'createdAt': date,
            // });
            // Navigator.of(context).pop();
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => IdeaTitleScreen(
            //       ideaContent: ideaContentController.text,
            //     ),
            //   ),
            // );
            // },
          ],
        ),
      ),
    );
  }
}
