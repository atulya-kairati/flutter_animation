import 'package:flutter/material.dart';

class Line {
  final Offset start;
  final Offset end;
  final Color color;
  final double width;

  Line({
    required this.start,
    required this.end,
    this.color = Colors.white,
    this.width = 2,
  });
}
