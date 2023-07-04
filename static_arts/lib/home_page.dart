import 'package:flutter/material.dart';
import 'package:static_arts/painters/diagonal_painter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(double.infinity, double.infinity),
      painter: DiagonalPainter(),
    );
  }
}