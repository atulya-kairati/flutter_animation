import 'dart:math';

import 'package:flutter/material.dart';

class DiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    canvas.drawColor(Colors.white, BlendMode.color);

    final gap = size.width / 20;
    
    for (double i = 0; i <= size.width; i+=gap) {
      final paint = Paint()
        ..color = getRandomColor()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 5;

        final start = Offset(i, 0);
        final end = Offset(size.width - i, size.height);

        canvas.drawLine(start, end, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}


Color getRandomColor() => Color.fromRGBO(
  Random().nextInt(256),
  Random().nextInt(256),
  Random().nextInt(256),
  0.8,
);