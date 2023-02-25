import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

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
  List<String> _namelist = [
    'お金',
    'プログラミング',
    'プログラマー',
    '旅・車・バイク',
    'エンジニア',
    'swift',
    'Typescript',
    'javascript'
  ];
  List<String> searchedNames = [];
  DateTime _lastChangedDate = DateTime.now();

  Widget _defaultListView() {
    return ListView.builder(
        itemCount: _namelist.length,
        itemBuilder: (context, index) {
          return Card(child: ListTile(title: Text(_namelist[index])));
        });
  }

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
            Text('検索フォーム',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 50),

            TextField(
              onChanged: delayedSearch,
              decoration: InputDecoration(
                  hintText: 'serch..',
                  contentPadding: EdgeInsets.symmetric(horizontal: 16)),
            ),
            const SizedBox(height: 50),
            // Text('検索結果', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            // const SizedBox(height: 16),
            Text('${searchedNames.toString()}'),
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
