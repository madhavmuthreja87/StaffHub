import 'package:flutter/material.dart';

class AppColor {
  static const Color primary = Color(0xFFFF6B35);
  static const Color primaryDark = Color(0xFFD64A17);
  static const Color orange = Colors.orange;
  static const Color greyish = const Color.fromARGB(255, 190, 189, 189);
  static const Color accentLight = Color(0xFFFFF0EA);
  static const Color alertWarning = Color(0xFFFFB800);

  // Neutral Canvas Colors
  static const Color background = Color.fromARGB(
    255,
    246,
    241,
    236,
  ); // Off-white/cream background (easier on the eyes than pure white)
  static const Color surface =
      Colors.white; // Cards, input fields, dropdown elements

  // Text Styling Colors
  static const Color textDark = Color(
    0xFF1E1B18,
  ); // Deep charcoal for high-contrast titles
  static const Color textMuted = Color(0xFF78726C);
}
