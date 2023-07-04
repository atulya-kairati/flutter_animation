import 'dart:math' show pi;

import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  final double length = 100;

  late AnimationController _xController;
  late AnimationController _yController;
  late AnimationController _zController;

  late Tween<double> _animation;

  @override
  void initState() {
    super.initState();

    _xController =
        AnimationController(vsync: this, duration: const Duration(seconds: 20));
    _yController =
        AnimationController(vsync: this, duration: const Duration(seconds: 30));
    _zController =
        AnimationController(vsync: this, duration: const Duration(seconds: 40));

    _animation = Tween(begin: 0, end: 2 * pi);
  }

  @override
  Widget build(BuildContext context) {
    _xController
      ..reset()
      ..repeat();
    _yController
      ..reset()
      ..repeat();
    _zController
      ..reset()
      ..repeat();

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 200, width: double.infinity),
            AnimatedBuilder(
              animation:
                  Listenable.merge([_xController, _yController, _zController]),
              builder: (context, child) {
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..rotateX(_animation.evaluate(_xController))
                    ..rotateY(_animation.evaluate(_yController))
                    ..rotateZ(_animation.evaluate(_zController)),
                  child: Stack(
                    children: [
                      // back
                      Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..translate(Vector3(0, 0, length)),
                        child: Container(
                          height: length,
                          width: length,
                          color: Colors.green,
                        ),
                      ),
                      // front
                      Container(
                        height: length,
                        width: length,
                        color: Colors.amber,
                      ),
                      //left
                      Transform(
                        alignment: Alignment.centerLeft,
                        transform: Matrix4.identity()..rotateY(-pi / 2),
                        child: Container(
                          height: length,
                          width: length,
                          color: Colors.deepOrangeAccent,
                        ),
                      ),
                      // right
                      Transform(
                        alignment: Alignment.centerRight,
                        transform: Matrix4.rotationY(pi / 2),
                        child: Container(
                          height: length,
                          width: length,
                          color: Colors.lime,
                        ),
                      ),
                      // bottom
                      Transform(
                        alignment: Alignment.bottomCenter,
                        transform: Matrix4.identity()..rotateX(-pi / 2),
                        child: Container(
                          height: length,
                          width: length,
                          color: Colors.pink,
                        ),
                      ),

                      //top
                      Transform(
                        alignment: Alignment.topCenter,
                        transform: Matrix4.identity()..rotateX(pi / 2),
                        child: Container(
                          height: length,
                          width: length,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
