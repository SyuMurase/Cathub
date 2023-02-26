import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../custom_exception.dart';
import '../../domain/repository/chat_room_repository.dart';
import '../widget/large_category_card.dart';


@override
Future<QuerySnapshot<Map<String, dynamic>>> retrieveLargeCategoryList() async {
  // List<String> largeCategoryList = [];
  // try {
  // idea -> lagrgeCategoryName -> smallCategory ->  smallCategoryName -> chat_room(title, content, )
  var snapshot = FirebaseFirestore.instance.collection("largeCategory").get();
  return snapshot;
}

class SearchApp extends StatelessWidget {
  const SearchApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SearchScreen(),
    );
  }
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  static const searchDelayMillSec = 1000;
  List<String> _namelist = [];
  List<String> searchedNames = [];
  DateTime _lastChangedDate = DateTime.now();

  // Widget _defaultListView() {
  //   return ListView.builder(
  //       itemCount: _namelist.length,
  //       itemBuilder: (context, index) {
  //         return Card(child: ListTile(title: Text(_namelist[index])));
  //       });
  // }

  void search(String text) {
    setState(() {
      if (text.trim().isEmpty) {
        searchedNames = [];
      } else {
        searchedNames =
            _namelist.where((element) => element.contains(text)).toList();
      }
    });
  }

  void delayedSearch(String text) {
    Future.delayed(const Duration(milliseconds: searchDelayMillSec), () {
      final nowDate = DateTime.now();
      if (nowDate.difference(_lastChangedDate).inMilliseconds >
          searchDelayMillSec) {
        _lastChangedDate = nowDate;
        search(text);
      }
    });
    //キーワードが入力されるごとに、検索処理を待たずに_lastChangedDateを更新する
    _lastChangedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('テキスト検索(SearchApp)'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
                onPressed: () => retrieveLargeCategoryList(),
                child: Text("ボタン")),
            Text('検索フォーム',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 50),

            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                onChanged: delayedSearch,
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: "検索",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            // TextField(
            //   onChanged: delayedSearch,
            //   decoration: InputDecoration(
            //       hintText: 'serch..',
            //       contentPadding: EdgeInsets.symmetric(horizontal: 16)),
            // ),

            const SizedBox(height: 50),
            // Text('検索結果', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            // const SizedBox(height: 16),
            Text('${searchedNames.toString()}'),

            FutureBuilder<QuerySnapshot>(
                // final List<String> searchedNames = [];
                future: FirebaseFirestore.instance
                    .collection("largeCategory")
                    .get(),

                builder: (context, snapshot) {
                  // var data = snapshot.hassData;
                  if (snapshot.hasData) {
                    var documentts = snapshot.data!.docs;
                    // print('$documentts');
                    //listviewを格納していく
                    return ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: documentts
                          .map((doc) => Text(
                                '${doc}',
                                style: TextStyle(fontSize: 20),
                              ))
                          .toList(),
                      // namelust.add(doc.id),
                      // largeCategoryList.add(doc.id);
                    );
                    // return Text("${snapshot.data.docs}");
                  }
                  return Text("loading...");
                }),

            const SizedBox(height: 50),
            const SizedBox(height: 50),
            Flexible(
              child: ListView.builder(
                  itemCount: _namelist.length,
                  itemBuilder: (BuildContext context, int index) {
                    return (Text("$index: " + _namelist[index]));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

// class Test extends HookConsumerWidget {
//   const Test(
//       {required this.ideaContent, required this.ideaTitle, Key? key})
//       : super(key: key);

//   final String ideaContent;
//   final String ideaTitle;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("カテゴリ設定"),
//       ),
//       body: FutureBuilder(
//           future:
//               ref.watch(chatRoomRepositoryProvider).retrieveLargeCategoryList(),
//           builder: (BuildContext context,
//               AsyncSnapshot<List<String>> largeCategoryList) {
//             if (largeCategoryList.connectionState != ConnectionState.done) {
//               return Center(child: Text("エラーが発生しています"));
//             }
//             if (largeCategoryList.hasError) {
//               return Text(largeCategoryList.error.toString());
//             }
//             if (largeCategoryList.hasData) {
//               if (largeCategoryList.data!.isEmpty) {
//                 return Center(
//                   child: Text("カテゴリがありません"),
//                 );
//               } else {
//                 return Center(

//                   // child: SingleChildScrollView(
//                   child: ListView.builder(
//                     physics: const NeverScrollableScrollPhysics(),
//                     shrinkWrap: true,
//                     itemCount: largeCategoryList.data!.length,
//                     //ListView.builderはitemBuilderプロパティで返すWidget
//                     itemBuilder: (BuildContext context, int index) {
//                       return LargeCategoryCard(
//                         ideaContent: ideaContent,
//                         ideaTitle: ideaTitle,
//                         largeCategory: largeCategoryList.data![index],
//                       );
//                     },
//                   ),
//                   // ),
//                 );
//               }
//             } else {
//               return const Center(child: Text("エラーが発生しています"));
//             }
//           }),
//     );
//   }
// }