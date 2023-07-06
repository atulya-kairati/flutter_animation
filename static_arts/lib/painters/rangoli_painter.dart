import 'package:flutter/material.dart';
import 'dart:math' show sin, cos, pi;

const radius = 290.0;

class RangoliPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    // for (var center in getCenters(size, radius)) {
    //   canvas.drawCircle(center, radius, paint);
    // }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  Set<Offset> getCenters(Size size, double radius) {

    final center = Offset(
      size.width / 2,
      size.height / 2
    );

    Set<Offset> centers = {};

    helper(Offset localCenter) {
      print(localCenter);
      centers.add(localCenter);

      // calculate next centers on perimeter
      for (var i = 0; i < 6; i++) {
        double angle = pi/3 * i;

        final point = Offset(
          localCenter.dx + radius * cos(angle),
          localCenter.dy + radius * sin(angle),
        );

        if (centers.length > 100) return;

        if (centers.contains(point)) return;

        if (isInsideScreen(point, size)) {
          helper(point);
        }
      }
    }

    helper(center);

    print(centers);

    return centers;
  }

  bool isInsideScreen(Offset point, Size size) {
    final x = point.dx;
    final y = point.dy;

    return (x >= 0 && x <= size.width) && (y >= 0 && y <= size.height);
  }
}


class Point {
  final double x, y;

  Point(this.x, this.y);

  @override
  bool operator ==(Object other) {
    return other is Point
        && other.x == x
        && other.y == y;
  }

  @override
  int get hashCode => Object.hash(x.floor(), y.floor());

  @override
  String toString() => 'Offset(${x.toStringAsFixed(3)}, ${y.toStringAsFixed(3)})';
}