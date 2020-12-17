import 'package:flutter/material.dart';

class MyAttributes {
  static const Radius radius = Radius.circular(16.0);
  static const BorderRadius borderRadius = BorderRadius.all(radius);
  static const BorderRadius borderRadiusTop =
      BorderRadius.vertical(top: radius);
  static const EdgeInsets buttonPadding = EdgeInsets.all(12.0);
  static const double imageAspectRatio = 3 / 4;
}
