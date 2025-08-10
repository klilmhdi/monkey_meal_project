import 'package:flutter/material.dart';
import 'package:monkey_meal_project/core/consts/colors/colors.dart' ;
class SummaryRowWidget extends StatelessWidget {
  final String title;
  final String price;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? priceColor;
 const  SummaryRowWidget({super.key, required this.title, required this.price,
       this.fontSize=12,this.fontWeight=FontWeight.w500,this.priceColor=Colors.black});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: 'Metropolis',
            fontWeight: fontWeight,
            fontSize: fontSize,
          ),
        ),
        Text(
          price,
          style: TextStyle(
            fontFamily: 'Metropolis',
            fontWeight: fontWeight,
            fontSize: fontSize,
            color: priceColor
          ),
        ),      ],
    );  }
}
