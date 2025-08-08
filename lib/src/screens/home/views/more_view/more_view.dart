import 'package:flutter/material.dart';
import 'package:monkey_meal_project/src/screens/inbox_screen/inbox_screen.dart';
import 'package:monkey_meal_project/src/screens/notifications_screen/notification_screen.dart';
import 'package:monkey_meal_project/src/screens/orders_screen/order_screen.dart';
import 'package:monkey_meal_project/src/screens/payment/payment_screen.dart';

import 'component/more_item.dart';
class MoreView extends StatelessWidget {
  const MoreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'More',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children:  [
          MoreItem(
            icon: Icons.monetization_on,
            title: 'Payment Details',
onTap:(){
              Navigator.pushNamed(context,PaymentScreen.routeName);},
          ),
          MoreItem(
            icon: Icons.shopping_bag,
            title: 'My Orders',
            onTap:(){
              Navigator.pushNamed(context,OrderScreen.routeName);},

          ),
          MoreItem(
            icon: Icons.notifications,
            title: 'Notifications',
            badge: 15,
            onTap:(){
              Navigator.pushNamed(context,NotificationScreen.routeName);},

          ),
          MoreItem(
            icon: Icons.inbox,
            title: 'Inbox',
            onTap:(){
              Navigator.pushNamed(context,InboxScreen.routeName);},
          ),
          MoreItem(
            icon: Icons.info,
            title: 'About Us',
          ),
        ],
      ),
    );
  }
}