import 'package:flutter/material.dart';
import 'package:monkey_meal_project/core/shared_widgets/custom_nav_bar/bottom_nav_curve_painter.dart';
import 'package:monkey_meal_project/core/shared_widgets/custom_nav_bar/custom_bottom_nav_bar.dart';
import 'package:monkey_meal_project/src/screens/payment/payment_screen.dart';
class NotificationScreen extends StatefulWidget {
  static String routeName='/notificationRoute';

  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notification'),
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () {
            Navigator.pushNamed(context, PaymentScreen.routeName);

          },
        ),
      ],),
      bottomNavigationBar:
      CustomBottomNavBar(onTap:(index){
       // _onItemTapped(index);
      },currentIndex: 0,),
      body: ListView.builder(
        itemCount: 8, // Replace with your actual data length
        itemBuilder: (context, index) {
          // You would use a data model here to populate the UI
          final isRecent = index < 2; // Example logic for different time formats
          return ListTile(
            leading: const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Icon(
                Icons.circle,
                color: Colors.orange,
                size: 10,
              ),
            ),
            title: const Text(
              'Your order has been delivered', // Replace with your data
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              isRecent ? '1 h ago' : '12 Aug 2020', // Replace with your data
              style: const TextStyle(color: Colors.grey),
            ),
          );
        },
      ),
    );  }
}
