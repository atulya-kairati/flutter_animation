import 'dart:math';

import 'package:flutter/material.dart';

class ColorGen {
  static Color getRandomSolidColors() {
    final rand = Random();

    return Color.fromARGB(
      255, // opaque
      rand.nextInt(256),
      rand.nextInt(256),
      rand.nextInt(256),
    );
  }
}
