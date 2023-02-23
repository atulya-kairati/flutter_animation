import 'package:flutter/material.dart';

import 'circle_side_enum.dart';

class HalfCircle extends CustomClipper<Path> {
  final CircleSide circleSide;

  const HalfCircle({required this.circleSide});

  /// Returns the path
  @override
  Path getClip(Size size) => circleSide.toPath(size);

  /// Tells if the clipper should be redrawn if there is any change in the parent
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
