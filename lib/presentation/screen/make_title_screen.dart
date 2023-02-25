import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_demo_firebase/presentation/screen/search_largetittle.dart';
import 'package:lottie/lottie.dart';

class MaketitleScreen extends StatelessWidget {
  const MaketitleScreen({Key? key}) : super(key: key);

  get child => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('発案のタイトル'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              Icon(Icons.money),
              Text("10P"),
            ]),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Lottie.asset("assets/lf30_editor_xtyovlen.json",
                width: 250, height: 250),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("発案にタイトルをつけましょう!\n 〇〇字以内に書きましょう"),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: SizedBox(
                // width: 320,
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: "タイトル",
                    suffixIcon: Icon(Icons.cancel_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SearchlargetittleScreen()),
                );
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                child: Text("次へ"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
