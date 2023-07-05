// ignore_for_file: file_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:moving_arts/utils/math_utils.dart';

class Particle {
  Offset position;
  Color color;

  double speed;
  double angle;

  double radius;

  Particle({
    // position is in cartesian form
    required this.position,

    // properties of the particle
    required this.color,
    required this.radius,

    // for representing velocity in polar form
    required this.speed,
    required this.angle,
  });

  bool isOffScreen({required Size screenSize}) {
    /// Checks if the particle is out of screen or not
    return position.dx < 0 ||
        position.dy < 0 ||
        position.dx > screenSize.width ||
        position.dy > screenSize.height;
  }

  void spawnAtRandom({required Size screenSize}) {
    /// Sets the position to a random point inside the screen

    Random random = Random();

    final newPosition = Offset(
      random.nextDouble() * screenSize.width,
      random.nextDouble() * screenSize.height,
    );

    position = newPosition;
  }

  void move(){
    final velocity = MathUtils.polarToCartesian(speed, angle);
    position = position + velocity;
  }
}
