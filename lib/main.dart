import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pet_time/constants/ConstantColors.dart';
import 'package:pet_time/generated/l10n.dart';

import 'MyHomePage.dart';

void main() {
  // await SharedPreferences.getInstance();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        S.delegate
      ],
      debugShowCheckedModeBanner: false,
      title: 'Pet Time',
      theme: ThemeData(
        primaryColor: primaryColor,
        primaryColorDark: primaryColor,
        // accentColor: accentColors,
        secondaryHeaderColor: accentColors,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      home: MyHomePage(title: "false"),
    );
  }
}
