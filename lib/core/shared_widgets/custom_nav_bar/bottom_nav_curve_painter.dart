import 'package:flutter/material.dart';

class BottomNavCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;

    // Path of bottom nav background
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(width * 0.30, 0)
      ..quadraticBezierTo(width * 0.34, 0, width * 0.375, 30)
      ..arcToPoint(
        Offset(width * 0.625, 30),
        radius: Radius.circular(50),
        clockwise: false,
      )
      ..quadraticBezierTo(width * 0.66, 0, width * 0.70, 0)
      ..lineTo(width, 0)
      ..lineTo(width, height)
      ..lineTo(0, height)
      ..close();

    // Gradient shadow
    final shadowGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.black.withValues(alpha: 0.9),
        Colors.transparent,
      ],
    );

    final shadowPaint = Paint()
      ..shader = shadowGradient.createShader(
        Rect.fromLTWH(0, 0, width, height + 400),
      )
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 60);

    // White background paint
    final backgroundPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // Draw shadow first
    canvas.drawPath(path, shadowPaint);

    // Draw background on top
    canvas.drawPath(path, backgroundPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}