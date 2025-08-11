import 'package:flutter/material.dart';
class BackgroundImageContainer extends StatelessWidget {
  const BackgroundImageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/dessert.jpg'), // Replace with your pizza image
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}