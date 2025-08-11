import 'package:flutter/material.dart';
import 'package:monkey_meal_project/core/shared_widgets/item_widgets/item_data_text.dart';
import 'package:monkey_meal_project/core/shared_widgets/item_widgets/item_rate_icon.dart';
import 'package:monkey_meal_project/core/shared_widgets/item_widgets/item_rate_text.dart';


class ItemData extends StatelessWidget {
  const ItemData({
    super.key,
    required this.rating,
    required this.reviewCount,
    required this.discreption,
    required this.textColor,
  });

  final double rating;
  final String reviewCount;
  final String discreption;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Star icon
        ItemRateIcon(),
        
        const SizedBox(width: 4),
        
        // Rating
        ItemRateText(rating: rating),
        
        const SizedBox(width: 4),
        
        // Review count
        ItemDataText(text: reviewCount, textColor: textColor),

        const SizedBox(width: 8),
        
        // Category
        Expanded(child: ItemDataText(text: discreption, textColor: textColor)),
      ],
    );
  }
}
