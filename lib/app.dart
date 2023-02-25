import 'package:flutter/material.dart';
import 'package:flutter_demo_firebase/authGate.dart';
import 'package:flutter_demo_firebase/presentation/screen/idea_list_screen.dart';
import 'package:flutterfire_ui/i10n.dart';

import 'L10n/flutter_fire_ui_localization_labels.dart';
import 'presentation/screen/home_screen.dart';
import 'presentation/screen/make_idea_screen.dart';
import 'presentation/screen/make_title_screen.dart';
import 'presentation/screen/search_largetittle.dart';
import 'presentation/screen/serch.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //子Widgetにデータを渡す
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        // Creates an instance of FirebaseUILocalizationDelegate with overridden labels
        FlutterFireUILocalizations.withDefaultOverrides(
            const FlutterFireUIJaLocalizationLabels()),

        // Delegates below take care of built-in flutter widgets
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,

        // This delegate is required to provide the labels that are not overridden by LabelOverrides
        FlutterFireUILocalizations.delegate,
      ],
      // home: AuthGate(),
      home: SearchlargetittleScreen(),
      // home: CustomDialog(),
    );
  }
}
