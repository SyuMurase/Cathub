
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:lottie/lottie.dart';

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
          "assets/chat_hub_logo.png",
      widthImage: 230,
      heightImage: 230,
      backgroundColor: Color.fromARGB(255, 29, 29, 29),
    ),
    ContentConfig(
      widgetTitle: Column(
        children: [
          Text(
            'Chathubではルームを作成し\nチャットすることができます！',
            style: TextStyle(fontSize: 25.0),
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
          "assets/intro_first_lottie.json",
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
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue)),
            TextSpan(
                text: ' と ',
                style: TextStyle(
                    // decoration: TextDecoration.underline,
                    fontSize: 25,
                    // fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.cyan)),
            TextSpan(
                text: '解決者',
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline,
                    fontSize: 25,
                    // fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue)),
            TextSpan(
                text: ' に分かれて、\n 話し合うことがきます',
                style: TextStyle(
                    // decoration: TextDecoration.underline,
                    fontSize: 25,
                    // fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.cyan)),
          ]),
        )),
        // title: 発案者に分かれて,話し合うことがきます
        centerWidget: Lottie.asset(
          "assets/intro_second_lottie.json",
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
            style: TextStyle(fontSize: 25.0, fontStyle: FontStyle.italic),
          ),
        ],
      ),
      centerWidget: Lottie.asset(
        "assets/intro_third_lottie.json",
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
          Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return SignInScreen(
            // headerBuilder: (context, constraints, _) {
            //   return Padding(
            //     padding: const EdgeInsets.all(20),
            //     child: AspectRatio(
            //       aspectRatio: 1,
            //       child: Image.network(
            //           'https://firebase.flutter.dev/img/flutterfire_300x.png'),
            //     ),
            //   );
            // },
            footerBuilder: (context, _) {
              return const Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text(
                  'By signing in, you agree to our terms and conditions.',
                  style: TextStyle(color: Colors.grey),
                ),
              );
            },
            providerConfigs: [
              EmailProviderConfiguration(),
              GoogleProviderConfiguration(clientId: ''),
              AppleProviderConfiguration(),
              FacebookProviderConfiguration(
                clientId: '...',
              )
            ],
          );}
          )
    );},
                  // return SignInScreen(
          //   // headerBuilder: (context, constraints, _) {
          //   //   return Padding(
          //   //     padding: const EdgeInsets.all(20),
          //   //     child: AspectRatio(
          //   //       aspectRatio: 1,
          //   //       child: Image.network(
          //   //           'https://firebase.flutter.dev/img/flutterfire_300x.png'),
          //   //     ),
          //   //   );
          //   // },
          //   footerBuilder: (context, _) {
          //     return const Padding(
          //       padding: EdgeInsets.only(top: 16),
          //       child: Text(
          //         'By signing in, you agree to our terms and conditions.',
          //         style: TextStyle(color: Colors.grey),
          //       ),
          //     );
          //   },
          //   providerConfigs: [
          //     EmailProviderConfiguration(),
          //     GoogleProviderConfiguration(clientId: ''),
          //     AppleProviderConfiguration(),
          //     FacebookProviderConfiguration(
          //       clientId: '...',
          //     )
          //   ],
          // );))
      
        child: const Text("終了"));
  }
}