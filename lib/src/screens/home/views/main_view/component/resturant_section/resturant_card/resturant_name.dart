import 'package:flutter/material.dart';
import 'package:monkey_meal_project/core/consts/colors/colors.dart';

class ResturantName extends StatelessWidget {
  const ResturantName({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColor.primary,
      ),
    );
  }
}