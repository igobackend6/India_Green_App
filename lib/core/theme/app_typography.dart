import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// App-wide typography using Poppins via Google Fonts.
abstract final class AppTypography {
  static TextTheme get textTheme => TextTheme(
        displayLarge: _style(32, FontWeight.bold, height: 1.2),
        displayMedium: _style(28, FontWeight.bold, height: 1.25),
        displaySmall: _style(24, FontWeight.w600, height: 1.3),
        headlineLarge: _style(22, FontWeight.bold, height: 1.3),
        headlineMedium: _style(20, FontWeight.w600, height: 1.35),
        headlineSmall: _style(18, FontWeight.w600, height: 1.35),
        titleLarge: _style(16, FontWeight.w600, height: 1.4),
        titleMedium: _style(14, FontWeight.w600, height: 1.4),
        titleSmall: _style(13, FontWeight.w500, height: 1.4),
        bodyLarge: _style(16, FontWeight.normal, height: 1.5),
        bodyMedium: _style(14, FontWeight.normal, height: 1.5),
        bodySmall: _style(12, FontWeight.normal, height: 1.5),
        labelLarge: _style(14, FontWeight.w600, height: 1.4, spacing: 0.5),
        labelMedium: _style(12, FontWeight.w500, height: 1.3, spacing: 0.4),
        labelSmall: _style(10, FontWeight.w500, height: 1.3, spacing: 0.4),
      );

  static TextStyle _style(
    double size,
    FontWeight weight, {
    double height = 1.5,
    double spacing = 0.0,
  }) {
    return GoogleFonts.poppins(
      fontSize: size,
      fontWeight: weight,
      height: height,
      letterSpacing: spacing,
    );
  }
}
