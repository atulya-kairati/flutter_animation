import 'dart:math';

import 'package:flutter/material.dart';
import 'package:static_arts/utils/color_gen.dart';
import 'package:static_arts/utils/math_utils.dart';

class SquareCirclePainter extends CustomPainter {
  final int noOfSquares;

  SquareCirclePainter(this.noOfSquares);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final squareSide = min(size.width, size.height) / 2;

    // shift the origin to center of the screen
    canvas.translate(center.dx, center.dy);

    // create a square
    final square = Rect.fromCircle(center: Offset.zero, radius: squareSide / 2);


    final squarePaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.red
      ..strokeWidth = 2;

    // calculate rotation angle
    double dAngle = MathUtils.degreeToRadians(90 / noOfSquares);
    double incircleRadius = squareSide / 2;
    double incircleGap = incircleRadius / noOfSquares;
    for (var i = 0; i < noOfSquares; i++) {
      // get color by reducing alpha every iteration
      squarePaint.color = ColorGen.getColorFromAHSV(
        a: 1 - (i / noOfSquares),
        h: 100,
        s: .82,
        v: .96,
      );

      // draw square
      canvas.drawRect(square, squarePaint);

      canvas.drawCircle(
        square.center,
        incircleRadius - (i * incircleGap),
        squarePaint,
      );

      // rotate the canvas acw each time
      canvas.rotate(-dAngle);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
