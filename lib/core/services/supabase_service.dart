import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SupabaseService {
  SupabaseClient get client;
}

class SupabaseServiceImpl implements SupabaseService {
  @override
  SupabaseClient get client => Supabase.instance.client;
}

final supabaseServiceProvider = Provider<SupabaseService>((ref) {
  return SupabaseServiceImpl();
});
