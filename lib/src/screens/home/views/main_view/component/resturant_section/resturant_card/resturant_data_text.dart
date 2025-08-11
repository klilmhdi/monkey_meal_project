import 'package:flutter/material.dart';
import 'package:monkey_meal_project/core/consts/colors/colors.dart';

class ResturantDataText extends StatelessWidget {
  const ResturantDataText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14,
        color: AppColor.placeholder,
      ),
      maxLines: 1
      ,overflow: TextOverflow.ellipsis,
    );
  }
}