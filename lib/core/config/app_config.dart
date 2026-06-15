import 'env.dart';
import 'flavors.dart';

class AppConfig {
  static String get geminiApiKey => Env.geminiApiKey;
  static String get supabaseUrl => Env.supabaseUrl;
  static String get supabaseAnonKey => Env.supabaseAnonKey;
  
  static String get baseUrl => F.baseUrl;
  static const String geminiModel = 'gemini-3.5-flash';
  static const bool enableCache = true;
}
