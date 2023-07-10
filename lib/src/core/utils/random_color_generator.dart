import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:notes_app/src/core/core.dart';

Color generateRandomColor() {
  final random = Random();
  return AppTheme.cardColors[random.nextInt(AppTheme.cardColors.length)];
}
