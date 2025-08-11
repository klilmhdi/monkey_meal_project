import 'package:flutter/material.dart';
import 'package:monkey_meal_project/core/consts/colors/colors.dart';
import 'package:monkey_meal_project/core/shared_widgets/summary_row_widget.dart';
class OrderList extends StatelessWidget {
  const OrderList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.placeholder,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            SummaryRowWidget(title: 'Beef Burger x1', price: '\$16'),
            SizedBox(height: 8,),
            SummaryRowWidget(title: 'Classic Burger x1', price: '\$14'),
            SizedBox(height: 8,),

            SummaryRowWidget(title: 'Cheese Chicken Burger x1', price: '\$17'),
            SizedBox(height: 8,),

            SummaryRowWidget(title: 'Beef Burger x1', price: '\$15'),
            SizedBox(height: 8,),

            SummaryRowWidget(title: 'French Fries Large', price: '\$6'),


          ],
        ),
      ),
    );
  }
}

