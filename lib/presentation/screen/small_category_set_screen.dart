import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_demo_firebase/presentation/widget/small_category_card.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/repository/chat_room_repository.dart';

class SmallCategorySetScreen extends HookConsumerWidget {
  const SmallCategorySetScreen(
      {required this.ideaContent,
      required this.ideaTitle,
      required this.largeCategory,
      // required this.smallCategory,
      Key? key})
      : super(key: key);

  final String ideaContent;
  final String ideaTitle;
  final String largeCategory;
  // final String smallCategory;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("カテゴリ詳細設定"),
      ),
      body: FutureBuilder(
          future: ref
              .watch(chatRoomRepositoryProvider)
              .retrieveSmallCategoryList(largeCategoryName: largeCategory),
          builder: (BuildContext context,
              AsyncSnapshot<List<String>> smallCategoryList) {
            if (smallCategoryList.connectionState != ConnectionState.done) {
              return Center(child: Text("エラーが発生しています"));
            }
            if (smallCategoryList.hasError) {
              return Text(smallCategoryList.error.toString());
            }
            if (smallCategoryList.hasData) {
              if (smallCategoryList.data!.isEmpty) {
                return Center(
                  child: Text("カテゴリがありません"),
                );
              } else {
                return Center(
                  child: SingleChildScrollView(
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: smallCategoryList.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return SmallCategoryCard(
                          ideaContent: ideaContent,
                          ideaTitle: ideaTitle,
                          largeCategory: largeCategory,
                          smallCategory: smallCategoryList.data![index],
                        );
                      },
                    ),
                  ),
                );
              }
            } else {
              return const Center(child: Text("エラーが発生しています"));
            }
          }),
    );
  }
}
