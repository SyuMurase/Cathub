import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final helloWorldProvider = Provider((ref) => 'Good Evening');
final helloWorld = "Hello";
final counterProvider = StateProvider((ref) => 0);

class SampleScreen extends HookConsumerWidget {
  const SampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String value = ref.watch(helloWorldProvider);
    final int count = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Riverpod"),
      ),
      body: Center(
          child: Column(
        children: [
          Text(
            "${count}",
            style: TextStyle(fontSize: 30),
          ),
          ElevatedButton(
              onPressed: () {
                ref.watch(counterProvider.notifier).state = count + 1;
              },
              child: Text("+1")),
              MyWidget(),
        ],
      )),
    );
  }
}

class MyWidget extends HookConsumerWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count1 = ref.watch(counterProvider);
    return Text("$count1");
  }
}
