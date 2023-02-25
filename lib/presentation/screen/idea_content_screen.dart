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

import '../controller/add_room_text_controller.dart';

class IdeaContentScreen extends HookConsumerWidget {
  const IdeaContentScreen({Key? key}) : super(key: key);
  // String roomName = '';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ideaContentController = ref.watch(ideaContentControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('発案作成'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: '発案内容'),
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                controller: ideaContentController,
                // onChanged: (String value) {
                // setState(() {
                //   roomName = value;
                // });
                // },
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text('決定'),
                  onPressed: () async {
                    // final date = DateTime.now().toLocal().toIso8601String();
                    // await FirebaseFirestore.instance
                    //     .collection('chat_room')
                    //     .doc(roomName)
                    //     .set({
                    //   'name': roomName,
                    //   'createdAt': date,
                    // });
                    // Navigator.of(context).pop();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => IdeaTitleScreen(
                            ideaContent: ideaContentController.text,
                          ),
                        ),
                        );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
