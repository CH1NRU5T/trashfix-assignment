import 'dart:math';

import 'package:flutter/material.dart';

extension WhiteSpace on num {
  SizedBox get width => SizedBox(width: toDouble());
  SizedBox get height => SizedBox(height: toDouble());
}

extension RandomElement on List {
  dynamic getRandomElement() => this[Random().nextInt(length)];
}
