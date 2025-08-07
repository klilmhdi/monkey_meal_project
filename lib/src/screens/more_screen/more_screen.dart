import 'package:flutter/material.dart';

import 'component/more_item.dart';
class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

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
        children: const [
          MoreItem(
            icon: Icons.monetization_on,
            title: 'Payment Details',

          ),
          MoreItem(
            icon: Icons.shopping_bag,
            title: 'My Orders',
          ),
          MoreItem(
            icon: Icons.notifications,
            title: 'Notifications',
            badge: 15,
          ),
          MoreItem(
            icon: Icons.inbox,
            title: 'Inbox',
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