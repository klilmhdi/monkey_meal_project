import 'package:flutter/material.dart';
import 'package:monkey_meal_project/src/models/resturant_model.dart';

class ResturantImage extends StatelessWidget {
  const ResturantImage({
    super.key,
    required this.restaurantModel,
  });

  final RestaurantModel restaurantModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      child: Image.asset(
        restaurantModel.itemCover,
        fit: BoxFit.cover,
      ),
    );
  }
}