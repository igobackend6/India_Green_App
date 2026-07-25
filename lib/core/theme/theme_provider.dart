import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../storage/hive_service.dart';

/// Manages the current app theme mode and persists the selection to Hive.
class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  final HiveService _hive;

  ThemeModeNotifier(this._hive)
      : super(_hive.isDarkMode ? ThemeMode.dark : ThemeMode.light);

  void toggleTheme(bool isDark) {
    state = isDark ? ThemeMode.dark : ThemeMode.light;
    _hive.setDarkMode(isDark);
  }
}

final themeModeProvider =
    StateNotifierProvider<ThemeModeNotifier, ThemeMode>((ref) {
  final hive = ref.read(hiveServiceProvider);
  return ThemeModeNotifier(hive);
});
