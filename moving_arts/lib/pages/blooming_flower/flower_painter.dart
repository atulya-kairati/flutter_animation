import 'dart:math';

import 'package:flutter/material.dart';

import '../../utils/color_gen.dart';
import '../../utils/line.dart';
import '../../utils/math_utils.dart';

const maxLength = 120.0;

class FlowerPainter extends CustomPainter {
  final double divergenceAngle;

  FlowerPainter(this.divergenceAngle);

  @override
  void paint(Canvas canvas, Size size) {
    final start = Offset(size.width * 0.5, size.height * 0.8);
    var angle = MathUtils.degreeToRadians(-90);

    final paint = Paint()
      ..color = Colors.pink
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    // create the base line
    var line = Line(
      start: start,
      end: MathUtils.polarToCartesian(maxLength, angle) + start,
    );

    // recursively draw lines
    _treeMaker(canvas, paint, line, angle, maxLength);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void _treeMaker(
    Canvas canvas,
    Paint paint,
    Line line,
    double angle,
    double length,
  ) {
    // exit condition
    if (length < 1) return;

    // branch gradient
    paint.color =
        paint.color.withOpacity(pow(length / maxLength, 0.18).toDouble());
    // paint.color = ColorGen.getRandomSolidColor();

    // draw parent
    canvas.drawLine(line.start, line.end, paint);

    final start = line.end;

    // for right child line
    final rAngle = angle - MathUtils.degreeToRadians(divergenceAngle);
    _treeMaker(
      canvas,
      paint,
      Line(
        start: start,
        end: MathUtils.polarToCartesian(length, rAngle) + start,
      ),
      rAngle,
      length * 0.65,
    );

    // for left child line
    final lAngle = angle - MathUtils.degreeToRadians(-divergenceAngle);
    _treeMaker(
      canvas,
      paint,
      Line(
        start: start,
        end: MathUtils.polarToCartesian(length, lAngle) + start,
      ),
      lAngle,
      length * 0.65,
    );
  }
}
