import 'package:flutter/material.dart';

class ErrorTextWidget extends StatelessWidget {
  final String message;
  const ErrorTextWidget({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        softWrap: true,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
    );
  }
}
