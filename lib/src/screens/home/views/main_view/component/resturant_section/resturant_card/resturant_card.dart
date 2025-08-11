
import 'package:flutter/material.dart';
import 'package:monkey_meal_project/src/models/resturant_model.dart';
import 'package:monkey_meal_project/src/screens/home/views/main_view/component/resturant_section/resturant_card/Restrant_image.dart';
import 'package:monkey_meal_project/src/screens/home/views/main_view/component/resturant_section/resturant_card/resturant_data.dart';
import 'package:monkey_meal_project/src/screens/home/views/main_view/component/resturant_section/resturant_card/resturant_name.dart';

class RestaurantCard extends StatelessWidget {
 final RestaurantModel restaurantModel;
 final void Function()? onTap;
  const RestaurantCard({
    Key? key,
    required this.restaurantModel,
    this.onTap,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image section
            ResturantImage(restaurantModel: restaurantModel),
            
            // Content section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Restaurant name
                  ResturantName(name: restaurantModel.itemName,),
                  
                  const SizedBox(height: 8),
                  ResturantData(
                    rating: restaurantModel.itemRating,
                    reviewCount: 124,
                    discreption: restaurantModel.itemDescription,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}













