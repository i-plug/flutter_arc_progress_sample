import 'dart:math';

import 'package:flutter/material.dart';

class BaseArcPainter extends CustomPainter {
  const BaseArcPainter({
    required this.radius,
  }) : super();

  final double radius;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black12
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20
      ..strokeCap = StrokeCap.round;

    final rect = Rect.fromCenter(
        center: const Offset(0, 0), width: radius, height: radius);

    canvas.rotate(_degreeToRad(135));

    canvas.drawArc(
      rect,
      _degreeToRad(0),
      _degreeToRad(270),
      false,
      paint,
    );
  }

  double _degreeToRad(double degree) => degree * pi / 180;

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
