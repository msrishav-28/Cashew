import 'package:budget/colors.dart';
import 'package:budget/struct/design_system.dart';
import 'package:budget/database/tables.dart';
import 'package:budget/struct/currencyFunctions.dart';
import 'package:budget/struct/databaseGlobal.dart';
import 'package:budget/struct/settings.dart';
import 'package:budget/widgets/tappable.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class GroupListCard extends StatelessWidget {
  const GroupListCard({
    super.key,
    required this.group,
    required this.onTap,
  });

  final GroupEntry group;
  final VoidCallback onTap;

  Stream<double> _userBalanceStream(String groupPk) {
    final userEmail = appStateSettings["userEmail"];
    if (userEmail == null) return Stream.value(0.0);

    return (database.select(database.groupBalances)
          ..where((tbl) => tbl.groupFk.equals(groupPk)))
        .watch()
        .map((balances) {
      double net = 0;
      for (final balance in balances) {
        if (balance.toUserEmail == userEmail) {
          net += balance.amount;
        } else if (balance.fromUserEmail == userEmail) {
          net -= balance.amount;
        }
      }
      return net;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Tappable(
      borderRadius: 24,
      onTap: onTap,
      color: Colors.transparent, // Transparent to show glass
      child: Container(
        decoration: DesignSystem.effects.glassCard.copyWith(
          borderRadius: BorderRadius.circular(24),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: colorScheme.primary.withOpacity(0.12),
                  child: Text(
                    group.name.isEmpty
                        ? '?'
                        : group.name.characters.first.toUpperCase(),
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 18),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        group.name,
                        style: theme.textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      if ((group.description ?? '').isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Text(
                          group.description!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSecondaryContainer
                                .withOpacity(0.7),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                Icon(
                  appStateSettings['outlinedIcons']
                      ? Icons.chevron_right_outlined
                      : Icons.chevron_right_rounded,
                  color: colorScheme.onSecondaryContainer.withOpacity(0.4),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _GroupStatChip(
                  icon: Icons.people_alt_outlined,
                  stream: _groupMemberCountStream(group.groupPk),
                  labelBuilder: (count) => 'groups-members'.tr(
                    args: [count.toString()],
                  ),
                ),
                StreamBuilder<double>(
                  stream: _userBalanceStream(group.groupPk),
                  builder: (context, snapshot) {
                    final balance = snapshot.data ?? 0;
                    if (balance == 0) return const SizedBox.shrink();

                    final isPositive = balance > 0;
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: isPositive
                            ? getColor(context, "incomeAmount").withOpacity(0.1)
                            : getColor(context, "expenseAmount")
                                .withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isPositive
                              ? getColor(context, "incomeAmount")
                                  .withOpacity(0.3)
                              : getColor(context, "expenseAmount")
                                  .withOpacity(0.3),
                        ),
                      ),
                      child: Text(
                        isPositive
                            ? "owe-you".tr() +
                                " " +
                                convertToMoney(
                                    Provider.of<AllWallets>(context),
                                    balance.abs(),
                                    finalCurrency:
                                        Provider.of<AllWallets>(context)
                                            .indexedByPk[appStateSettings[
                                                "selectedWalletPk"]]
                                            ?.currency)
                            : "you-owe".tr() +
                                " " +
                                convertToMoney(
                                    Provider.of<AllWallets>(context),
                                    balance.abs(),
                                    finalCurrency:
                                        Provider.of<AllWallets>(context)
                                            .indexedByPk[appStateSettings[
                                                "selectedWalletPk"]]
                                            ?.currency),
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: isPositive
                              ? getColor(context, "incomeAmount")
                              : getColor(context, "expenseAmount"),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
          ],
        ),
      ),
    );
  }
}

class _GroupStatChip extends StatelessWidget {
  const _GroupStatChip({
    required this.icon,
    required this.stream,
    required this.labelBuilder,
  });

  final IconData icon;
  final Stream<int> stream;
  final String Function(int) labelBuilder;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.colorScheme.onSecondaryContainer.withOpacity(0.5);
    return StreamBuilder<int>(
      stream: stream,
      builder: (context, snapshot) {
        final label = labelBuilder(snapshot.data ?? 0);
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 14, color: color),
            const SizedBox(width: 4),
            Text(
              label,
              style: theme.textTheme.bodySmall?.copyWith(color: color),
            ),
          ],
        );
      },
    );
  }
}

Stream<int> _groupMemberCountStream(String groupPk) {
  return (database.select(database.groupMembers)
        ..where((tbl) => tbl.groupFk.equals(groupPk)))
      .watch()
      .map((members) => members.length);
}

Stream<int> _groupExpenseCountStream(String groupPk) {
  return (database.select(database.sharedExpenses)
        ..where((tbl) => tbl.groupFk.equals(groupPk)))
      .watch()
      .map((expenses) => expenses.length);
}

