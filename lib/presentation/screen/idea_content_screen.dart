import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_demo_firebase/presentation/screen/idea_title_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../controller/add_room_text_controller.dart';
import 'home_screen.dart';

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
              Lottie.asset("assets/lf30_editor_xtyovlen.json",
                width: 250, height: 250),
              Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("あなたの発案を書き殴ってください!"),
            ),
              TextField(
                decoration: InputDecoration(labelText: '発案内容'),
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                controller: ideaContentController,
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text('決定'),
                  onPressed: () async {
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
  //   pageController(i) {
  //   return homePageList[i];
  // }
  }
}