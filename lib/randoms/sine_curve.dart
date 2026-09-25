import 'dart:math';

import 'package:flutter/material.dart';

class SineCurve extends Curve {
  final double count;

  const SineCurve({this.count = 1});

  @override
  double transformInternal(double t) {
    return sin(t * 2 * pi * count) * 0.5 + 0.5;
  }
}
