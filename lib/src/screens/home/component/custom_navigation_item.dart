import 'package:flutter/material.dart';
class CustomNavigationItem extends StatelessWidget {
 final IconData icon;
 final String label;
 final int index;
 final bool isHighlighted;
 void Function()? onTap ;
   CustomNavigationItem({super.key, required this.icon,
    required this.label, required this.index,  this.isHighlighted=false,this.onTap});

  @override
  Widget build(BuildContext context) {
    Color iconColor = isHighlighted ? Colors.orange : Colors.black54;
    Color textColor = isHighlighted ? Colors.orange : Colors.black54;
    return   Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: iconColor),
                const SizedBox(height: 4),
                Text(
                  label,
                  style: TextStyle(color: textColor, fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
