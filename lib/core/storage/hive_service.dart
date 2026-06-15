import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// Hive box name constants.
abstract final class HiveKeys {
  static const sessionBox    = 'user_session';
  static const settingsBox   = 'app_settings';
  static const cartBox       = 'cart_items';
  static const notifBox      = 'notifications';
  static const cacheBox      = 'data_cache';

  // Settings keys
  static const keyLanguage   = 'language';
  static const keyOnboarded  = 'onboarded';
  static const keyThemeMode  = 'theme_mode';

  // Session keys
  static const keyUserName   = 'user_name';
  static const keyPhone      = 'user_phone';
  static const keyPincode    = 'user_pincode';
  static const keyRoles      = 'user_roles';
  static const keyIsAuth     = 'is_authenticated';
}

/// Centralized Hive service managing all local storage boxes.
class HiveService {
  late Box _sessionBox;
  late Box _settingsBox;
  late Box _cartBox;
  late Box _notifBox;
  late Box<String> _cacheBox;

  /// Initialize Hive and open all boxes.
  Future<void> init() async {
    await Hive.initFlutter();

    // Get or generate encryption key for session box
    final encKey = await _getEncryptionKey();

    _sessionBox = await Hive.openBox(
      HiveKeys.sessionBox,
      encryptionCipher: HiveAesCipher(encKey),
    );
    _settingsBox = await Hive.openBox(HiveKeys.settingsBox);
    _cartBox     = await Hive.openBox(HiveKeys.cartBox);
    _notifBox    = await Hive.openBox(HiveKeys.notifBox);
    _cacheBox    = await Hive.openBox<String>(HiveKeys.cacheBox);
  }

  Future<List<int>> _getEncryptionKey() async {
    const secureStorage = FlutterSecureStorage();
    final stored = await secureStorage.read(key: 'hive_enc_key');
    if (stored != null) {
      return base64Url.decode(stored);
    }
    final key = Hive.generateSecureKey();
    await secureStorage.write(
        key: 'hive_enc_key', value: base64UrlEncode(key));
    return key;
  }

  // ── Session ─────────────────────────
  bool get isAuthenticated =>
      _sessionBox.get(HiveKeys.keyIsAuth, defaultValue: false) as bool;

  String? get userName => _sessionBox.get(HiveKeys.keyUserName) as String?;
  String? get phone => _sessionBox.get(HiveKeys.keyPhone) as String?;
  String? get pincode => _sessionBox.get(HiveKeys.keyPincode) as String?;
  List<String> get roles {
    final raw = _sessionBox.get(HiveKeys.keyRoles);
    if (raw is List) return raw.cast<String>();
    return [];
  }

  Future<void> saveSession({
    required String name,
    required String phone,
    required String pincode,
    required List<String> roles,
  }) async {
    await _sessionBox.put(HiveKeys.keyIsAuth, true);
    await _sessionBox.put(HiveKeys.keyUserName, name);
    await _sessionBox.put(HiveKeys.keyPhone, phone);
    await _sessionBox.put(HiveKeys.keyPincode, pincode);
    await _sessionBox.put(HiveKeys.keyRoles, roles);
  }

  Future<void> clearSession() async {
    await _sessionBox.clear();
  }

  // ── Settings ────────────────────────
  String? get selectedLanguage =>
      _settingsBox.get(HiveKeys.keyLanguage) as String?;

  Future<void> setSelectedLanguage(String lang) async {
    await _settingsBox.put(HiveKeys.keyLanguage, lang);
  }

  bool get isOnboardingDone =>
      _settingsBox.get(HiveKeys.keyOnboarded, defaultValue: false) as bool;

  Future<void> setOnboardingDone() async {
    await _settingsBox.put(HiveKeys.keyOnboarded, true);
  }

  // ── Cache ───────────────────────────
  String? getCached(String key) => _cacheBox.get(key);

  Future<void> setCache(String key, String json) async {
    await _cacheBox.put(key, json);
  }

  Future<void> clearCache() async {
    await _cacheBox.clear();
  }

  // ── Cart ────────────────────────────
  Box get cartBox => _cartBox;

  // ── Notifications ───────────────────
  Box get notifBox => _notifBox;
}

/// Global provider for the Hive service (overridden in bootstrap).
final hiveServiceProvider = Provider<HiveService>((ref) {
  throw UnimplementedError('HiveService must be overridden in ProviderScope');
});
