import 'package:flutter/material.dart';
import 'package:monkey_meal_project/core/shared_widgets/custom_nav_bar/bottom_nav_curve_painter.dart';
import 'package:monkey_meal_project/src/helper/helper.dart';
import 'package:monkey_meal_project/src/screens/food_details/component/background_image_container.dart';
import 'package:monkey_meal_project/src/screens/food_details/component/custom_app_bar.dart';
import 'package:monkey_meal_project/src/screens/food_details/component/details_card.dart';
import 'package:monkey_meal_project/src/screens/food_details/component/hart_icon.dart';

class TandooriChickenPizzaPage extends StatefulWidget {
  static String routeName = '/foodDetailsRoute';

  const TandooriChickenPizzaPage({super.key});

  @override
  State<TandooriChickenPizzaPage> createState() => _TandooriChickenPizzaPageState();
}

class _TandooriChickenPizzaPageState extends State<TandooriChickenPizzaPage> {
  int selectedPortions = 2;
  String selectedSize = "- Select the size of portion -";
  String selectedIngredients = "- Select the ingredients -";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     /* bottomNavigationBar:
      CustomBottomNavBar(onTap:(index){
       // _onItemTapped(index);
      },currentIndex: 0,),*/
      body: Column(
        children: [
          SizedBox(
      height: Helper.getScreenHeight(context)*0.4,
            child: Stack(
              children: [
                // Background Image Container
                const BackgroundImageContainer(),

                // App Bar
                const CustomAppBar(),

                // Heart Icon
                const HeartIcon(),
                Positioned(
                  top: 100,
                  bottom: 0,
                  child: Container(
                    height: 14,
                    // width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: DetailsCard(selectedPortions: 1, selectedSize: 'Select the Size of portion',
                selectedIngredients: 'Select the integrations', onPortionChanged: (index){}, onAddToCart: (){}),
          )

          //  DetailsCard(
          //     selectedPortions: selectedPortions,
          //     selectedSize: selectedSize,
          //     selectedIngredients: selectedIngredients,
          //     onPortionChanged: (newPortions) {
          //       setState(() {
          //         selectedPortions = newPortions;
          //       });
          //     },
          //     onAddToCart: () {
          //       ScaffoldMessenger.of(context).showSnackBar(
          //         SnackBar(
          //           content: Text('Added to cart: $selectedPortions portions'),
          //           backgroundColor: Colors.orange,
          //         ),
          //       );
          //     },
          //   ),
        ],
      ),
    );
  }
}

// Background Image Widget


// Custom App Bar Widget

// Custom Icon Button Widget

// Heart Icon Widget

// Details Card Widget

// Item Header Widget

// Rating Section Widget

// Description Section Widget

// Customization Section Widget

// Customization Field Widget

// Portion Counter Section Widget

// Portion Button Widget

// Total Price and Add to Cart Section Widget

