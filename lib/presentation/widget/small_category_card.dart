import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_demo_firebase/presentation/screen/chat_page.dart';
import 'package:flutter_demo_firebase/presentation/screen/small_category_set_screen.dart';
import 'package:flutter_demo_firebase/presentation/widget/custom_dialog.dart';

class SmallCategoryCard extends StatelessWidget {
  SmallCategoryCard(
      {required this.ideaContent,
      required this.ideaTitle,
      required this.largeCategory,
      required this.smallCategory,
      Key? key})
      : super(key: key);

  final String ideaContent;
  final String ideaTitle;
  final String largeCategory;
  final String smallCategory;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                // builder: (context) => CustomDialog(
                      name: "",
                      ideaContent: ideaContent,
                      ideaTitle: ideaTitle,
                      largeCategory: largeCategory,
                      smallCategory: smallCategory,
                    )));
      },
      child: Card(
        child: Column(children: [
          Text(smallCategory),
        ]),
      ),
    );
  }
}
