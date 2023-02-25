import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final StateProvider<int> bottomNavBarSelectedIndexProvider =
    StateProvider((ref) => 0);

class BottomNavBar extends HookConsumerWidget {
  BottomNavBar({Key? key}) : super(key: key);

  final Map<String, IconData> bottomContentList = {
    "ホーム": Icons.home,
    "発案": Icons.add,
    "解決": Icons.light,
    "トーク": Icons.person,
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomNavBarSelectedIndex =
        ref.watch(bottomNavBarSelectedIndexProvider);
    final bottomNavBarSelectedIndexNotifier =
        ref.watch(bottomNavBarSelectedIndexProvider.notifier);
    return BottomNavyBar(
      backgroundColor: Colors.blue[100],
      items: [
        for (int i = 0; i < bottomContentList.length; i++) ...{
          BottomNavyBarItem(
            title: Text(
              // style: TextStyle(color: Theme.of(context).colorScheme.primary),
              bottomContentList.keys.toList()[i],
            ),
            icon: Icon(
              bottomContentList.values.toList()[i],
              // color: Theme.of(context).colorScheme.primary
            ),
            activeColor: Theme.of(context).colorScheme.primary,
            inactiveColor: Theme.of(context).colorScheme.inversePrimary,
          ),
        }
      ],
      selectedIndex: bottomNavBarSelectedIndex,
      onItemSelected: (index) {
        bottomNavBarSelectedIndexNotifier.state = index;
      },
    );
  }
}