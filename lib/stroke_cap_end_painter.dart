import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_arc_progress_sample/main.dart';

class StrokeCapEndPainter extends CustomPainter {
  StrokeCapEndPainter({
    required this.radius,
    required this.progress,
  });

  final double radius;
  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final endCapPaint = Paint()
      ..isAntiAlias = true
      ..color = _color();

    canvas.rotate(_degreeToRad(135 + 270 * progress));

    canvas.drawCircle(Offset(radius / 2, 0), 10, endCapPaint);
  }

  double _degreeToRad(double degree) => degree * pi / 180;

  Color _color() {
    switch (progress) {
      case > 0.0:
        return Color.fromRGBO(
            ((progressEnd.red - progressStart.red) * progress +
                    progressStart.red)
                .toInt(),
            ((progressEnd.green - progressStart.green) * progress +
                    progressStart.green)
                .toInt(),
            ((progressEnd.blue - progressStart.blue) * progress +
                    progressStart.blue)
                .toInt(),
            1.0);
      default:
        return Colors.transparent;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
