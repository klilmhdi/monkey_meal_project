import 'package:flutter/material.dart';
import 'package:monkey_meal_project/core/consts/colors/colors.dart';
class CustomButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const CustomButton({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
    width: double.infinity, // Makes the button expand to fill available width
    height: 50.0,
    child: ElevatedButton(
    onPressed:onPressed ,
    style: ElevatedButton.styleFrom(
    backgroundColor: AppColor.orange, // Vibrant orange color
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10.0), // Smooth rounded corners
    ),
    textStyle: const TextStyle(
    fontWeight: FontWeight.bold, // Clear and bold text
    fontSize: 18.0,
    ),
    ),
    child:  Text(
    title,
    style: TextStyle(color: Colors.white), // White text color for contrast
    ),
    ),
    );  }
}
