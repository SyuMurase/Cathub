import 'package:flutter/material.dart';
import 'package:flutter_demo_firebase/domain/repository/chat_room_repository.dart';
import 'package:flutter_demo_firebase/presentation/widget/large_category_card.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LargeCategorySetScreen extends HookConsumerWidget {
  const LargeCategorySetScreen(
      {required this.ideaContent, required this.ideaTitle, Key? key})
      : super(key: key);

  final String ideaContent;
  final String ideaTitle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("カテゴリ設定"),
      ),
      body: FutureBuilder(
          future:
              ref.watch(chatRoomRepositoryProvider).retrieveLargeCategoryList(),
          builder: (BuildContext context,
              AsyncSnapshot<List<String>> largeCategoryList) {
            if (largeCategoryList.connectionState != ConnectionState.done) {
              return Center(child: Text("エラーが発生しています"));
            }
            if (largeCategoryList.hasError) {
              return Text(largeCategoryList.error.toString());
            }
            if (largeCategoryList.hasData) {
              if (largeCategoryList.data!.isEmpty) {
                return Center(
                  child: Text("カテゴリがありません"),
                );
              } else {
                return Center(
                  child: SingleChildScrollView(
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: largeCategoryList.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return LargeCategoryCard(
                          ideaContent: ideaContent,
                          ideaTitle: ideaTitle,
                          largeCategory: largeCategoryList.data![index],
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
