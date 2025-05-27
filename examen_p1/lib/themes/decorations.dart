// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class AppDecorations {
  static BoxDecoration cardDecoration(Color color, {bool isDark = false}) => BoxDecoration(
        color: color.withOpacity(isDark ? 0.08 : 0.13),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(isDark ? 0.18 : 0.32),
            blurRadius: isDark ? 8 : 18,
            spreadRadius: isDark ? 0 : 2,
            offset: const Offset(0, 6),
          ),
        ],
      );
}