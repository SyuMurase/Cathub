import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
            title: const Text("アカウント"),
            leading: const Icon(Icons.account_balance),
            tileColor: Colors.blue,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AccountScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text("利用規則"),
            leading: const Icon(Icons.account_balance),
            tileColor: const Color.fromARGB(255, 33, 243, 107),
            onTap: () {
              _launchUrl();
            },
          ),
            ListTile(
              title: const Text("利用規則"),
              leading: const Icon(Icons.account_balance),
              tileColor: Color.fromARGB(255, 255, 255, 255),
              // onTap: () {
              //   Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //           builder: (context) => const TermsOfServiceScreen(),
              //       ),
              //     );
              // },
            ),

          ListTile(
            title: Text("sample"),
            leading: Icon(Icons.account_balance),
            tileColor: Color.fromARGB(255, 255, 93, 130),
          ),
        ],
      ),
    );
  }
}
