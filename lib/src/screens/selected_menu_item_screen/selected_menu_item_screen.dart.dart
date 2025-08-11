import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monkey_meal_project/core/consts/colors/colors.dart';
import 'package:monkey_meal_project/core/shared_widgets/custom_app_bar/custom_app_bar.dart';
import 'package:monkey_meal_project/core/shared_widgets/custom_nav_bar/bottom_nav_curve_painter.dart';
import 'package:monkey_meal_project/core/shared_widgets/custom_search_app_bar.dart';
import 'package:monkey_meal_project/core/shared_widgets/item_widgets/item_data.dart';
import 'package:monkey_meal_project/core/shared_widgets/item_widgets/item_image.dart';
import 'package:monkey_meal_project/core/shared_widgets/item_widgets/item_name.dart';
import 'package:monkey_meal_project/src/helper/helper.dart';
import 'package:monkey_meal_project/src/screens/food_details/detailes_item.dart';


class SelectedMenuItemScreen extends StatelessWidget {
  static String routeName = '/selectedMenuItemRoute';

  const SelectedMenuItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            CustomAppBar(
              text: "Desserts",
              textColor: AppColor.primary,
              iconColor: AppColor.primary,
              onCartPressed: () {
                // Handle cart button press
              },
            ),
            SizedBox(height: 14.h),
            CustomSearchBar(),
            SizedBox(height: 14.h),
            MenueItemsList(),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class MenueItemsList extends StatelessWidget {
  const MenueItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ListView.builder(
            itemCount: 10, // Example item count
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: ItemImage(
                  imagePath: 'assets/images/dessert.jpg',
                  child: MenueItemData(),
                  onTap: () {
                    Helper.navTo(context, TandooriChickenPizzaPage());
                  },
                ),
              );
            },
          ),
        )

    );
  }
}

class MenueItemData extends StatelessWidget {
  const MenueItemData({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          Expanded(flex: 2, child: const SizedBox()),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: ItemName(
                    name: "Frech Apple pie",
                    textColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                ItemData(
                  rating: 4.5,
                  reviewCount: "",
                  discreption: "Minute bu tuk tuk",
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
