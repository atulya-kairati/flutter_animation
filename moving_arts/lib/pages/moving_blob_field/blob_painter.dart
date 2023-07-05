import 'package:flutter/material.dart';
import 'package:moving_arts/pages/moving_blob_field/blob_field.dart';

class BlobPainter extends CustomPainter {

  final BlobField blobField;

  BlobPainter(this.blobField);

  @override
  void paint(Canvas canvas, Size size) {
    // final center = Offset(size.width / 2, size.height / 2);

    // moving particles
    blobField.update();

    // painting particles on canvas
    for (var blob in blobField.blobs) {
      final paint = Paint()
        ..color = blob.color
        ..blendMode = BlendMode.overlay;
      canvas.drawCircle(blob.position, blob.radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // since we are always going to repaint
  }
}
