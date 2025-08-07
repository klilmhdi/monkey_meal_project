import 'package:flutter/material.dart';
import 'package:monkey_meal_project/src/screens/orders_screen/component/order_card.dart';
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
      body: Column(
        children: [
          OrderCard(),

        ],
      ),
    );  }
}
