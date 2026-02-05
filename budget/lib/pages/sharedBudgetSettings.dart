// DEPRECATED: Legacy Shared Budget Settings Page
// This page was part of the original Firebase-based sharing system.
// The app now uses Supabase Groups for collaborative expense tracking.
//
// This file is kept as a stub to prevent import errors.
// The actual Groups member management is now in:
// - lib/pages/groups/groupDetailsPage.dart
// - lib/database/supabase_groups.dart

import 'package:budget/database/tables.dart';
import 'package:budget/widgets/textWidgets.dart';
import 'package:flutter/material.dart';

/// @deprecated Use Groups feature instead.
/// This page now shows a deprecation notice redirecting users to Groups.
class SharedBudgetSettings extends StatelessWidget {
  const SharedBudgetSettings({
    Key? key,
    required this.budget,
  }) : super(key: key);

  final Budget budget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.groups_outlined,
            size: 48,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 16),
          TextFont(
            text: "Shared Budgets Deprecated",
            fontSize: 18,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          TextFont(
            text: "This feature has been replaced by Groups. Please use the Groups feature for collaborative expense tracking.",
            fontSize: 14,
            textAlign: TextAlign.center,
            maxLines: 5,
          ),
        ],
      ),
    );
  }
}

// Legacy widget stubs for backward compatibility
class CategoryMemberContainer extends StatelessWidget {
  const CategoryMemberContainer({
    Key? key,
    required this.member,
    required this.setMember,
    required this.onDelete,
    required this.isOwner,
    required this.isYou,
    required this.canModify,
  }) : super(key: key);

  final String member;
  final Function(String) setMember;
  final VoidCallback onDelete;
  final bool isOwner;
  final bool isYou;
  final bool canModify;

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}

/// @deprecated Legacy function stub
void memberPopup(BuildContext context, String member) {
  // No-op
}
