import 'package:flutter/material.dart';
import 'package:monkey_meal_project/core/shared_widgets/custom_nav_bar/bottom_nav_curve_painter.dart';
import 'package:monkey_meal_project/src/helper/helper.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    final screenWidth = Helper.getScreenWidth(context);

    return SizedBox(
      height: 90,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Painted background with shadow
          CustomPaint(
            size: Size(screenWidth, 100),
            painter: BottomNavCurvePainter(),
          ),

          // Navigation icons
          Positioned(
            bottom: 35,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavIcon(Icons.grid_view_sharp, 0, 'Menu'),
                _buildNavIcon(Icons.shopping_bag, 1, 'Offers'),
                const SizedBox(width: 80), // Space for the center button
                _buildNavIcon(Icons.person, 3, 'Profile'),
                _buildNavIcon(Icons.read_more_outlined, 4, 'More'),
              ],
            ),
          ),

          // Floating home button
          Positioned(
            top: -35,
            left: screenWidth / 2 - 40,
            child: GestureDetector(
              onTap: () => onTap(2),
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: currentIndex == 2 ? Colors.orange : Colors.grey,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 15,
                      offset: const Offset(0, -5),
                    ),
                  ],
                ),
                child: const Icon(Icons.home, color: Colors.white, size: 45),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavIcon(IconData icon, int index, String iconName) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: currentIndex == index ? Colors.orange : Colors.grey,
            size: 20,
          ),
          const SizedBox(height: 4),
          Text(
            iconName,
            style: TextStyle(
              fontSize: 12,
              color: currentIndex == index ? Colors.orange : Colors.grey,
              fontWeight: currentIndex == index
                  ? FontWeight.w600
                  : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}