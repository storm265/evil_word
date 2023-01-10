import 'package:evil_word/home_page/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '🤬 Evil word',
      theme: ThemeData(
        useMaterial3: true,
        textTheme: TextTheme(
          headline6: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.redAccent,
        ),
      ),
      home: HomePage(),
    );
  }
}
