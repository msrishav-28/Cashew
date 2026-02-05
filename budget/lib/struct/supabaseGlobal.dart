import 'package:budget/database/supabase_manager.dart';
import 'package:budget/struct/settings.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<bool> supabaseSignIn({bool silentSignIn = false}) async {
  try {
    // For now, only supporting Google Auth via Supabase or simple email/magic link
    // This is a placeholder. Actual implementation depends on enabled providers in Supabase.
    // We will assume Google Auth for now as it was the previous default.
    
    // Note: Google Sign-Ir on Android/iOS via Supabase requires specific native setup.
    // For Web, it redirects.
    
    // If silentSignIn is true, we just check current session
    final session = SupabaseManager().client.auth.currentSession;
    if (session != null) {
      if (session.isExpired) {
         await SupabaseManager().client.auth.refreshSession();
      }
      return true;
    }

    if (!silentSignIn) {
      // Trigger OAuth flow
      // await SupabaseManager().client.auth.signInWithOAuth(Provider.google);
      print("Supabase Sign In Requested (UI implementation needed)");
      return false; 
    }
    
    return false;
  } catch (e) {
    print("Error signing in with Supabase: $e");
    return false;
  }
}

Future<void> supabaseSignOut() async {
  await SupabaseManager().client.auth.signOut();
  updateSettings(
    "currentUserEmail",
    "",
    pagesNeedingRefresh: [],
    updateGlobalState: true,
  );
}

User? get currentUser => SupabaseManager().client.auth.currentUser;
String? get currentUserEmail => currentUser?.email;
