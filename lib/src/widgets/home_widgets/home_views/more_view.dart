import 'package:flutter/material.dart';

class MoreView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.shade50,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.more_horiz, size: 60, color: Colors.red),
            SizedBox(height: 20),
            Text(
              'More Screen',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Additional options', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
