import 'package:flutter/material.dart';
class InboxScreen extends StatefulWidget {
  static String routeName='/inboxRoute';
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('InBox'),
    actions: [    IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () {},
        ),],),
      body: Column(
        children: [],
      ),
    );
  }
}
