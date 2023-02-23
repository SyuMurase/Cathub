import 'package:flutter/material.dart';

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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TermsOfServiceScreen()));
            },
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