import 'package:budget/colors.dart';
import 'package:budget/struct/design_system.dart';
import 'package:budget/database/tables.dart';
import 'package:budget/functions.dart';
import 'package:budget/struct/databaseGlobal.dart';
import 'package:budget/struct/settings.dart';
import 'package:budget/widgets/textWidgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:drift/drift.dart' show OrderingTerm;

class GroupSummaryCard extends StatelessWidget {
  const GroupSummaryCard({super.key});

  Stream<double> _netBalanceStream() {
    final userEmail = appStateSettings["userEmail"];
    if (userEmail == null) return Stream.value(0.0);

    return database.select(database.groupBalances).watch().map((balances) {
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
    return StreamBuilder<double>(
      stream: _netBalanceStream(),
      builder: (context, snapshot) {
        final netAmount = snapshot.data ?? 0;
        final isPositive = netAmount >= 0;
        // Use a nice gradient based on status
        final gradientColors = isPositive
            ? [
                getColor(context, "incomeAmount").withOpacity(0.8),
                getColor(context, "incomeAmount").withOpacity(0.5)
              ]
            : [
                getColor(context, "expenseAmount").withOpacity(0.8),
                getColor(context, "expenseAmount").withOpacity(0.5)
              ];

        return Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: DesignSystem.effects.glassCard.copyWith(
            color: (isPositive 
                ? DesignSystem.colors.income 
                : DesignSystem.colors.expense).withOpacity(0.15),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: (isPositive 
                ? DesignSystem.colors.income 
                : DesignSystem.colors.expense).withOpacity(0.3),
              width: 1.5,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFont(
                  text: "groups-net-balance".tr(),
                  textColor: DesignSystem.colors.textPrimary.withOpacity(0.8),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    TextFont(
                      text: convertToMoney(
                        Provider.of<AllWallets>(context),
                        netAmount.abs(),
                        finalCurrency: Provider.of<AllWallets>(context)
                            .indexedByPk[appStateSettings["selectedWalletPk"]]
                            ?.currency,
                      ),
                      textColor: DesignSystem.colors.textPrimary,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextFont(
                        text: isPositive ? "owe-you".tr() : "you-owe".tr(),
                        textColor: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
