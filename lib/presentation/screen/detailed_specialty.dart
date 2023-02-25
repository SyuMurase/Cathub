import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lottie/lottie.dart';

class DetailedspecialtyScreen extends StatelessWidget {
  const DetailedspecialtyScreen({Key? key}) : super(key: key);

  get child => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('カテゴリ詳細指定'),
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
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: "得意分野について詳しく教えてください",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.all(40.0),
            //   child:
            //   for(int i = 0;i < lagecategory.length;i++){
            //     ElevatedButton(
            //       onPressed: () {
            //         Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) => IdealistScreen()),
            //           );
            //       },
            //       child: Text('Button 1'),
            //     ),
            //    }
            // ),
          ],
        ),
      ),
    );
  }
}
