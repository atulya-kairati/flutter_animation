import 'package:flutter/material.dart';

enum CircleSide { left, right }

extension ToPath on CircleSide {
  Path toPath(Size size) {
    final path = Path();

    late Offset arcEnd;
    late bool isClockwise;

    switch (this) {
      case CircleSide.left:
        // moved to top right which is starting of the arc
        path.moveTo(size.width, 0);
        // set the other end of the of the arc
        arcEnd = Offset(size.width, size.height);
        isClockwise = false;
        break;
      case CircleSide.right:
        path.moveTo(0, 0);
        arcEnd = Offset(0, size.height);
        isClockwise = true;
        break;
    }

    path.arcToPoint(
      arcEnd,
      clockwise: isClockwise,
      radius: Radius.elliptical(size.width / 2, size.height / 2),
    );

    // return to the starting position to complete the path
    path.close();

    return path;
  }
}

