import 'package:flutter/material.dart';

import 'circle_side_enum.dart';
import 'half_circle_clipper.dart';

class SplitCircle extends StatelessWidget {
  const SplitCircle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipPath(
          clipper: const HalfCircle(circleSide: CircleSide.left),
          child: Container(
            width: 100,
            height: 100,
            color: Colors.blue,
          ),
        ),
        ClipPath(
          clipper: const HalfCircle(circleSide: CircleSide.right),
          child: Container(
            width: 100,
            height: 100,
            color: Colors.yellow,
          ),
        ),
      ],
    );
  }
}