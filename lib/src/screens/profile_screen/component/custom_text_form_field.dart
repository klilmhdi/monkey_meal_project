import 'package:flutter/material.dart';
import 'package:monkey_meal_project/src/helper/colors.dart';
class CustomTextFormField extends StatefulWidget {
 final String label;
 final String value;
 final bool obscureText;
   CustomTextFormField({super.key,required this. label,required this. value,
     this.obscureText = false});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.placeholder,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextField(
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: TextStyle(color: Colors.grey[600]),
          border: InputBorder.none,
        ),
        controller: TextEditingController(text: widget.value),
        obscureText: widget.obscureText,
      ),
    );
  }


}
