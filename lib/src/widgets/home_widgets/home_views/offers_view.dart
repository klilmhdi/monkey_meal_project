import 'package:flutter/material.dart';

class OffersView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange.shade50,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.local_offer, size: 60, color: Colors.orange),
            SizedBox(height: 20),
            Text(
              'Offers Screen',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Special offers and discounts', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}