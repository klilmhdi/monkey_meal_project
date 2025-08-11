import 'package:flutter/material.dart';

class ItemDataText extends StatelessWidget {
  const ItemDataText({
    super.key,
    required this.text, required this.textColor,
  });

  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14,
        color: textColor,
      ),
      maxLines: 1
      ,overflow: TextOverflow.ellipsis,
    );
  }
}
