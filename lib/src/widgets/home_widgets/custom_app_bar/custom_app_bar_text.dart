import 'package:flutter/material.dart';

class CustomAppBarText extends StatelessWidget {
  const CustomAppBarText({
    super.key,
    required this.textColor, required this.text,
  });
final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}