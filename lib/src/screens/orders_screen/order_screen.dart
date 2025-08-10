import 'package:flutter/material.dart';
import 'package:monkey_meal_project/core/shared_widgets/custom_button.dart';
import 'package:monkey_meal_project/src/helper/helper.dart';
import 'package:monkey_meal_project/src/models/order_model.dart';
import 'package:monkey_meal_project/src/screens/checkout_screen/checkout_screen.dart';
import 'package:monkey_meal_project/src/screens/orders_screen/component/order_card.dart';
import 'package:monkey_meal_project/src/screens/orders_screen/component/order_list.dart';
import 'package:monkey_meal_project/src/screens/orders_screen/component/order_summary.dart';
class OrderScreen extends StatefulWidget {
  static String routeName='/orderRoute';

  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Order'),),
      body: ListView(

            children: [
              OrderCard(orderModel: OrderModel.orders[0],),
          SizedBox(height: 8,),
          OrderList(),
              SizedBox(height: 8,),
              OrderSummary(),

SizedBox(height: 30,),
              CustomButton(title: 'Checkout',onPressed: (){
                Navigator.pushNamed(context, CheckoutScreen.routeName);
              },),
            ],
          ),
        );  }
}
