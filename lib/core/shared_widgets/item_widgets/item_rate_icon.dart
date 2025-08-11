import 'package:flutter/material.dart';
import 'package:monkey_meal_project/core/consts/colors/colors.dart';

class ItemRateIcon extends StatelessWidget {
  const ItemRateIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.star,
      color: AppColor.orange,
      size: 26,
    );
  }
}
