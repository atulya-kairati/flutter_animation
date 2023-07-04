import 'package:flutter/material.dart';

List<Color> rainbowColor = [
  Colors.purple,
  Colors.indigo,
  Colors.blue,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.red,
];

class RainbowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final bandwidth = size.height / 7;

    for (var i = 0; i < 7; i++) {
      // creating rainbow band
      final rect = Rect.fromPoints(
        Offset(0, bandwidth * i),
        Offset(size.width, bandwidth * (i + 1)),
      );

      // getting band color
      final paint = Paint()..color = rainbowColor[i];

      // draw
      canvas.drawRect(rect, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
