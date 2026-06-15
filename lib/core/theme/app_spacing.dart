import 'package:flutter/material.dart';

/// Consistent spacing scale used throughout the app.
abstract final class AppSpacing {
  static const double xs   = 4;
  static const double sm   = 8;
  static const double md   = 12;
  static const double base = 16;
  static const double lg   = 20;
  static const double xl   = 24;
  static const double xxl  = 32;
  static const double xxxl = 48;

  static const screenPadding = EdgeInsets.symmetric(
    horizontal: base,
    vertical: md,
  );

  static const cardPadding = EdgeInsets.all(base);
}

/// Consistent border-radius scale.
abstract final class AppRadius {
  static const double xs   = 4;
  static const double sm   = 8;
  static const double md   = 12;
  static const double lg   = 16;
  static const double xl   = 20;
  static const double xxl  = 24;
  static const double pill  = 100;

  static final cardRadius   = BorderRadius.circular(lg);
  static final chipRadius   = BorderRadius.circular(xl);
  static final sheetRadius  = const BorderRadius.vertical(top: Radius.circular(24));
  static final buttonRadius = BorderRadius.circular(md);
}
