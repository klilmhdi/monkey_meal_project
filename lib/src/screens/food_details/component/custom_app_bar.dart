import 'package:flutter/material.dart';
import 'package:monkey_meal_project/src/screens/food_details/component/custom_icon_button.dart';
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 10,
          left: 16,
          right: 16,
          bottom: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomIconButton(
              icon: Icons.arrow_back,
              onPressed: () => Navigator.pop(context),
            ),
            CustomIconButton(
              icon: Icons.shopping_cart_outlined,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
