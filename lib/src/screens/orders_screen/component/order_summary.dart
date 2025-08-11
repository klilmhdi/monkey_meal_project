import 'package:flutter/material.dart';
import 'package:monkey_meal_project/core/consts/colors/colors.dart';
import 'package:monkey_meal_project/core/shared_widgets/summary_row_widget.dart';
import 'package:monkey_meal_project/src/screens/checkout_screen/checkout_screen.dart';
class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SummaryRowWidget(title: 'Delivery Instructions', price: '+ Add Notes',
              priceColor: AppColor.orange,fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
              SizedBox(height: 8,)
              ,SummaryRowWidget(title: 'sub total', price: '\$68',
              fontSize: 16,priceColor: AppColor.orange,),
              SizedBox(height: 8,),

              SummaryRowWidget(title: 'Delivery Cost', price: '\$2',
                fontSize: 16,priceColor: AppColor.orange,),
              SizedBox(height: 16,),

              SummaryRowWidget(title: 'Total', price: '\$70',
                fontSize: 18,priceColor: AppColor.orange,fontWeight: FontWeight.w900,),
              SizedBox(height: 16,),



            ],

      ),
      );
  }
}