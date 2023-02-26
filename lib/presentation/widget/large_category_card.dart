import 'package:flutter/material.dart';
import 'package:flutter_demo_firebase/presentation/screen/small_category_set_screen.dart';

class LargeCategoryCard extends StatelessWidget {
  LargeCategoryCard({this.ideaContent, this.ideaTitle, required this.largeCategory, Key? key}) : super(key: key);

  final String? ideaContent;
  final String? ideaTitle;
  final String largeCategory;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    SmallCategorySetScreen(
                      ideaContent: ideaContent,
                      ideaTitle: ideaTitle,
                      largeCategory: largeCategory,
                      )));
      },
      child: Card(
        elevation: 3,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(largeCategory),
          ),
        ]),
      ),
    );
  }
}
