import 'package:flutter/material.dart';

class BottomNavCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // Add shadow paint
    final shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.1)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 4);

    final path = Path();
    final width = size.width;
    final height = size.height;

    // Create the curved path
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

    // Draw shadow first
    canvas.drawPath(path, shadowPaint);
    // Then draw the white background
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

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
    return Container(
      height: 90,
      // Add white background to ensure separation
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Custom painted background
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width, 80),
            painter: BottomNavCurvePainter(),
          ),
          
          // Navigation icons
          Positioned(
            bottom: 20, // Increased bottom spacing
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavIcon(Icons.grid_view_sharp, 0, 'Menu'),
                _buildNavIcon(Icons.shopping_bag, 1, 'Offers'),
                SizedBox(width: 80), // Space for the floating home button
                _buildNavIcon(Icons.person, 3, 'Profile'),
                _buildNavIcon(Icons.read_more_outlined, 4, 'More'),
              ],
            ),
          ),
          
          // Floating home button
          Positioned(
            top: -30, // Adjusted position
            left: MediaQuery.of(context).size.width / 2 - 35,
            child: GestureDetector(
              onTap: () => onTap(2),
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: currentIndex == 2 ? Colors.orange : Colors.grey,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    )
                  ],
                ),
                child: Icon(Icons.home, color: Colors.white, size: 35),
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
            size: 24,
          ),
          SizedBox(height: 4), // Add spacing between icon and text
          Text(
            iconName,
            style: TextStyle(
              fontSize: 11,
              color: currentIndex == index ? Colors.orange : Colors.grey,
              fontWeight: currentIndex == index ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}