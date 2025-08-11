import 'package:flutter/material.dart';
import 'package:monkey_meal_project/src/screens/food_details/component/portion_button.dart';
class PortionCounterSection extends StatelessWidget {
  final int selectedPortions;
  final Function(int) onPortionChanged;

  const PortionCounterSection({
    super.key,
    required this.selectedPortions,
    required this.onPortionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Number of Portions',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),

        const SizedBox(height: 16),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PortionButton(
              icon: Icons.remove,
              onTap: () {
                if (selectedPortions > 1) {
                  onPortionChanged(selectedPortions - 1);
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                '$selectedPortions',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            PortionButton(
              icon: Icons.add,
              onTap: () {
                onPortionChanged(selectedPortions + 1);
              },
            ),
          ],
        ),
      ],
    );
  }
}
