import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  static const white = Color(0xFFFDFEFE);
  static const black = Color(0xFF363636);
  static const disable = Color(0xFF757575);
  static const grey = Color(0xFFBDBDBD);
  static const red = Color(0xFFED0F20);
  static const green = Color(0xFFB3ED34);
  static const yellow = Color(0xFFF8D53A);
  static const secundary = Color(0xFF55AA55);
  static const primary = Color(0xFF283542);

  static const List<Color> categorias = [
    Color(0xFF3D7F80),
    Color(0xFFF9A15F),
    Color(0xFF6B4B91),
    Color(0xFFFFCD61),
    Color(0xFF52AB51),
    Color(0xFFD36766),
  ];

  static RadialGradient gradientSplash = const RadialGradient(
    colors: [Color(0x14319454), Color(0xffffffff)],
    center: Alignment.center,
    radius: 0.25,
  );
}
