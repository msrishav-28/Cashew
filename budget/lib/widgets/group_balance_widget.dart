import 'package:budget/database/tables.dart';
import 'package:budget/functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/// Card-style widget that highlights what one member owes another inside a
/// group.
class GroupBalanceWidget extends StatelessWidget {
  const GroupBalanceWidget({
    super.key,
    required this.balance,
    this.onTap,
  });

  final GroupBalanceEntry balance;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final card = Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(18),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Icon(
            Icons.compare_arrows_rounded,
            color: theme.colorScheme.onSecondaryContainer,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'groups-balance-from-to'.tr(
                    args: [balance.fromUserEmail, balance.toUserEmail],
                  ),
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  DateFormat.yMMMd(context.locale.languageCode)
                      .format(balance.lastUpdated),
                  style: theme.textTheme.bodySmall?.copyWith(
                    color:
                        theme.colorScheme.onSecondaryContainer.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Text(
            formatCurrencyWithName(
              balance.amount,
              balance.currency,
              alwaysShowSymbol: true,
            ),
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );

    if (onTap == null) {
      return card;
    }
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: card,
    );
  }
}
