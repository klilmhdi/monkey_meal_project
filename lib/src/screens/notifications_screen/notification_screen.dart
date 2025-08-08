import 'package:flutter/material.dart';
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
          onPressed: () {},
        ),
      ],),
      body: Column(
        children: [],
      ),
    );  }
}
