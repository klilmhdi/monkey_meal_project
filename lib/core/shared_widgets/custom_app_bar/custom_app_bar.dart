import 'package:flutter/material.dart';
import 'package:monkey_meal_project/core/shared_widgets/custom_app_bar/custom_app_bar_icon.dart';
import 'package:monkey_meal_project/core/shared_widgets/custom_app_bar/custom_app_bar_text.dart';

class CustomAppBar extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color iconColor;
  final VoidCallback? onCartPressed;
  final double height;

  const CustomAppBar({
    Key? key,
    required this.text,
    required this.textColor,
    required this.iconColor,
    this.onCartPressed,
    this.height = 60.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomAppBarText(textColor: textColor, text: text),
            CustomAppBarIcon(onCartPressed: onCartPressed, iconColor: iconColor),
          ],
        ),
      ),
    );
  }
}




