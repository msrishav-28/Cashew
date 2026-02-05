import 'package:budget/database/tables.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class GroupActivityTile extends StatelessWidget {
  const GroupActivityTile({super.key, required this.activity});

  final GroupActivityEntry activity;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final description = activity.description?.trim().isNotEmpty == true
      ? activity.description!
      : 'groups-activity-generic'.tr();
    final timestamp = activity.dateCreated;
    final performer = activity.performedBy?.trim();
    final meta = _formatMeta(context, timestamp, performer);

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(18),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: colorScheme.primary.withOpacity(0.15),
            child: Icon(
              _activityIcon(activity.activityType),
              color: colorScheme.primary,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  meta,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSecondaryContainer.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatMeta(
    BuildContext context,
    DateTime timestamp,
    String? performer,
  ) {
    final date = DateFormat.yMMMd(context.locale.languageCode)
        .add_Hm()
        .format(timestamp);
    if (performer != null && performer.isNotEmpty) {
      return '$performer • $date';
    }
    return date;
  }

  IconData _activityIcon(String type) {
    switch (type) {
      case 'expense-created':
        return Icons.add_shopping_cart_rounded;
      case 'expense-updated':
        return Icons.receipt_long_rounded;
      case 'settlement-recorded':
        return Icons.handshake_rounded;
      case 'balance-updated':
        return Icons.swap_horiz_rounded;
      default:
        return Icons.timeline_rounded;
    }
  }
}
