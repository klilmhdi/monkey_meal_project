import 'package:flutter/material.dart';
import 'package:monkey_meal_project/src/helper/helper.dart';
import 'package:monkey_meal_project/src/widgets/home_widgets/custom_nav_bar/bottom_nav_curve_painter.dart';

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
    return SizedBox(
      height: 90,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CustomPaint(
            size: Size(Helper.getScreenWidth(context), 80),
            painter: BottomNavCurvePainter(),
          ),
          Positioned(
            bottom: 35,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavIcon(Icons.grid_view_sharp, 0, 'Menu'),
                _buildNavIcon(Icons.shopping_bag, 1, 'Offers'),
                SizedBox(width: 80),
                _buildNavIcon(Icons.person, 3, 'Profile'),
                _buildNavIcon(Icons.read_more_outlined, 4, 'More'),
              ],
            ),
          ),
          Positioned(
            top: -35,
            left: Helper.getScreenWidth(context) / 2 - 40,

            child: GestureDetector(
              onTap: ()=>onTap(2),
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: currentIndex == 2 ? Colors.orange : Colors.grey,
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8)],
                ),
                child: Icon(Icons.home, color: Colors.white, size: 45),
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
        children: [
          Icon(
            icon,
            color: currentIndex == index ? Colors.orange : Colors.grey,
            size: 20,
          ),
          Text(
            iconName,
            style: TextStyle(
              fontSize: 12,
              color: currentIndex == index ? Colors.orange : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

