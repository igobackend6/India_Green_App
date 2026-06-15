import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_typography.dart';
import 'app_spacing.dart';

/// Material 3 theme factory for light and dark modes.
abstract final class AppTheme {
  // ── Light Theme ─────────────────────
  static ThemeData get light => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: const ColorScheme.light(
          primary: AppColors.forestGreen,
          onPrimary: Colors.white,
          secondary: AppColors.harvestGold,
          onSecondary: Colors.black,
          tertiary: AppColors.growthGreen,
          surface: Colors.white,
          onSurface: AppColors.textPrimary,
          error: AppColors.error,
          onError: Colors.white,
        ),
        scaffoldBackgroundColor: AppColors.creamWhite,
        textTheme: AppTypography.textTheme,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.forestGreen,
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: false,
        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: AppColors.forestGreen,
          indicatorColor: AppColors.harvestGold,
          height: 72,
          labelTextStyle: WidgetStateProperty.resolveWith((states) {
            final isSelected = states.contains(WidgetState.selected);
            return TextStyle(
              fontSize: 10,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? AppColors.harvestGold : Colors.white60,
            );
          }),
          iconTheme: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return const IconThemeData(color: AppColors.forestGreen, size: 24);
            }
            return const IconThemeData(color: Colors.white60, size: 24);
          }),
        ),
        cardTheme: CardThemeData(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: AppRadius.cardRadius),
          color: Colors.white,
          surfaceTintColor: Colors.transparent,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.forestGreen,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: AppRadius.buttonRadius),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            textStyle: AppTypography.textTheme.labelLarge,
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.forestGreen,
            side: const BorderSide(color: AppColors.forestGreen),
            shape: RoundedRectangleBorder(borderRadius: AppRadius.buttonRadius),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColors.forestGreen,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.softGray,
          border: OutlineInputBorder(
            borderRadius: AppRadius.buttonRadius,
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: AppRadius.buttonRadius,
            borderSide: const BorderSide(color: AppColors.forestGreen, width: 2),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
        chipTheme: const ChipThemeData(
          backgroundColor: AppColors.softGray,
          selectedColor: AppColors.harvestGold,
          shape: StadiumBorder(),
        ),
        dividerTheme: const DividerThemeData(
          color: AppColors.softGray,
          thickness: 1,
        ),
        snackBarTheme: SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: AppRadius.cardRadius),
        ),
        bottomSheetTheme: BottomSheetThemeData(
          shape: RoundedRectangleBorder(borderRadius: AppRadius.sheetRadius),
          showDragHandle: true,
        ),
      );

  // ── Dark Theme ──────────────────────
  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.growthGreen,
          onPrimary: Colors.black,
          secondary: AppColors.harvestGold,
          onSecondary: Colors.black,
          tertiary: AppColors.accentGold,
          surface: AppColors.deepForest,
          onSurface: AppColors.creamWhite,
          error: AppColors.error,
          onError: Colors.black,
        ),
        scaffoldBackgroundColor: AppColors.darkEarth,
        textTheme: AppTypography.textTheme.apply(
          bodyColor: AppColors.creamWhite,
          displayColor: AppColors.creamWhite,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.deepForest,
          foregroundColor: AppColors.creamWhite,
          elevation: 0,
        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: AppColors.deepForest,
          indicatorColor: AppColors.harvestGold,
          height: 72,
          labelTextStyle: WidgetStateProperty.resolveWith((states) {
            final isSelected = states.contains(WidgetState.selected);
            return TextStyle(
              fontSize: 10,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? AppColors.harvestGold : Colors.white38,
            );
          }),
          iconTheme: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return const IconThemeData(color: AppColors.deepForest, size: 24);
            }
            return const IconThemeData(color: Colors.white38, size: 24);
          }),
        ),
        cardTheme: CardThemeData(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: AppRadius.cardRadius),
          color: AppColors.deepForest,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.growthGreen,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(borderRadius: AppRadius.buttonRadius),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          ),
        ),
      );
}
