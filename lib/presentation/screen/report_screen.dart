import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_demo_firebase/domain/repository/report_repository.dart';
import 'package:flutter_demo_firebase/presentation/controller/report_text_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';

final reportAccusedUserEmailIsNullProvier = StateProvider((ref) => true);
final reportContentIsNullProvider = StateProvider((ref) => true);

class ReportScreen extends HookConsumerWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportAccusedUserEmailController =
        ref.watch(reportAccusedUserEmailControllerProvider);
    final reportContentController = ref.watch(reportContentControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("報告"),
      ),
      body: Center(
        child: Column(children: [
          Lottie.asset("assets/9521-reported.json", height: MediaQuery.of(context).size.height * 0.25),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("問題のあるユーザーを報告してください"),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: TextField(
              onChanged: (text) {
                text == ""
                    ? ref
                        .watch(reportAccusedUserEmailIsNullProvier.notifier)
                        .state = true
                    : ref
                        .watch(reportAccusedUserEmailIsNullProvier.notifier)
                        .state = false;
              },
              decoration: InputDecoration(
                hintText: '問題のあるユーザーのメールアドレス',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              controller: reportAccusedUserEmailController,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.09,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: TextField(
              onChanged: (text) {
                text == ""
                    ? ref.watch(reportContentIsNullProvider.notifier).state =
                        true
                    : ref.watch(reportContentIsNullProvider.notifier).state =
                        false;
              },
              decoration: InputDecoration(
                hintText: '内容',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              controller: reportContentController,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.09,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: (ref.watch(reportAccusedUserEmailIsNullProvier) ||
                    ref.watch(reportContentIsNullProvider))
                ? () {}
                : () async {
                    await ref.watch(reportRepositoryProvider).addReport(
                        accusedUserEmail: reportAccusedUserEmailController.text,
                        content: reportContentController.text);
                  },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
              child: const Text("報告"),
            ),
          ),
        ]),
      ),
    );
  }
}
