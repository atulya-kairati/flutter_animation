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
}
