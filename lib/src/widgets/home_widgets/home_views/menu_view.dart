import 'package:flutter/material.dart';

class MenuView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade50,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.grid_view, size: 60, color: Colors.blue),
            SizedBox(height: 20),
            Text(
              'Menu View',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('This is the menu section', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}