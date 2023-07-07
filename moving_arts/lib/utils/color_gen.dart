import 'dart:math';

import 'package:flutter/material.dart';

class ColorGen {
  static Color getRandomSolidColor() {
    final rand = Random();

    return Color.fromARGB(
      255, // opaque
      rand.nextInt(256),
      rand.nextInt(256),
      rand.nextInt(256),
    );
  }

  static Color getRandomPrettyColor() {
    final random = Random();

    final alpha = random.nextDouble();
    final double hue = random.nextInt(360 + 1).toDouble();
    const saturation = 0.5;
    const value = 0.9;

    final hsv = HSVColor.fromAHSV(alpha, hue, saturation, value);

    return hsv.toColor();
  }

  static Color getColorFromAHSV({
    double a = 1,
    required double h,
    required double s,
    required double v,
  }) {
    return HSVColor.fromAHSV(a, h, s, v).toColor();
  }
}
