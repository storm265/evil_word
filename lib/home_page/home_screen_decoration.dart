import 'package:flutter/material.dart';

class HomeScreenDecoration {
  static Color get backgroundColor => Colors.black;

  static AppBar appBar(Color backgroundColor) {
    return AppBar(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
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
