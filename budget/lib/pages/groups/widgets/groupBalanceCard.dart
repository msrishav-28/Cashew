import 'package:budget/database/tables.dart';
import 'package:budget/functions.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class GroupBalanceCard extends StatelessWidget {
  const GroupBalanceCard({super.key, required this.balance});

  final GroupBalanceEntry balance;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
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
                  "groups-balance-from-to".tr(
                    args: [balance.fromUserEmail, balance.toUserEmail],
                  ),
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  DateFormat.yMMMd(context.locale.languageCode)
                      .format(balance.lastUpdated),
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSecondaryContainer.withOpacity(0.7),
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
  }
}
