import 'package:flutter/material.dart';
import 'package:flutter_demo_firebase/presentation/screen/home_screen.dart';
import 'package:lottie/lottie.dart';

class CustomDialogComplete extends StatelessWidget {
  const CustomDialogComplete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Text("内容１"),
              // Text("内容２"),
              Lottie.asset("assets/lf30_editor_xtyovlen.json",
                width: 250, height: 250),
            ],
          ),
          Text('customdialogComplete'),
          ElevatedButton(
            child: Text(
              "完了しました",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
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
