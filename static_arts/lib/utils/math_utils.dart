import 'dart:math';

import 'package:flutter/material.dart';

class MathUtils {
  static Offset polarToCartesian(double r, double theta) {
    return Offset(r * cos(theta), r * sin(theta));
  }

  static double degreeToRadians(double degree) {
    return degree * pi / 180;
  }
}
