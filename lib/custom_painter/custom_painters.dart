import 'dart:math';

import 'package:flutter/material.dart';

enum CustomPainterFor {
  rectangle,
  circle,
  oval,
  line,
  pathTraingle,
  pathStar,
}

class CustomPainters extends CustomPainter {
  CustomPainters({required this.customPainterFor});

  final CustomPainterFor customPainterFor;

  @override
  void paint(Canvas canvas, Size size) {
    switch (customPainterFor) {
      case CustomPainterFor.circle:
        drawCircle(canvas, size);
        break;

      case CustomPainterFor.oval:
        drawOval(canvas, size);
        break;

      case CustomPainterFor.rectangle:
        drawRecangle(canvas, size);
        break;

      case CustomPainterFor.line:
        drawLine(canvas, size);
        break;

      case CustomPainterFor.pathTraingle:
        drawPathTriangle(canvas, size);
        break;

      case CustomPainterFor.pathStar:
        drawPathStar(canvas, size);
        break;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

// circle painter
  void drawCircle(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..color = Colors.white;

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 70, paint);
  }

  //oval painter
  void drawOval(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black38
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    final rect = Rect.fromLTWH(size.width * 0.35, size.height * 0.1,
        size.width * 0.3, size.height * 0.8);

    canvas.drawOval(rect, paint);
  }

  //rectangle painter
  void drawRecangle(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..color = Colors.lime;

    final rect = Rect.fromLTWH(100, 50, 200, 100);
    //basic rect
    // canvas.drawRect(rect, paint);

    //rect with radius
    // canvas.drawRRect(RRect.fromRectAndRadius(rect, Radius.circular(12)), paint);

    // rect with indidivual corner radius
    canvas.drawRRect(
        RRect.fromRectAndCorners(rect,
            topLeft: Radius.circular(100),
            bottomRight: Radius.circular(100),
            topRight: Radius.circular(100)),
        paint);
  }

  //line painter
  void drawLine(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.deepOrangeAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    canvas.drawLine(Offset(0, 200), Offset(400, 200), paint);
    canvas.drawLine(Offset(200, 0), Offset(200, 400), paint);
    canvas.drawLine(Offset(0, 0), Offset(400, 400), paint);
    canvas.drawLine(Offset(0, 400), Offset(400, 0), paint);
    canvas.drawLine(Offset(0, 200), Offset(200, 0), paint);
    canvas.drawLine(Offset(400, 200), Offset(200, 0), paint);
    canvas.drawLine(Offset(400, 200), Offset(200, 400), paint);
    canvas.drawLine(Offset(0, 200), Offset(200, 400), paint);
    canvas.drawLine(Offset(0, 100), Offset(400, 100), paint);
    canvas.drawLine(Offset(0, 300), Offset(400, 300), paint);
    canvas.drawLine(Offset(100, 400), Offset(100, 0), paint);
    canvas.drawLine(Offset(300, 400), Offset(300, 0), paint);
  }

  //path triangle
  void drawPathTriangle(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    final path = Path()
      ..moveTo(size.width * 0.5, size.height * 0.25)
      ..lineTo(size.width * 0.8, size.height * 0.75)
      ..lineTo(size.width * 0.25, size.height * 0.75)
      ..close();

    canvas.drawPath(path, paint);
  }

  //path star
  void drawPathStar(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.orange;

    // Center of the canvas
    final centerX = size.width / 2;
    final centerY = size.height / 2;

    // Outer radius (distance from center to outer points)
    final outerRadius = size.width * 0.25;

    // Inner radius (distance from center to inner points)
    final innerRadius = outerRadius * 0.4;

    // Number of points in the star
    final numPoints = 5;

    // Angle between each point (in radians)
    final angle = (2 * pi) / numPoints;

    // Create the star path
    final path = Path();

    for (int i = 0; i < numPoints * 2; i++) {
      // Alternate between outer and inner points
      final radius = i % 2 == 0 ? outerRadius : innerRadius;

      // Calculate the x and y coordinates of the current point
      final x = centerX + radius * cos(i * angle - pi / 2);
      final y = centerY + radius * sin(i * angle - pi / 2);

      // Move to the first point or draw a line to the next point
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    // Close the path to complete the star
    path.close();

    // Draw the star
    canvas.drawPath(path, paint);
  }
}
