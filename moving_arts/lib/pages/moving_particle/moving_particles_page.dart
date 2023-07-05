import 'dart:math';

import 'package:flutter/material.dart';
import 'package:moving_arts/pages/moving_particle/config.dart';
import 'package:moving_arts/pages/moving_particle/moving_particles_painter.dart';
import 'package:moving_arts/utils/particle.dart';
import 'package:moving_arts/utils/color_gen.dart';

class MovingParticlesPage extends StatefulWidget {
  const MovingParticlesPage({super.key});

  @override
  State<MovingParticlesPage> createState() => _MovingParticlesPageState();
}

class _MovingParticlesPageState extends State<MovingParticlesPage>
    with SingleTickerProviderStateMixin {
  late final List<Particle> particles;
  Random rnd = Random();

  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();

    // create particles
    particles = List.generate(100, (index) {
      return Particle(
        position: const Offset(-1, -1),
        color: ColorGen.getRandomSolidColor(),
        radius: rnd.nextDouble() * maxRadius,
        speed: rnd.nextDouble() * maxSpeed, // 0 -> maxSpeed(0.2)
        angle: rnd.nextDouble() * maxAngle, // 0 -> maxAngle(2pi)
      );
    });

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );

    animation = Tween<double>(
      begin: 0,
      end: 300,
    ).animate(controller);

    // animation will give 300 values in 10 secs
    // which amounts to 30fps

    controller
      ..reset()
      ..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return CustomPaint(
          painter: MovingParticlesPainter(particles),
        );
      },
    );
  }
}
