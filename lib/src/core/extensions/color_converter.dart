import 'package:flutter/material.dart';

extension ColorConverter on Color {
  int convertToInt() {
    return value;
  }
}

extension IntToColor on int {
  Color toColor() {
    return Color(this);
  }
}
