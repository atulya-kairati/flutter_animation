import 'package:flutter/material.dart';
import 'package:moving_arts/pages/moving_blob_field/blob_field.dart';
import 'package:moving_arts/pages/moving_blob_field/blob_painter.dart';

class MovingBlobPage extends StatefulWidget {
  const MovingBlobPage({super.key});

  @override
  State<MovingBlobPage> createState() => _MovingBlobPageState();
}

class _MovingBlobPageState extends State<MovingBlobPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));

    animation = Tween<double>(
      begin: 3,
      end: 10,
    ).animate(controller);

    controller
      ..reset()
      ..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return CustomPaint(
          painter: BlobPainter(
            BlobField(MediaQuery.of(context).size, animation.value.toInt(), 30),
          ),
        );
      },
    );
  }
}
