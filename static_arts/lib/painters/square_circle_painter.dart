import 'dart:math';

import 'package:flutter/material.dart';
import 'package:static_arts/utils/math_utils.dart';

class SquareCirclePainter extends CustomPainter {
  final int noOfSquares;

  SquareCirclePainter(this.noOfSquares);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final squareSide = min(size.width, size.height) / 2;
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.cyanAccent
      ..strokeWidth = 1;

    // shift the origin to center of the screen
    canvas.translate(center.dx, center.dy);

    // create a square
    final square = Rect.fromCircle(center: Offset.zero, radius: squareSide / 2);

    // calculate rotation angle
    double dAngle = MathUtils.degreeToRadians(90 / noOfSquares);

    for (var i = 0; i < noOfSquares; i++) {
      // draw square
      canvas.drawRect(square, paint);

      // rotate the canvas each time
      canvas.rotate(dAngle);
    }
    
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
