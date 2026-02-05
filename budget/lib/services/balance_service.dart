import 'package:budget/database/tables.dart';
import 'package:budget/functions/debt_simplifier.dart';
import 'package:budget/struct/databaseGlobal.dart';
import 'package:budget/struct/settings.dart';
import 'package:drift/drift.dart';

class BalanceService {
  static Future<void> recalculateGroupBalances(String groupPk) async {
    final expenses = await (database.select(database.sharedExpenses)
          ..where((tbl) => tbl.groupFk.equals(groupPk)))
        .get();

    final settlements = await (database.select(database.settlements)
          ..where((tbl) => tbl.groupFk.equals(groupPk)))
        .get();

    List<ExpenseSplitEntry> splits = const [];
    if (expenses.isNotEmpty) {
      final expenseIds = expenses.map((e) => e.expensePk).toList();
      splits = await (database.select(database.expenseSplits)
            ..where((tbl) => tbl.expenseFk.isIn(expenseIds)))
          .get();
    }

    final netBalances = DebtSimplifier.calculateNetBalances(
      expenses: expenses,
      splits: splits,
      settlements: settlements,
    );
    final simplified = DebtSimplifier.simplifyDebts(netBalances);

    await (database.delete(database.groupBalances)
          ..where((tbl) => tbl.groupFk.equals(groupPk)))
        .go();

    if (simplified.isEmpty) {
      return;
    }

    final now = DateTime.now();
    final currency = expenses.isNotEmpty
        ? expenses.first.currency
        : (appStateSettings['selectedCurrency'] as String?) ?? 'usd';

    await database.batch((batch) {
      batch.insertAll(
        database.groupBalances,
        simplified.map(
          (transaction) => GroupBalancesCompanion(
            balancePk: Value(uuid.v4()),
            groupFk: Value(groupPk),
            fromUserEmail: Value(transaction.from),
            toUserEmail: Value(transaction.to),
            amount: Value(transaction.amount),
            currency: Value(currency),
            lastUpdated: Value(now),
          ),
        ),
        mode: InsertMode.insert,
      );
    });
  }

  static Future<double> getUserTotalBalance(String userEmail) async {
    final owedToUser = await (database.select(database.groupBalances)
          ..where((tbl) => tbl.toUserEmail.equals(userEmail)))
        .get();
    final owedByUser = await (database.select(database.groupBalances)
          ..where((tbl) => tbl.fromUserEmail.equals(userEmail)))
        .get();

    final positive = owedToUser.fold<double>(0, (sum, entry) => sum + entry.amount);
    final negative = owedByUser.fold<double>(0, (sum, entry) => sum + entry.amount);
    return positive - negative;
  }

  static Future<double> getBalanceBetweenUsers(
    String groupPk,
    String userA,
    String userB,
  ) async {
    final balances = await (database.select(database.groupBalances)
          ..where((tbl) => tbl.groupFk.equals(groupPk))
          ..where(
            (tbl) => (tbl.fromUserEmail.equals(userA) & tbl.toUserEmail.equals(userB)) |
                (tbl.fromUserEmail.equals(userB) & tbl.toUserEmail.equals(userA)),
          ))
        .get();

    double total = 0;
    for (final balance in balances) {
      if (balance.fromUserEmail == userA && balance.toUserEmail == userB) {
        total -= balance.amount;
      } else {
        total += balance.amount;
      }
    }
    return total;
  }

  static Future<List<DebtTransaction>> previewSimplifiedDebts(String groupPk) async {
    final expenses = await (database.select(database.sharedExpenses)
          ..where((tbl) => tbl.groupFk.equals(groupPk)))
        .get();
    List<ExpenseSplitEntry> splits = const [];
    if (expenses.isNotEmpty) {
      final expenseIds = expenses.map((e) => e.expensePk).toList();
      splits = await (database.select(database.expenseSplits)
            ..where((tbl) => tbl.expenseFk.isIn(expenseIds)))
          .get();
    }
    final settlements = await (database.select(database.settlements)
          ..where((tbl) => tbl.groupFk.equals(groupPk)))
        .get();
    final netBalances = DebtSimplifier.calculateNetBalances(
      expenses: expenses,
      splits: splits,
      settlements: settlements,
    );
    return DebtSimplifier.simplifyDebts(netBalances);
  }

  static Future<List<DebtTransaction>> getSimplifiedDebts(String groupPk) {
    return previewSimplifiedDebts(groupPk);
  }
}
