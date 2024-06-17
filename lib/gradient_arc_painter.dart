import 'dart:math';

import 'package:flutter/material.dart';

import 'main.dart';

class GradientArcPainter extends CustomPainter {
  GradientArcPainter({
    required this.radius,
    required this.progress,
  });

  final double radius;
  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final startCapPaint = Paint()
      ..isAntiAlias = true
      ..color = progressStart;

    final gradientArcPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20
      ..strokeCap = StrokeCap.butt
      ..shader = SweepGradient(
        colors: const [progressStart, progressEnd],
        tileMode: TileMode.mirror,
        startAngle: _degreeToRad(10),
        endAngle: _degreeToRad(270),
      ).createShader(Rect.fromCircle(center: const Offset(0, 0), radius: 0));

    final canvasRect = Rect.fromCenter(
        center: const Offset(0, 0), width: radius + 20, height: radius + 20);
    final arcRect = Rect.fromCenter(
        center: const Offset(0, 0), width: radius, height: radius);

    canvas.saveLayer(canvasRect, Paint());
    canvas.rotate(_degreeToRad(135));
    canvas.drawArc(
        arcRect, _degreeToRad(0), _degreeToRad(270), false, gradientArcPaint);
    canvas.drawCircle(Offset(radius / 2, 0), 10, startCapPaint);
    canvas.rotate(_degreeToRad(270));

    canvas.drawArc(
        arcRect,
        _degreeToRad(0),
        _degreeToRad(270) * (progress - 1.0),
        false,
        Paint()
          ..color = Colors.black
          ..style = PaintingStyle.stroke
          ..strokeWidth = 22
          ..strokeCap = StrokeCap.round
          ..blendMode = BlendMode.clear);

    canvas.restore();
  }

  double _degreeToRad(double degree) => degree * pi / 180;

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
