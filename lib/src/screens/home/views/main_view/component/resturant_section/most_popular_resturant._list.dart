import 'package:flutter/material.dart';
import 'package:monkey_meal_project/src/widgets/home_widgets/home_views/main_view/resturant_section/most_popular_card/most_popular_card.dart';

class MostPopularResturantList extends StatelessWidget {
  const MostPopularResturantList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 250,
    child: 
    ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        return MostPopularCard();
      },
    ),
  );
}  
}