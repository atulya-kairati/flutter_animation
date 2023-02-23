import 'package:flutter/material.dart';

extension DelayedCall on VoidCallback {
  void delayed(Duration duration) {
    Future.delayed(duration, this);
  }
}
