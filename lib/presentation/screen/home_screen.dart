import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_demo_firebase/presentation/screen/idea_content_screen.dart';
import 'package:flutter_demo_firebase/presentation/screen/solve_large_category_screen.dart';
import 'package:flutter_demo_firebase/presentation/screen/solved_idea_list_screen.dart';
import 'package:flutter_demo_firebase/presentation/screen/talk_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widget/bottom_nav_bar.dart';
import 'make_idea_screen.dart';

final List homePageList = [
  SolvedIdeaListScreen(),
  // MakeIdeaScreen(),
  IdeaContentScreen(),
  SolveLargeCategoryScreen(),
  TalkScreen(),
];

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int bottomNavBarSelectedIndex =
        ref.watch(bottomNavBarSelectedIndexProvider);
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("ホーム"),
      //   actions: [
      //     IconButton(
      //         onPressed: () {
      //           Navigator.push(context,
      //               MaterialPageRoute(builder: (context) => SettingScreen()));
      //         },
      //         icon: Icon(Icons.settings))
      //   ],
      // ),
      body: pageController(bottomNavBarSelectedIndex),
            bottomNavigationBar: BottomNavBar(),

    );
  }
    pageController(i) {
    return homePageList[i];
  }
}
