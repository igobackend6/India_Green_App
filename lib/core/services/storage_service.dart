import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class StorageService {
  Future<void> init();
  Future<void> write(String key, String value);
  Future<String?> read(String key);
  Future<void> delete(String key);
  Future<void> clearAll();
}

// Re-using HiveService or mapping to a general StorageService can be done here.
final storageServiceProvider = Provider<StorageService>((ref) {
  throw UnimplementedError('Initialize StorageService via ProviderScope override');
});
