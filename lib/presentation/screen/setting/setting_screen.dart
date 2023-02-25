import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text("設定"),
      ),
      body: Column(
        children: [
          // ListTile(
          //   title: const Text("アカウント"),
          //   leading: const Icon(Icons.account_balance),
          //   // tileColor: Colors.blue,
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => const AccountScreen(),
          //       ),
          //     );
          //   },
          // ),
          ListTile(
            title: const Text("利用規則"),
            leading: const Icon(Icons.article),
            // tileColor: const Color.fromARGB(255, 33, 243, 107),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TermsOfServiceScreen()));
            },
          ),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("ログアウトしますか？"),
                    actions: [
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
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut();
                          await Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) {
                            return SignInScreen();
                          }));
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: ListTile(
              title: Text("ログアウト"),
              leading: Icon(Icons.logout),
              // tileColor: Color.fromARGB(255, 255, 93, 130),
            ),
          ),
        ],
      ),
    );
  }
}
