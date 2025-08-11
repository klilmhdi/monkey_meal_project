import 'package:flutter/material.dart';
class PaymentOption extends StatelessWidget {
  final     String text;
  final bool isSelected;
  final VoidCallback onTap;
  const PaymentOption({super.key, required this.text, required this.isSelected, required this.onTap, });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: isSelected ? Colors.orange : Colors.black,
            ),
          ),
          if (isSelected)
            const Icon(
              Icons.check_circle,
              color: Colors.orange,
            ),
        ],
      ),
    );  }
}
