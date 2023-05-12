import 'package:flutter/material.dart';
import 'dart:math' show pi, sin, cos;

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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _sidesController;
  late Animation _sideAnimation;

  late AnimationController _radiusController;
  late Animation _radiusAnimation;

  @override
  void initState() {
    super.initState();

    _sidesController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _sideAnimation = IntTween(
      begin: 3,
      end: 10,
    ).animate(_sidesController);

    _radiusController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _radiusAnimation = Tween(
      begin: 20.0,
      end: 400.0,
    )
        .chain(
          CurveTween(curve: Curves.bounceInOut),
        )
        .animate(_radiusController);

    _sidesController.repeat(reverse: true);
    _radiusController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: Listenable.merge([
            _sideAnimation,
            _radiusAnimation,
          ]),
          builder: (context, child) {
            return CustomPaint(
              painter: Polygon(sides: _sideAnimation.value),
              child: SizedBox(
                width: _radiusAnimation.value,
                height: _radiusAnimation.value,
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _sidesController.dispose();
    _radiusController.dispose();
    super.dispose();
  }
}

class Polygon extends CustomPainter {
  final int sides;

  Polygon({required this.sides});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3;

    final path = Path();

    final center = Offset(size.width / 2, size.height / 2);

    final exteriorAngle = (2 * pi) / sides;

    final angles = List.generate(sides, (index) => exteriorAngle * index);

    final radius = size.width / 2;

    path.moveTo(
      center.dx + radius * cos(0),
      center.dy + radius * sin(0),
    );

    for (var angle in angles) {
      path.lineTo(
        center.dx + radius * cos(angle),
        center.dy + radius * sin(angle),
      );
    }

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      oldDelegate is Polygon && oldDelegate.sides != sides;
}
