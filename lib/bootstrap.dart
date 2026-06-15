import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/config/env.dart';

import 'core/storage/hive_service.dart';
import 'app.dart';

/// Bootstrap the application environment and core services.
Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1. Load environment
  try {
    await dotenv.load(fileName: '.env');
  } catch (e) {
    debugPrint('No .env file found. Falling back to default configs.');
  }

  // Initialize Supabase
  if (Env.supabaseUrl.isNotEmpty && Env.supabaseAnonKey.isNotEmpty) {
    await Supabase.initialize(
      url: Env.supabaseUrl,
      publishableKey: Env.supabaseAnonKey,
    );
  } else {
    debugPrint('Supabase credentials missing. Supabase will not be initialized.');
  }

  // 2. Initialize Hive Storage
  final hiveService = HiveService();
  await hiveService.init();

  // 3. Run app with ProviderScope overriding synchronous services
  runApp(
    ProviderScope(
      overrides: [
        hiveServiceProvider.overrideWithValue(hiveService),
      ],
      child: const IgoApp(),
    ),
  );
}
