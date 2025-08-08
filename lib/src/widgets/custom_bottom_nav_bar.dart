import 'package:flutter/material.dart';
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

class BottomNavCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.fill;

    final path = Path();
    final width = size.width;
    final height = size.height;

    path.moveTo(0, 0);
    path.lineTo(width * .30, 0);

    path.quadraticBezierTo(width * .34, 0, width * .375, 30);

    path.arcToPoint(
      Offset(width * .625, 30),
      radius: Radius.circular(50),
      clockwise: false,
    );
    path.quadraticBezierTo(width * .66, 0, width * .70, 0);

    path.lineTo(width, 0);
    path.lineTo(width, height);
    path.lineTo(0, height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
