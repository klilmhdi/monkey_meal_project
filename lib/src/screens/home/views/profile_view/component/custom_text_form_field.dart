import 'package:flutter/material.dart';
import 'package:monkey_meal_project/core/consts/colors/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final String value;
  final bool obscureText;
  final TextEditingController? controller;
 final TextInputType? keyboardType;
 final String? Function(String?)? validator;
 final void Function(String)? onChanged;
 final void Function(String?)? onSaved;
  CustomTextFormField({super.key, required this.label, required this.value,
    this.keyboardType,this.validator,
    this.onChanged,this.onSaved,
    this.controller, this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColor.placeholder, borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextFormField(
          controller:controller,
        keyboardType: keyboardType,
        validator:validator ,
        onChanged: onChanged,
        onSaved: onSaved,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey[600]),
          border: InputBorder.none,
        ),
        obscureText: obscureText,
      ),
    );
  }
}
