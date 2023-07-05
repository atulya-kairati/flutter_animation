import 'package:flutter/material.dart';
import 'package:moving_arts/utils/particle.dart';

class MovingParticlesPainter extends CustomPainter {

  final List<Particle> particles;

  MovingParticlesPainter(this.particles);

  @override
  void paint(Canvas canvas, Size size) {
    // final center = Offset(size.width / 2, size.height / 2);

    // moving particles
    for (Particle particle in particles) {

      particle.move();

      if(particle.isOffScreen(screenSize: size)) {
        particle.spawnAtRandom(screenSize: size);
      }
    }

    // painting particles on canvas
    for (var particle in particles) {
      final paint = Paint()
        ..color = particle.color;
      canvas.drawCircle(particle.position, particle.radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // since we are always going to repaint
  }
}
