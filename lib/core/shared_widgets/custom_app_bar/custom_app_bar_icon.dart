import 'package:flutter/material.dart';

class CustomAppBarIcon extends StatelessWidget {
  const CustomAppBarIcon({
    super.key,
    required this.onCartPressed,
    required this.iconColor,
  });

  final VoidCallback? onCartPressed;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onCartPressed,
      icon: Icon(
        Icons.shopping_cart,
        color: iconColor,
        size: 28,
      ),
    );
  }
}