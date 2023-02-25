import 'package:flutter/material.dart';

class MyAutocomplete extends StatelessWidget {
  const MyAutocomplete({Key? key}) : super(key: key);

  static const _kOptions = ['aardvark', 'bobcat', 'chameleon'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 300,
        child: Autocomplete<String>(
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text == '') {
              return const Iterable<String>.empty();
            }
            return _kOptions.where((String option) {
              return option.contains(textEditingValue.text.toLowerCase());
            });
          },
          onSelected: (String selection) {
            debugPrint('You just selected $selection');
          },
          // ---------- ここから追加 ----------
          optionsViewBuilder: (
            BuildContext context,
            AutocompleteOnSelected<String> onSelected,
            Iterable<String> options,
          ) {
            // 入力候補リストの表示枠のWidgetを定義
            return Align(
              alignment: Alignment.topLeft,
              child: Material(
                elevation: 4, // 1.
                child: Container(
                  width: MediaQuery.of(context).size.width - 24, // 2.
                  color: Colors.cyan,
                  // のリストWidget本体
                  child: ListView.builder(
                    // 3.
                    shrinkWrap: true, // 4.
                    itemCount: options.length,
                    itemBuilder: (context, index) {
                      final option = options.elementAt(index);
                      return GestureDetector(
                        child: ListTile(
                          title: Text(option,
                              style: const TextStyle(color: Colors.white)),
                        ),
                        onTap: () => onSelected(option), // 5.
                      );
                    },
                  ),
                ),
              ),
            );
          },
          // ---------- ここまで ----------
        ),
      ),
    );
  }
}
