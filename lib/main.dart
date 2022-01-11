import 'package:evil_word/decorations.dart';
import 'package:evil_word/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '🤬 Evil word',
      theme: ThemeData(
          textTheme: TextTheme(
              headline6:
                  TextStyle(color: Theme.of(context).colorScheme.secondary)),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(secondary: UiDecoration.mainColor)),
      home: HomePage(),
    );
  }
}
