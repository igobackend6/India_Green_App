import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../storage/hive_service.dart';

/// Manages the current app locale and persists the selection to Hive.
class LocaleNotifier extends StateNotifier<Locale> {
  final HiveService _hive;

  LocaleNotifier(this._hive)
      : super(_mapLanguageToLocale(_hive.selectedLanguage ?? 'English'));

  void setLanguage(String languageName) {
    state = _mapLanguageToLocale(languageName);
    _hive.setSelectedLanguage(languageName);
  }

  static Locale _mapLanguageToLocale(String name) => switch (name) {
        'Tamil'     => const Locale('ta'),
        'Hindi'     => const Locale('hi'),
        'Telugu'    => const Locale('te'),
        'Kannada'   => const Locale('kn'),
        'Malayalam' => const Locale('ml'),
        'Marathi'   => const Locale('mr'),
        'Bengali'   => const Locale('bn'),
        'Gujarati'  => const Locale('gu'),
        'Punjabi'   => const Locale('pa'),
        'Odia'      => const Locale('or'),
        'Assamese'  => const Locale('as'),
        _           => const Locale('en'),
      };
}

final localeProvider =
    StateNotifierProvider<LocaleNotifier, Locale>((ref) {
  final hive = ref.read(hiveServiceProvider);
  return LocaleNotifier(hive);
});
