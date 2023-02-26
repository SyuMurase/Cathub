import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_firebase/presentation/screen/report_screen.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:url_launcher/url_launcher.dart';

import 'account_screen.dart';
import 'terms_of_service_screen.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({required this.title});
//   final String title;
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
// int _counter = 0;

// void _incrementCounter() {
//   setState(() {
//     _counter++;
//   });
// }

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future _launchUrl() async {
      //have to write something
      var url =
          "https://pub.dev/packages/url_launcherhttps://pub.dev/packages/url_launcher";
      // ignore: deprecated_member_use
      if (await canLaunch(url)) {
        // ignore: deprecated_member_use
        await launch(url);
      } else {
        throw 'Unable to launch url $url';
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("設定"),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text("利用規則"),
            leading: const Icon(Icons.account_balance),
            onTap: () {
              _launchUrl();
            },
          ),
          ListTile(
            title: const Text("報告"),
            leading: Icon(Icons.report),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ReportScreen()));
            },
          ),
          ListTile(
            title: const Text("ログアウト"),
            leading: Icon(Icons.logout),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              await FlutterFireUIAuth.signOut(context: context);
              await Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (context) {
                return SignInScreen();
              }));
            },
          )
        ],
      ),
    );
  }
}
