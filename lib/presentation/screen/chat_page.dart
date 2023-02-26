import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_demo_firebase/presentation/screen/idea_content_screen.dart';
import 'package:uuid/uuid.dart';

class ChatPage extends StatefulWidget {
  const ChatPage(
      {required this.name,
      this.ideaContent,
      this.ideaTitle,
      required this.largeCategory,
      required this.smallCategory,
      Key? key})
      : super(key: key);

  final String name;
  final String? ideaContent;
  final String? ideaTitle;
  final String largeCategory;
  final String smallCategory;

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<types.Message> _messages = [];
  String randomId = Uuid().v4();
  // final _user = const types.User(id: '06c33e8b-e835-4736-80f4-63f44b66666c');
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> getData() async {
    final getData = await FirebaseFirestore.instance
        .collection("largeCategory")
        .doc(widget.largeCategory)
        .collection("smallCategory")
        .doc(widget.smallCategory)
        .collection("chat_room")
        .doc(widget.ideaTitle)
        .collection("messageList")
        .orderBy("createdAt", descending: true)
        .get();

    final message = getData.docs
        .map((d) => types.TextMessage(
            author:
                types.User(id: d.data()['uid'], firstName: d.data()['name']),
            createdAt: d.data()['createdAt'],
            id: d.data()['id'],
            text: d.data()['text']))
        .toList();

    if (mounted) {
      setState(() {
        _messages = [...message];
      });
    }
  }

  Future<void> _addMessage(types.TextMessage message) async {
    setState(() {
      _messages.insert(0, message);
      // print(_messages);
      // print(widget.ideaTitle);
    });
    await FirebaseFirestore.instance
        .collection("largeCategory")
        .doc(widget.largeCategory)
        .collection("smallCategory")
        .doc(widget.smallCategory)
        .collection("chat_room")
        .doc(widget.ideaTitle)
        .collection("messageList")
        .add({
      'uid': message.author.id,
      'name': message.author.firstName,
      'createdAt': message.createdAt,
      'id': message.id,
      'text': message.text,
    });
    await Future.delayed(Duration(seconds: 3));
  }

  void _handlePreviewDataFetched(
    types.TextMessage message,
    types.PreviewData previewData,
  ) {
    final index = _messages.indexWhere((element) => element.id == message.id);
    // final updatedMessage = (_messages[index] as types.TextMessage)
    // .copyWith(previewData: previewData);
    final updatedMessage = (_messages[index] as types.TextMessage)
        .copyWith(previewData: previewData);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _messages[index] = updatedMessage;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // ユーザー情報を受け取る
    // final UserState userState = Provider.of<UserState>(context);
    final User? user = FirebaseAuth.instance.currentUser;
    final _uid = types.User(id: user!.uid, firstName: user.email);

    return Scaffold(
      appBar: AppBar(
        title: Text('チャット'),
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.push(context,
        //         MaterialPageRoute(builder: (context) => IdeaContentScreen()));
        //   },
        //   icon: Icon(Icons.arrow_back_ios),
        // ),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("チャットを閉じますか？"),
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
                            await FirebaseFirestore.instance
                                .collection("largeCategory")
                                .doc(widget.largeCategory)
                                .collection("smallCategory")
                                .doc(widget.smallCategory)
                                .collection("chat_room")
                                .doc(widget.ideaTitle)
                                .update({"isSolved": true});
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              icon: Icon(Icons.check))
        ],
      ),
      //  isLoading flag 三項演算子
      body: Chat(
        theme: const DefaultChatTheme(
          inputBackgroundColor: Colors.blue,
          sendButtonIcon: Icon(Icons.send),
          sendingIcon: Icon(Icons.update_outlined),
        ),
        showUserNames: true,
        messages: _messages,
        onPreviewDataFetched: _handlePreviewDataFetched,
        onSendPressed: (types.PartialText message) async {
          final textMessage = types.TextMessage(
            author: _uid,
            createdAt: DateTime.now().millisecondsSinceEpoch,
            id: randomId,
            text: message.text,
          );
          await _addMessage(textMessage);
        },
        user: _uid,
      ),
    );
  }
}
