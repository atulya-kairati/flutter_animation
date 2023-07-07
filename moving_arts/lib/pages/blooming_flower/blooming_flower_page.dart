import 'package:flutter/material.dart';
import 'package:moving_arts/pages/blooming_flower/flower_painter.dart';

class BloomFlowerPage extends StatefulWidget {
  const BloomFlowerPage({super.key});

  @override
  State<BloomFlowerPage> createState() => _BloomFlowerPageState();
}

class _BloomFlowerPageState extends State<BloomFlowerPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    _animation = Tween<double>(
      begin: 0,
      end: 24,
    
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.fastEaseInToSlowEaseOut));

    _controller
      ..forward();
      // ..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return CustomPaint(
            size: const Size(double.infinity, double.infinity),
            painter: FlowerPainter(_animation.value),
          );
        },
      ),
    );
  }
}
