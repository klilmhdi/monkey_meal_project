import 'package:flutter/material.dart';
import 'package:monkey_meal_project/core/consts/colors/colors.dart';
import 'package:monkey_meal_project/src/screens/home/views/main_view/component/food_type_card/food_card_type_image.dart';
import 'package:monkey_meal_project/src/screens/home/views/main_view/component/food_type_card/food_card_type_text.dart';

class FoodTypeCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final Color textColor;
  final VoidCallback? onTap;

  const FoodTypeCard({
    Key? key,
    required this.imagePath,
    required this.title,
    this.textColor = AppColor.primary,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            FoodTypeCardImage( imagePath: imagePath),
            const SizedBox(height: 8),
            FoodTypeCardText(title: title, textColor: textColor),
          ],
        ),
      ),
    );
  }
}

