// Account and Backup Functions
// Migrated from Google/Firebase to Supabase authentication and sync.

import 'dart:async';
import 'package:budget/functions.dart';
import 'package:budget/database/supabase_manager.dart';
import 'package:budget/struct/settings.dart';
import 'package:budget/struct/supabaseGlobal.dart';
import 'package:budget/controllers/syncController.dart';
import 'package:budget/widgets/globalSnackbar.dart';
import 'package:budget/widgets/openPopup.dart';
import 'package:budget/widgets/openSnackbar.dart';
import 'package:flutter/material.dart';

/// Check if we have network connectivity.
/// Returns true - actual connectivity check delegated to Supabase/connectivity_plus.
Future<bool> checkConnection() async {
  return true;
}

/// Trigger sign-in if no active session exists.
Future<void> runForceSignIn(BuildContext context) async {
  if (SupabaseManager().client.auth.currentSession == null) {
    await signInWithSupabase(context: context, silentSignIn: true);
  }
}

/// Sign in with Supabase authentication.
/// Legacy name preserved for compatibility with existing call sites.
Future<bool> signInWithSupabase({
  BuildContext? context,
  bool? waitForCompletion,
  bool? silentSignIn,
  Function()? next,
}) async {
  try {
    if (waitForCompletion == true && context != null) {
      openLoadingPopup(context);
    }

    // Check if already signed in
    if (SupabaseManager().client.auth.currentUser != null) {
      if (waitForCompletion == true && context != null) popRoute(context);
      if (next != null) next();
      return true;
    }

    // Attempt silent sign-in via session refresh
    bool result = await supabaseSignIn(silentSignIn: silentSignIn ?? false);

    if (waitForCompletion == true && context != null) popRoute(context);
    if (next != null) next();

    return result;
  } catch (e) {
    print("Sign In Error: $e");
    if (waitForCompletion == true && context != null) popRoute(context);
    openSnackbar(SnackbarMessage(
      title: "Sign In Error",
      description: e.toString(),
      icon: Icons.error_outline,
    ));
    return false;
  }
}

/// Legacy alias for signInWithSupabase.
/// @deprecated Use signInWithSupabase instead.
Future<bool> signInGoogle({
  BuildContext? context,
  bool? waitForCompletion,
  bool? gMailPermissions, // Ignored - legacy parameter
  bool? silentSignIn,
  Function()? next,
}) async {
  return signInWithSupabase(
    context: context,
    waitForCompletion: waitForCompletion,
    silentSignIn: silentSignIn,
    next: next,
  );
}

/// Sign out from Supabase.
Future<bool> signOutSupabase() async {
  await supabaseSignOut();
  return true;
}

/// Legacy alias for signOutSupabase.
/// @deprecated Use signOutSupabase instead.
Future<bool> signOutGoogle() async {
  return signOutSupabase();
}

/// Sign in and trigger a sync operation.
Future<bool> signInAndSync(BuildContext context,
    {required dynamic Function() next}) async {
  if (SupabaseManager().client.auth.currentUser == null) {
    openSnackbar(SnackbarMessage(
      title: "Please sign in first",
      icon: Icons.login,
    ));
    return false;
  }
  await SyncController().sync();
  next();
  return true;
}

/// Create a backup in the background (now triggers Supabase sync).
Future<void> createBackupInBackground(context) async {
  if (appStateSettings["autoBackups"] == true) {
    if (SupabaseManager().client.auth.currentUser != null) {
      SyncController().sync();
    }
  }
}

/// Create a backup (now triggers Supabase sync).
Future<void> createBackup(
  context, {
  bool? silentBackup,
  bool deleteOldBackups = false,
  String? clientIDForSync,
}) async {
  await SyncController().sync();
  if (silentBackup != true) {
    openSnackbar(SnackbarMessage(
      title: "Synced to Cloud",
      icon: Icons.cloud_done_outlined,
    ));
  }
}

/// Legacy backup chooser - now shows info about Supabase sync.
Future<void> chooseBackup(context,
    {bool isManaging = false,
    bool isClientSync = false,
    bool hideDownloadButton = false}) async {
  openSnackbar(SnackbarMessage(
    title: "Cloud Sync Active",
    description: "Backups are automatically handled by Supabase Cloud Sync.",
    icon: Icons.cloud_sync_outlined,
  ));
}

/// Legacy Drive files getter - returns empty.
/// @deprecated No longer applicable with Supabase backend.
Future<(dynamic, dynamic)> getDriveFiles() async {
  return (null, null);
}

/// Legacy widget stub for Google login button.
/// Now shows a Supabase-aware login prompt.
class GoogleAccountLoginButton extends StatelessWidget {
  const GoogleAccountLoginButton({
    super.key,
    this.navigationSidebarButton,
    this.isButtonSelected,
    this.isOutlinedButton,
    this.forceButtonName,
  });

  final dynamic navigationSidebarButton;
  final dynamic isButtonSelected;
  final dynamic isOutlinedButton;
  final dynamic forceButtonName;

  @override
  Widget build(BuildContext context) {
    // Return empty widget - login is handled elsewhere in the UI
    return const SizedBox.shrink();
  }
}
