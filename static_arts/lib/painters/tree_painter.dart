import 'package:flutter/material.dart';
import 'package:static_arts/utils/line.dart';
import 'package:static_arts/utils/math_utils.dart';

class TreePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final start = Offset(size.width * 0.5, size.height * 0.8);
    const length = 60.0;
    var angle = MathUtils.degreeToRadians(-90);

    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    var line = Line(
      start: start,
      end: MathUtils.polarToCartesian(length, angle) + start,
    );

    _treeMaker(canvas, paint, line, angle, length);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  void _treeMaker(Canvas canvas, Paint paint, Line line, double angle, double length) {

    // exit condition
    if (length < 1) return;

    canvas.drawLine(line.start, line.end, paint);

    final start = line.end;

    final rAngle = angle - MathUtils.degreeToRadians(-8);
    _treeMaker(
      canvas,
      paint,
      Line(start: start, end: MathUtils.polarToCartesian(length, rAngle) + start),
      rAngle,
      length * 0.7,
    );

    final lAngle = angle - MathUtils.degreeToRadians(8);
    _treeMaker(
      canvas,
      paint,
      Line(start: start, end: MathUtils.polarToCartesian(length, lAngle) + start),
      lAngle,
      length * 0.7,
    );
  }
}
