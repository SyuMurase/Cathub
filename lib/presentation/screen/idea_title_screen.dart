import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_demo_firebase/presentation/controller/add_room_text_controller.dart';
import 'package:flutter_demo_firebase/presentation/screen/large_category_set_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';

class IdeaTitleScreen extends HookConsumerWidget {
  const IdeaTitleScreen({required this.ideaContent, Key? key})
      : super(key: key);

  final String ideaContent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ideaTitleController = ref.watch(ideaTitleControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("発案タイトル"),
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
                  decoration: InputDecoration(labelText: 'タイトル'),
                  controller: ideaTitleController,
                  maxLines: 3,
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text("次へ"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LargeCategorySetScreen(
                                    ideaContent: ideaContent,
                                    ideaTitle: ideaTitleController.text,
                                  )));
                    },
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
