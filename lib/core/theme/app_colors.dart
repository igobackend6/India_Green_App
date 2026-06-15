import 'dart:ui';

/// IGO brand color palette — centralized tokens used across the entire app.
abstract final class AppColors {
  // ── Brand Primary ───────────────────
  static const forestGreen  = Color(0xFF0A3D1F);
  static const growthGreen  = Color(0xFF2EB85C);
  static const harvestGold  = Color(0xFFE8A020);
  static const accentGold   = Color(0xFFF0B33A);

  // ── Backgrounds ─────────────────────
  static const darkEarth    = Color(0xFF0D1A10);
  static const deepForest   = Color(0xFF142217);
  static const creamWhite   = Color(0xFFFEF7FF);
  static const lightGreenBg = Color(0xFFEDF5F1);
  static const softGray     = Color(0xFFF3F5F4);

  // ── Text ────────────────────────────
  static const textPrimary   = Color(0xFF1D1B20);
  static const textSecondary = Color(0xFF4A5568);
  static const textMuted     = Color(0xFF8C9D94);

  // ── Semantic ────────────────────────
  static const success   = Color(0xFF10B981);
  static const warning   = Color(0xFFF59E0B);
  static const error     = Color(0xFFEF4444);
  static const info      = Color(0xFF3B82F6);

  // ── Notification Backgrounds ────────
  static const successBg = Color(0xFFEFFFF5);
  static const Color backgroundLight = Color(0xFFF8F9FA); // Off-white
  static const Color backgroundDark  = Color(0xFF121212); // Deep dark
  static const Color surfaceLight    = Color(0xFFFFFFFF);
  static const warningBg = Color(0xFFFFFBEB);
  static const errorBg   = Color(0xFFFEF2F2);
  static const infoBg    = Color(0xFFF3F4F6);
}
