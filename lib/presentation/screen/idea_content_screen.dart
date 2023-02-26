import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_demo_firebase/presentation/screen/idea_title_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../controller/add_room_text_controller.dart';
import 'home_screen.dart';

final ideaContentIsNullProvider = StateProvider((ref) => true);

class IdeaContentScreen extends HookConsumerWidget {
  const IdeaContentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ideaContentController = ref.watch(ideaContentControllerProvider);
    return Scaffold(
        appBar: AppBar(
          title: Text('あなたの発案'),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Lottie.asset("assets/lf30_editor_xtyovlen.json",
                    width: 250, height: 250),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("あなたの発案を書き殴ってください！"),
                ),
                TextField(
                    decoration: InputDecoration(
                      labelText: '発案内容',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: 3,
                    controller: ideaContentController,
                    onChanged: (text) {
                      text == ""
                          ? ref
                              .watch(ideaContentIsNullProvider.notifier)
                              .state = true
                          : ref
                              .watch(ideaContentIsNullProvider.notifier)
                              .state = false;
                    }),
                const SizedBox(
                  height: 100,
                ),
                // Container(
                //   width: double.infinity,
                //   child: ElevatedButton(
                //     child: Text('決定'),
                //     onPressed: () async {
                //       Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //             builder: (context) => IdeaTitleScreen(
                //               ideaContent: ideaContentController.text,
                //             ),
                //           ),
                //           );
                //     },
                // onChanged: (String value) {
                // setState(() {
                //   roomName = value;
                // });
                // },
                // ),
                // ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: (ref.watch(ideaContentIsNullProvider))
                      ? () {}
                      : () {
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 50),
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
        ));
    //   pageController(i) {
    //   return homePageList[i];
    // }
  }
}
