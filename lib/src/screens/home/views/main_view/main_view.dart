import 'package:flutter/material.dart';
import 'package:monkey_meal_project/core/consts/colors/colors.dart';
import 'package:monkey_meal_project/core/shared_widgets/custom_app_bar/custom_app_bar.dart';
import 'package:monkey_meal_project/core/shared_widgets/custom_search_app_bar.dart';

import 'component/Food_type_list.dart';
import 'component/items_list.dart';
import 'component/resturant_section/most_popular_resturant._list.dart';
import 'component/resturant_section/resturant_header.dart';
import 'component/resturant_section/resturant_list.dart';
class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(
            text: "Good morning Haneen!",
            textColor: AppColor.primary,
            iconColor: AppColor.primary,
            onCartPressed: () {
              // Handle cart button press
            },
          ),
          SizedBox(height: 14,),
          DeliveringTo(),
          SizedBox(height: 8,),
          CurrentLocation(),
          SizedBox(height: 24,),
          CustomSearchBar(),
          SizedBox(height: 24,),
          FoodTypeList(),
          SizedBox(height: 46,),
          ResturantHeader(title: "Popular Restaurants",),
          SizedBox(height: 24,),
          ResturantList(),
          ResturantHeader(title: "Most Popular",),
          MostPopularResturantList(),
          SizedBox(height: 16,),
          ResturantHeader(title: "ٌRecent Items",),
          ItemsList(),
          SizedBox(height: 24,),
        ],
      ),
    );
  }
}

class CurrentLocation extends StatelessWidget {
  const CurrentLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Text("Current Location", style: TextStyle(
        color: AppColor.secondary,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      )),
    );
  }
}

class DeliveringTo extends StatelessWidget {
  const DeliveringTo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Text("Delivireing to", style: TextStyle(
        color: AppColor.placeholder,
        fontSize: 11,
        fontWeight: FontWeight.w500,
      )),
    );
  }
}