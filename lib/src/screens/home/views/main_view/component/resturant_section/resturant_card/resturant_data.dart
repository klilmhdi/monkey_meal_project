import 'package:flutter/material.dart';
import 'package:monkey_meal_project/src/screens/home/views/main_view/component/resturant_section/resturant_card/resturant_data_text.dart';
import 'package:monkey_meal_project/src/screens/home/views/main_view/component/resturant_section/resturant_card/resturant_rate_icon.dart';
import 'package:monkey_meal_project/src/screens/home/views/main_view/component/resturant_section/resturant_card/resturant_rate_text.dart';

class ResturantData extends StatelessWidget {
  const ResturantData({
    super.key,
    required this.rating,
    required this.reviewCount,
    required this.discreption,
  });

  final double rating;
  final int reviewCount;
  final String discreption;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Star icon
        ResturantRateIcon(),
        
        const SizedBox(width: 4),
        
        // Rating
        ResturantRateText(rating: rating),
        
        const SizedBox(width: 4),
        
        // Review count
        ResturantDataText(text: '($reviewCount ratings)'),
        
        const SizedBox(width: 8),
        
        // Category
        Expanded(child: ResturantDataText(text: discreption)),
      ],
    );
  }
}