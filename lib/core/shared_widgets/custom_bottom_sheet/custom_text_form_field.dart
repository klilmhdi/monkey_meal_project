import 'package:flutter/material.dart';
import 'package:monkey_meal_project/core/consts/colors/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String hint;
  final bool obscureText;
 final TextInputType? keyboardType;
 final String? Function(String?)? validator;
 final void Function(String)? onChanged;
 final void Function(String?)? onSaved;
  CustomTextFormField({super.key,
    this.keyboardType,this.validator,
    this.onChanged,this.onSaved,
     this.obscureText = false, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColor.placeholder, borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextFormField(
        keyboardType: keyboardType,
        validator:validator ,
        onChanged: onChanged,
        onSaved: onSaved,
        decoration: InputDecoration(
          hintText: this.hint,
          contentPadding: EdgeInsets.all(10),
          labelStyle: TextStyle(color: Colors.grey[600]),
          border: InputBorder.none,
        ),
        obscureText: obscureText,
      ),
    );
  }
}
