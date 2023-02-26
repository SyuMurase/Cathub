import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'CustomDialog_Complete.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("内容１"),
              Text("内容２"),
              Lottie.asset("assets/lf30_editor_xtyovlen.json",
                  width: 250, height: 250),
            ],
          ),
          Text('customdai'),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("いいえ")),
          ElevatedButton(
            child: Text(
              "はい",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CustomDialogComplete()));
            },
          ),
        ])
        // child: ElevatedButton(
        //   onPressed: () {
        //     showDialog(
        //       context: context,
        //       // barrierDismissible: true,
        //       builder: (context) {
        //         return AlertDialog(
        //           title: Text("タイトル"),
        //         );
        //       },
        //     );
        //   },
        //   child: Text("show dialog"),
        // ),
        );
  }
}
