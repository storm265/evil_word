import 'package:flutter/material.dart';

class HomeScreenDecoration {
  static Color get backgroundColor => Colors.black;

  static AppBar appBar(Color backgroundColor) {
    return AppBar(
      centerTitle: true,
      backgroundColor: backgroundColor,
      title: const Text(
        '🤬 Evil word',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 25,
          color: Colors.white,
        ),
      ),
    );
  }
}
