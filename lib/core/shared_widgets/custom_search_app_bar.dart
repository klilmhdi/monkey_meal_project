import 'package:flutter/material.dart';
import 'package:monkey_meal_project/core/consts/colors/colors.dart';

class CustomSearchBar extends StatelessWidget {
  final String hintText;
  final Color backgroundColor;
  final Color iconColor;
  final Color textColor;
  final Color hintColor;
  final Function(String)? onChanged;

  const CustomSearchBar({
    Key? key,
    this.hintText = "Search food",
    this.backgroundColor = AppColor.placeholderBg,
    this.iconColor = AppColor.secondary,
    this.textColor = Colors.black87,
    this.hintColor = AppColor.placeholder,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: TextField(
        onChanged: onChanged,
        style: TextStyle(color: textColor),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: hintColor),
          prefixIcon: Icon(Icons.search, color: iconColor),
          filled: true,
          fillColor: backgroundColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }
}