import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_demo_firebase/domain/repository/idea_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class IdeaListScreen extends HookConsumerWidget {
  const IdeaListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: Text("発案のリスト"),
        ),
        body: FutureBuilder(
            future: ref.watch(ideaRepositoryProvider).retrieveIdeaNameList(),
            // とってきたデータを ideaNameList に格納している
            builder: (BuildContext context, AsyncSnapshot ideaNameList) {
              // 下のif文は、データをとってきている際の進捗状況を表していて、この場合では、データをまだとってき終わっていない時の処理
              if (ideaNameList.connectionState != ConnectionState.done) {
                return Center(
                  // https://i.stack.imgur.com/xQvuO.png
                  child: CircularProgressIndicator(),
                );
              }
              if (ideaNameList.hasError) {
                return Text(ideaNameList.error.toString());
              }
              if (ideaNameList.hasData) {
                // if (ideaNameList.data!.isEmpty) {
                  return Center(
                    child: Text("${ideaNameList.data}"),
                  );
                }
                // else {
                //   print("エラー1");
                //   return SizedBox();
                // }
              // }
               else {
                print("エラー2");
                return SizedBox();
              }
            }));
  }
}
