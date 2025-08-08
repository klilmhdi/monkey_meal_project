import 'package:flutter/material.dart';

class FoodTypeCardImage extends StatelessWidget {
  const FoodTypeCardImage({
    super.key,
    
    required this.imagePath,
  });

 
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      width: 88,
      decoration: BoxDecoration(
        
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        )
        ,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
    );
  }
}