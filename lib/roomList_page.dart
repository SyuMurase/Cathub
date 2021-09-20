import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter_demo_firebase/addRoom_page.dart';
import 'package:flutter_demo_firebase/login_page.dart';
import 'package:flutter_demo_firebase/userState.dart';
import 'package:flutter_demo_firebase/chat_page.dart';

class RoomListPage extends StatelessWidget {
  // 引数からユーザー情報を受け取れるようにする
  RoomListPage();

  @override
  Widget build(BuildContext context) {
    // ユーザー情報を受け取る
    final UserState userState = Provider.of<UserState>(context);
    final User user = userState.user!;

    return Scaffold(
      appBar: AppBar(
        title: Text('チャット'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                await Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  return LoginPage();
                }));
              })
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            child: Text('ログイン情報:${user.email}'),
          ),
          ElevatedButton(
            onPressed: () async {
              final data = {
                "uid": user.uid,
                "createdAt": Timestamp.now(),
              };
              await FirebaseFirestore.instance
                  .collection('delete_users')
                  .add(data)
                  .then((value) async => {
                        await FirebaseAuth.instance.signOut(),
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) {
                          return LoginPage();
                        }))
                      })
                  .catchError((e) => print("Failed to add user: $e"));
            },
            child: Text('退会する'),
          ),
          Expanded(
              // Stream 非同期処理の結果を元にWidgetを作る
              child: StreamBuilder<QuerySnapshot>(
            // 投稿メッセージ一覧の取得
            stream: FirebaseFirestore.instance
                .collection('chat_room')
                .orderBy('createdAt')
                .snapshots(),
            builder: (context, snapshot) {
              // データが取得できた場合
              if (snapshot.hasData) {
                final List<DocumentSnapshot> documents = snapshot.data!.docs;
                return ListView(
                  children: documents.map((document) {
                    return Card(
                      child: ListTile(
                        title: Text(document['name']),
                        trailing: IconButton(
                          icon: Icon(Icons.input),
                          onPressed: () async {
                            await Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return ChatPage(document['name']);
                                },
                              ),
                            );
                          },
                          // onPressed: () async {
                          //   await FirebaseFirestore.instance
                          //       .collection('chat_room')
                          //       .doc(document['name'])
                          //       .delete();
                          // },
                        ),
                      ),
                    );
                  }).toList(),
                );
              }
              // データが読込中の場合
              return Center(
                child: Text('読込中……'),
              );
            },
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          await Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) {
            // return AddPostPage();
            return AddRoomPage();
          }));
        },
      ),
    );
  }
}