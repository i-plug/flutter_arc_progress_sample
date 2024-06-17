import 'package:flutter/material.dart';
import 'package:flutter_arc_progress_sample/base_arc_painter.dart';
import 'package:flutter_arc_progress_sample/gradient_arc_painter.dart';
import 'package:flutter_arc_progress_sample/stroke_cap_end_painter.dart';

class GradientProgress extends StatefulWidget {
  const GradientProgress({
    super.key,
    required this.radius,
    required this.progress,
  });

  final double radius;
  final double progress;

  @override
  State<GradientProgress> createState() => _GradientProgressState();
}

class _GradientProgressState extends State<GradientProgress> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          painter: BaseArcPainter(radius: widget.radius),
        ),
        CustomPaint(
          painter: StrokeCapEndPainter(
              radius: widget.radius, progress: widget.progress),
        ),
        CustomPaint(
          painter: GradientArcPainter(
              radius: widget.radius, progress: widget.progress),
        ),
      ],
    );
  }
}
