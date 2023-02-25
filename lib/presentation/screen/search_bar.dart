import 'package:flutter/material.dart';

class MyAutocomplete extends StatelessWidget {
  const MyAutocomplete({Key? key}) : super(key: key);

  // 入力候補に出す値の配列
  static const _kOptions = ['apple', 'banana', 'cameraan','']; // 1.

  @override
  Widget build(BuildContext context) {
    // AutoComplete Widget本体
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width*0.8,
          child: Autocomplete<String>(
            // 2.
            // 入力候補リストの要素ビルダー
            optionsViewBuilder: (context, onSelected, options) {
              return ListView.builder(
                itemCount: options.length,
                itemBuilder: (context, index) {
                  return Material(child: Text(_kOptions[index]));
                },
              );
            },
            optionsMaxHeight: 100.0,
            optionsBuilder: (TextEditingValue textEditingValue) {
              // 3.
              if (textEditingValue.text == '') {
                return const Iterable<String>.empty();
              }
              return _kOptions.where((String option) {
                // 4.
                return option.contains(textEditingValue.text.toLowerCase());
              });
            },
            // 入力候補選択時の処理
            onSelected: (String selection) {
              // 5.
              debugPrint('You just selected $selection');
            },
          ),
        ),
      ),
    );
  }
}
