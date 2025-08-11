import 'package:flutter/material.dart';
import 'package:monkey_meal_project/src/screens/payment/component/payment_option.dart';
import 'package:monkey_meal_project/src/screens/payment/component/saved_card_widget.dart';
class PaymentCardWidget extends StatelessWidget {
  const PaymentCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
       PaymentOption(text: 'Cashed/card on delivery', isSelected: true, onTap: (){}),
          const SizedBox(height: 20),
          SavedCardWidget(),
          const SizedBox(height: 20),

        ],
      ),
    );
  }




}