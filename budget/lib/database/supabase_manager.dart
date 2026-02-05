import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/foundation.dart';

/// Manages the Supabase client singleton.
///
/// Credentials are loaded from environment variables at build time.
/// Build with:
/// ```bash
/// flutter build web --dart-define=SUPABASE_URL=your_url --dart-define=SUPABASE_ANON_KEY=your_key
/// ```
class SupabaseManager {
  static final SupabaseManager _instance = SupabaseManager._internal();

  factory SupabaseManager() {
    return _instance;
  }

  SupabaseManager._internal();

  // Loaded from --dart-define at build time for security
  static const String _supabaseUrl = String.fromEnvironment(
    'SUPABASE_URL',
    defaultValue: '',
  );
  static const String _supabaseAnonKey = String.fromEnvironment(
    'SUPABASE_ANON_KEY',
    defaultValue: '',
  );

  late final SupabaseClient client;

  Future<void> initialize() async {
    if (_supabaseUrl.isEmpty || _supabaseAnonKey.isEmpty) {
      if (kDebugMode) {
        print('⚠️ Supabase credentials not configured.');
        print('Build with: flutter build web --dart-define=SUPABASE_URL=xxx --dart-define=SUPABASE_ANON_KEY=xxx');
      }
      // In production, you might want to throw an error or show a config screen
    }
    
    await Supabase.initialize(
      url: _supabaseUrl,
      anonKey: _supabaseAnonKey,
      debug: kDebugMode,
    );
    client = Supabase.instance.client;
  }
  
  /// Returns true if Supabase is properly configured
  bool get isConfigured => _supabaseUrl.isNotEmpty && _supabaseAnonKey.isNotEmpty;
}

