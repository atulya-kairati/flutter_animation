import 'package:flutter/material.dart';
import 'dart:math' show pi;

import 'package:flutter_animation_practice_2/split_circle_widget.dart';
import 'extensions.dart' show DelayedCall;


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late AnimationController _counterClkRotationController;
  late Animation _counterClkRotationAnimation;

  late AnimationController _flipAnimationController;
  late Animation _flipAnimation;

  @override
  void initState() {
    super.initState();

    _counterClkRotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _counterClkRotationAnimation =
        Tween<double>(begin: 0.0, end: -(pi / 2)).animate(CurvedAnimation(
      parent: _counterClkRotationController,
      curve: Curves.bounceOut,
    ));

    _flipAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _flipAnimation = Tween<double>(begin: 0, end: pi).animate(CurvedAnimation(
      parent: _flipAnimationController,
      curve: Curves.bounceOut,
    ));

    _counterClkRotationAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _flipAnimation = Tween<double>(
          begin: _flipAnimation.value,
          end: _flipAnimation.value + pi,
        ).animate(CurvedAnimation(
          parent: _flipAnimationController,
          curve: Curves.bounceOut,
        ));

        _flipAnimationController
          ..reset()
          ..forward();
      }
    });

    _flipAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _counterClkRotationAnimation = Tween<double>(
          begin: _counterClkRotationAnimation.value,
          end: _counterClkRotationAnimation.value - (pi / 2),
        ).animate(CurvedAnimation(
          parent: _counterClkRotationController,
          curve: Curves.bounceOut,
        ));

        _counterClkRotationController
          ..reset()
          ..forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _counterClkRotationController
      ..reset()
      ..forward.delayed(const Duration(seconds: 1));

    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _counterClkRotationController,
          builder: (context, child) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..rotateZ(_counterClkRotationAnimation.value),
              child: AnimatedBuilder(
                animation: _flipAnimationController,
                builder: (context, child) {
                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..rotateY(_flipAnimation.value),
                    child: const SplitCircle(),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _counterClkRotationController.dispose();
    super.dispose();
  }
}
