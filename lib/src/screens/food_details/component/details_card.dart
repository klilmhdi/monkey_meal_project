import 'package:flutter/material.dart';
import 'package:monkey_meal_project/src/screens/food_details/component/CustomizationSection.dart';
import 'package:monkey_meal_project/src/screens/food_details/component/description_section.dart';
import 'package:monkey_meal_project/src/screens/food_details/component/item_header.dart';
import 'package:monkey_meal_project/src/screens/food_details/component/portion_counter_section.dart';
import 'package:monkey_meal_project/src/screens/food_details/component/rating_section.dart';
import 'package:monkey_meal_project/src/screens/food_details/component/total_price_and_cart_section.dart';
class DetailsCard extends StatelessWidget {
  final int selectedPortions;
  final String selectedSize;
  final String selectedIngredients;
  final Function(int) onPortionChanged;
  final VoidCallback onAddToCart;

  const DetailsCard({
    super.key,
    required this.selectedPortions,
    required this.selectedSize,
    required this.selectedIngredients,
    required this.onPortionChanged,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.35
      ,
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Item Header
              ItemHeader(selectedPortions: selectedPortions),

              const SizedBox(height: 24),

              // Rating Section
              const RatingSection(),

              const SizedBox(height: 24),

              // Description Section
              const DescriptionSection(),

              const SizedBox(height: 24),

              // Customization Section
              CustomizationSection(
                selectedSize: selectedSize,
                selectedIngredients: selectedIngredients,
              ),

              const SizedBox(height: 24),

              // Portion Counter Section
              PortionCounterSection(
                selectedPortions: selectedPortions,
                onPortionChanged: onPortionChanged,
              ),

              const SizedBox(height: 40),

              // Total Price and Add to Cart Section
              TotalPriceAndCartSection(
                selectedPortions: selectedPortions,
                onAddToCart: onAddToCart,
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
