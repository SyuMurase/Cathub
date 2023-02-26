import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:lottie/lottie.dart';

final String ImagePath =
      "/Users/murasetakashi/StudioProjects/Cathub/.fvm/chathub_icon.png";

class IntroSliderScreen extends StatelessWidget {
  IntroSliderScreen({Key? key}) : super(key: key);
  
  //  late double fontSize = 42;

  final List<ContentConfig> slides = [
    ContentConfig(
      widgetTitle: Center(
        child: RichText(
          text: TextSpan(
              // style: Theme.of(context).textTheme.bodyText2,
              children: [
                TextSpan(
                    text: 'ようこそ',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                TextSpan(
                    text: 'C',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 42,
                        // fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 235, 58))),
                TextSpan(
                    text: 'h',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                TextSpan(
                    text: 'at',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 235, 58))),
                TextSpan(
                    text: 'hub',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                TextSpan(
                    text: 'へ！',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ]),
        ),
      ),
      pathImage:
          "/Users/murasetakashi/StudioProjects/Cathub/.fvm/chathub_icon.png",
      widthImage: 230,
      heightImage: 230,
      backgroundColor: Color.fromARGB(255, 29, 29, 29),
    ),
    ContentConfig(
      widgetTitle: Column(
        children: [
          Text(
            'Chathubではルームを作成し\nチャットすることができます！',
            style: TextStyle(fontSize: 30.0),
          ),
          // Stack(
          //   alignment: Alignment.center,
          //   children: [
          //     Container(
          //       centerWidget: Lottie.asset(
          //         "/Users/murasetakashi/StudioProjects/Cathub/.fvm/32147-cute-cat-works.json",
          //         width: 250,
          //         height: 250,
          //       ),
          //     )
          //   ],
          // ),
        ],
      ),
      centerWidget: Container(
        child: Lottie.asset(
          "/Users/murasetakashi/StudioProjects/Cathub/.fvm/32147-cute-cat-works.json",
          // width: MediaQuery.of().size.width,
          // height: 250,
          width: 300,
          height: 300,
        ),
        // width: MediaQuery.of(context).size.width,
        // width: 300,
        // height: 200,
        // width: MediaQuery.of(context as BuildContext).size.width,
        // height: MediaQuery.of(context as BuildContext).size.height,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 218, 154, 58),
          shape: BoxShape.circle,
        ),
      ),
      styleTitle: const TextStyle(color: Colors.cyan, fontSize: 30),
      // description: "text",
      styleDescription: const TextStyle(color: Colors.cyan, fontSize: 18),
      backgroundColor: Color.fromARGB(255, 190, 247, 255),
    ),
    ContentConfig(
        widgetTitle: Center(
            child: RichText(
          text: TextSpan(children: [
            TextSpan(
                text: '発案者',
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline,
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 141, 229))),
            TextSpan(
                text: 'と',
                style: TextStyle(
                    // decoration: TextDecoration.underline,
                    fontSize: 35,
                    // fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.cyan)),
            TextSpan(
                text: '解決者',
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline,
                    fontSize: 42,
                    // fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 141, 229))),
            TextSpan(
                text: 'に分かれて,話し合うことがきます',
                style: TextStyle(
                    // decoration: TextDecoration.underline,
                    fontSize: 35,
                    // fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.cyan)),
          ]),
        )),
        // title: 発案者に分かれて,話し合うことがきます
        centerWidget: Lottie.asset(
          "/Users/murasetakashi/StudioProjects/Cathub/.fvm/63029-chatting-couple-animation.json",
          width: 250,
          height: 250,
        ),
        styleTitle: const TextStyle(
          color: Colors.black,
          fontSize: 40,
        ),
        // description: "Not Found",
        styleDescription: const TextStyle(color: Colors.black, fontSize: 15),
        backgroundColor: Color.fromARGB(255, 138, 240, 142)
        // backgroundColor: Colors.grey,
        ),
    ContentConfig(
      widgetTitle: Column(
        children: [
          Text(
            'それでは、お楽しみください！',
            style: TextStyle(fontSize: 35.0, fontStyle: FontStyle.italic),
          ),
        ],
      ),
      centerWidget: Lottie.asset(
        "/Users/murasetakashi/StudioProjects/Cathub/.fvm/92532-do-not-annoy-the-cat.json",
        width: 250,
        height: 250,
      ),
      styleTitle: const TextStyle(color: Colors.cyan, fontSize: 20),
      description: "Good Hackson",
      styleDescription: const TextStyle(color: Colors.cyan, fontSize: 10),
      backgroundColor: Color.fromARGB(255, 229, 125, 248),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      listContentConfig: slides,
      renderSkipBtn: const Text("スキップ"),
      renderNextBtn: const Text("次へ"),
      renderDoneBtn: renderDoneBtn(context),
    );
  }

  Widget renderDoneBtn(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.pushNamed(context, "/signup");
        },
        child: const Text("終了"));
  }
}
