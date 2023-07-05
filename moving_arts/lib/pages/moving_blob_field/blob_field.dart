import 'dart:math';

import 'package:flutter/material.dart';
import 'package:moving_arts/utils/color_gen.dart';
import 'package:moving_arts/utils/math_utils.dart';
import 'package:moving_arts/utils/particle.dart';

class BlobField {
  final Size screenSize;
  final int blobCount;
  final double bigBlobRadius;
  late final Offset origin;
  final List<Particle> _allBlobs = [];

  BlobField(this.screenSize, this.blobCount, this.bigBlobRadius) {
    origin = Offset(
      screenSize.width / 2,
      screenSize.height / 2,
    );
    _genBlobs(bigBlobRadius, origin);
  }

  void _genBlobs(
    double radius,
    Offset localOrigin,
  ) {
    // recursion exit condition
    if (radius < (bigBlobRadius / 20)) return;

    // adding central blob
    _allBlobs.add(Particle.withZeroVelocity(
      position: localOrigin,
      color: Colors.greenAccent,
      // color: ColorGen.getRandomSolidColor(),
      radius: radius,
    ));

    final centralAngle = (2 * pi) / blobCount;
    double angle = 0.0;

    for (var i = 0; i < blobCount; i++) {
      // get position of child blob
      final childBlobPosition =
          MathUtils.polarToCartesian(radius * 3, angle) + localOrigin;

      angle += centralAngle;

      final childRadius = radius * 0.38;
      _genBlobs(childRadius, childBlobPosition);
    }
  }

  void update() {}

  List<Particle> get blobs => _allBlobs;
}
