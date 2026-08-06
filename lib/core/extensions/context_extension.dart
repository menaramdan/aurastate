import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  bool get isPortrait =>
      MediaQuery.of(this).orientation == Orientation.portrait;

  bool get isLandscape =>
      MediaQuery.of(this).orientation == Orientation.landscape;
}
