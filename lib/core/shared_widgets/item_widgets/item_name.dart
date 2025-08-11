import 'package:flutter/material.dart';

class ItemName extends StatelessWidget {
  const ItemName({
    super.key,
    required this.name, required this.textColor,
  });

  final String name;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
      textAlign: TextAlign.start,
    );
  }
}
