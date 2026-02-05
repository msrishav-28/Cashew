// DEPRECATED: Legacy Shared Budget Functions
// These functions were part of the original Firebase-based sharing system.
// The app now uses Supabase Groups for collaborative expense tracking.
//
// This file is kept for backward compatibility but all functions are no-ops.
// See: lib/database/supabase_groups.dart for the current implementation.

import 'dart:async';
import 'package:budget/database/tables.dart';
import 'package:budget/widgets/globalSnackbar.dart';
import 'package:budget/widgets/openSnackbar.dart';

/// @deprecated Use Groups feature instead.
/// Shows a deprecation notice and returns false.
Future<bool> shareBudget(Budget? budgetToShare, context) async {
  openSnackbar(SnackbarMessage(
    title: "Feature Deprecated",
    description: "Budget sharing has been replaced by Groups. Please use the Groups feature instead.",
  ));
  return false;
}

/// @deprecated Legacy function - no-op.
Future<bool> removedSharedFromBudget(Budget sharedBudget,
    {bool removeFromServer = true}) async {
  return false;
}

/// @deprecated Legacy function - no-op.
Future<bool> leaveSharedBudget(Budget sharedBudget) async {
  return false;
}

/// @deprecated Legacy function - no-op.
Future<bool> addMemberToBudget(
    String sharedKey, String member, Budget budget) async {
  return false;
}

/// @deprecated Legacy function - no-op.
Future<bool> removeMemberFromBudget(
    String sharedKey, String member, Budget budget) async {
  return false;
}

/// @deprecated Legacy function - returns empty list.
Future<List<dynamic>> getMembersFromBudget(String sharedKey, Budget budget) async {
  return [];
}

/// @deprecated Legacy function - no-op.
Future<bool> compareSharedToCurrentBudgets(
    List<dynamic> budgetSnapshot) async {
  return false;
}

/// @deprecated Legacy function - no-op.
Future<bool> getCloudBudgets() async {
  return false;
}

/// @deprecated Legacy function - no-op.
Future<bool> sendTransactionSet(Transaction transaction, Budget budget) async {
  return false;
}

/// @deprecated Legacy function - no-op.
Future<bool> sendTransactionAdd(Transaction transaction, Budget budget) async {
  return false;
}

/// @deprecated Legacy function - no-op.
Future<bool> sendTransactionDelete(Transaction transaction, Budget budget) async {
  return false;
}

/// @deprecated Legacy function - no-op.
Future<bool> syncPendingQueueOnServer() async {
  return false;
}

/// @deprecated Legacy function - no-op.
Future<bool> updateTransactionOnServerAfterChangingCategoryInformation(
    TransactionCategory category) async {
  return false;
}
