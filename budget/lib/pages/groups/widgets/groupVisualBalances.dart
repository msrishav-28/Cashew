import 'package:budget/colors.dart';
import 'package:budget/database/tables.dart';
import 'package:budget/functions.dart';
import 'package:budget/struct/databaseGlobal.dart';
import 'package:budget/struct/settings.dart';
import 'package:budget/widgets/textWidgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GroupVisualBalances extends StatelessWidget {
  const GroupVisualBalances({
    super.key,
    required this.balances,
    required this.members,
  });

  final List<GroupBalanceEntry> balances;
  final List<GroupMemberEntry> members;

  @override
  Widget build(BuildContext context) {
    final userEmail = appStateSettings["userEmail"];
    if (userEmail == null || balances.isEmpty) return const SizedBox.shrink();

    // Calculate net balances for the current user vs others
    final Map<String, double> userNetBalances = {};
    for (var member in members) {
      if (member.userEmail == userEmail) continue;
      userNetBalances[member.userEmail] = 0;
    }

    for (var balance in balances) {
      if (balance.fromUserEmail == userEmail) {
        // I owe them (Negative)
        userNetBalances[balance.toUserEmail] =
            (userNetBalances[balance.toUserEmail] ?? 0) - balance.amount;
      } else if (balance.toUserEmail == userEmail) {
        // They owe me (Positive)
        userNetBalances[balance.fromUserEmail] =
            (userNetBalances[balance.fromUserEmail] ?? 0) + balance.amount;
      }
    }

    // Filter out zero balances for visualization to avoid clutter
    userNetBalances.removeWhere((key, value) => value.abs() < 0.01);

    if (userNetBalances.isEmpty) return const SizedBox.shrink();

    double maxVal = 0;
    userNetBalances.values.forEach((v) {
      if (v.abs() > maxVal) maxVal = v.abs();
    });

    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceVariant.withOpacity(0.5),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "your-balance-summary".tr(),
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          ...userNetBalances.entries.map((entry) {
            final email = entry.key;
            final amount = entry.value;
            final isPositive = amount > 0;
            final widthFactor = (amount.abs() / maxVal);

            // Find name
            final memberName = members
                .firstWhere(
                  (m) => m.userEmail == email,
                  orElse: () => GroupMemberEntry(
                      memberPk: "",
                      groupFk: "",
                      userEmail: email,
                      userName: email,
                      dateJoined: DateTime.now(),
                      isActive: true),
                )
                .userName;
            final displayName =
                memberName.isEmpty ? email.split('@').first : memberName;

            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: Text(
                      displayName,
                      style: theme.textTheme.bodySmall,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        // Background line
                        Container(
                          height: 8,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.outlineVariant
                                .withOpacity(0.3),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        // Value bar
                        FractionallySizedBox(
                          widthFactor: widthFactor.clamp(0.01, 1.0),
                          child: Container(
                            height: 8,
                            decoration: BoxDecoration(
                              color: isPositive
                                  ? getColor(context, "incomeAmount")
                                  : getColor(context, "expenseAmount"),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  SizedBox(
                    width: 70,
                    child: Text(
                      convertToMoney(
                        Provider.of<AllWallets>(context),
                        amount.abs(),
                        currencyKey: Provider.of<AllWallets>(context)
                            .indexedByPk[
                                appStateSettings["selectedWalletPk"]]
                            ?.currency,
                      ),
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: isPositive
                            ? getColor(context, "incomeAmount")
                            : getColor(context, "expenseAmount"),
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
