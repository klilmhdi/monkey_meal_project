import 'package:flutter/material.dart';
import 'package:monkey_meal_project/core/shared_widgets/custom_bottom_sheet/custom_bottom_sheet.dart';
import 'package:monkey_meal_project/core/shared_widgets/custom_button.dart';
import 'package:monkey_meal_project/core/shared_widgets/summary_row_widget.dart';
import 'package:monkey_meal_project/src/screens/checkout_screen/component/payment_method_item.dart';
class CheckoutScreen extends StatelessWidget {
  static String routeName = '/checkoutRoute';

  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bottomSheet: CustomBottomSheet(),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {},
        ),
        title: Text(
          'Checkout',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Delivery Address',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('653 Nostrand Ave.,'),
                      Text('Brooklyn, NY 11216'),
                    ],
                  ),
                  Text(
                    'Change',
                    style: TextStyle(color: Colors.orange),
                  ),
                ],
              ),
              Divider(height: 32, thickness: 1),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Payment method',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Row(
                    children: [
                      Icon(Icons.add, color: Colors.orange),
                      SizedBox(width: 4),
                      Text(
                        'Add Card',
                        style: TextStyle(color: Colors.orange),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),

              PaymentMethodItem(title:  'Cash on delivery', ),
              SizedBox(height: 10),
              PaymentMethodItem(
                  title:  'VISA',subtitle:  '**** **** **** 2187',imagePath:  'assets/images/visa_image.png'),
              SizedBox(height: 10),
              PaymentMethodItem(title:  'paypal',subtitle:  'johndoe@email.com',
              imagePath:     'assets/images/paypal_image.png'),

              Divider(height: 32, thickness: 1),

              SummaryRowWidget(title: 'Sub Total',price: '\$86',),
              SizedBox(height: 8),
              SummaryRowWidget(title: 'Delivery Cost',price:  '\$2'),
              SizedBox(height: 8),
              SummaryRowWidget(title: 'Discount',price:  '-\$4'),
              SizedBox(height: 8),
              SummaryRowWidget(title: 'Total',price:  '-\$66', fontWeight: FontWeight.w700),

              SizedBox(height: 32),
CustomButton(title: 'Send order',onPressed: (){
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // so it can expand when keyboard opens
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) => const CustomBottomSheet(),
  );},)
            ],
          ),
        ),
      ),
    );
  }
}

