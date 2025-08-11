import 'package:flutter/material.dart';
class RatingSection extends StatelessWidget {
  const RatingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: List.generate(5, (index) {
            return Icon(
              index < 4 ? Icons.star : Icons.star_border,
              color: Colors.orange,
              size: 20,
            );
          }),
        ),
        const SizedBox(width: 8),
        Text(
          '4 Star Ratings',
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
