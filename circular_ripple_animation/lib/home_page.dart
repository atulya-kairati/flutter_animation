import 'package:circular_ripple_animation/ripple_painter.dart';
import 'package:circular_ripple_animation/utils.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController initRadiiController;
  late Animation initRadiiAnimation;

  @override
  void initState() {
    super.initState();

    // we will animate the radius of innermost circle 
    // and draw the outer circles according to it
    // an we will repeat it
    initRadiiController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    initRadiiAnimation = Tween<double>(
      begin: 0,
      end: waveGap,
    ).animate(initRadiiController);

    initRadiiController
      ..reset()
      ..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: initRadiiAnimation,
      builder: (context, child) {
        return CustomPaint(
          painter: RipplePainter(initRadius: initRadiiAnimation.value),
        );
      },
    );
  }
}
