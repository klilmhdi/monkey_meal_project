import 'package:flutter/material.dart';
import 'package:monkey_meal_project/src/models/resturant_model.dart';
import 'package:monkey_meal_project/src/screens/home/views/main_view/component/resturant_section/resturant_card/resturant_card.dart';

class ResturantList extends StatelessWidget {
  const ResturantList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 790, // Adjust height as needed
      child: ListView.builder(
        itemCount: restaurantList.length,
        itemBuilder: (context, index) {
          final restaurant = restaurantList[index];
          return RestaurantCard(
            restaurantModel: restaurant,
            onTap: () {
              // Handle restaurant card tap
            },
          );
        },
      ),
    );
  }
}
