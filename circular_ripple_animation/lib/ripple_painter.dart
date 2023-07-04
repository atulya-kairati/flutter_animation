import 'package:circular_ripple_animation/utils.dart';
import 'package:flutter/material.dart';


class RipplePainter extends CustomPainter {
  final double _initRadius;

  final ripplePaint = Paint()
    ..color = Colors.red
    ..isAntiAlias = true
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2.0;

  RipplePainter({@required initRadius}) : _initRadius = initRadius;

  @override
  void paint(Canvas canvas, Size size) {
    double currentRadius = _initRadius;

    Offset center = Offset(size.width / 2, size.height / 2);
    double maxRadius = center.distance; // distance from origin to center

    while (currentRadius <= maxRadius) {
      canvas.drawCircle(center, currentRadius, ripplePaint);
      currentRadius += waveGap;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
