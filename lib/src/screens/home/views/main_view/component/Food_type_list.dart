import 'package:flutter/material.dart';
import 'package:monkey_meal_project/src/models/food_tpye_model.dart';
import 'package:monkey_meal_project/src/screens/home/views/main_view/component/food_type_card/food_type_card.dart';

class FoodTypeList extends StatelessWidget {
  const FoodTypeList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: SizedBox(
        height: 120,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: foodTypes.length,
          itemBuilder: (context, index) {
            return FoodTypeCard(
              imagePath: foodTypes[index].imageUrl,
              title: foodTypes[index].name,
            );
          },
        ),
      ),
    );
  }
}