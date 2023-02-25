import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            // barrierDismissible: true,
            builder: (context) {
              return AlertDialog(
                title: Text("タイトル"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("内容１"),
                    Text("内容２"),
                    // Lottie.asset("assets/lf30_editor_xtyovlen.json"),
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("いいえ")),
                  ElevatedButton(
                    child: Text("はい", style: TextStyle(fontWeight: FontWeight.bold),),
                    onPressed: () => print('OK'),
                  ),
                ],
              );
            },
          );
        },
        child: Text("show dialog"),
      )),
    );
  }
}
