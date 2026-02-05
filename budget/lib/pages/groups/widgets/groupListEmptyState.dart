import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class GroupListEmptyState extends StatelessWidget {
  const GroupListEmptyState({
    super.key,
    required this.onAddGroup,
  });

  final VoidCallback onAddGroup;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.groups_outlined,
            size: 88,
            color: theme.colorScheme.onSurfaceVariant.withOpacity(0.5),
          ),
          const SizedBox(height: 16),
          Text(
            'groups-empty-title'.tr(),
            style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'groups-empty-description'.tr(),
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant.withOpacity(0.75),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          FilledButton.icon(
            onPressed: onAddGroup,
            icon: const Icon(Icons.add_rounded),
            label: Text('add-group'.tr()),
          ),
        ],
      ),
    );
  }
}
