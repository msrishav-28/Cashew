import 'package:budget/database/tables.dart';
import 'package:budget/functions/split_calculator.dart';
import 'package:budget/struct/databaseGlobal.dart';
import 'package:budget/struct/settings.dart';
import 'package:budget/services/activity_logger.dart';
import 'package:budget/services/balance_service.dart';
import 'package:drift/drift.dart';

class SharedExpenseOperations {
  static Future<SharedExpenseEntry> addSharedExpense({
    required String groupPk,
    required String title,
    required double amount,
    required String paidBy,
    required Map<String, double> splits,
    String? description,
    String? categoryFk,
    String? imageUrl,
    String? currency,
  }) async {
    if (splits.isEmpty) {
      throw SplitCalculationException('At least one split is required');
    }

    final now = DateTime.now();
    final expensePk = uuid.v4();
    final resolvedCurrency = currency ??
        (appStateSettings['selectedCurrency'] as String?) ??
        'usd';

    SharedExpenseEntry? createdExpense;

    await database.transaction(() async {
      await database.into(database.sharedExpenses).insert(
        SharedExpensesCompanion(
          expensePk: Value(expensePk),
          groupFk: Value(groupPk),
          title: Value(title),
          description: Value(description),
          amount: Value(amount),
          currency: Value(resolvedCurrency),
          categoryFk: Value(categoryFk),
          paidBy: Value(paidBy),
          dateCreated: Value(now),
          dateTimeModified: Value(now),
          imageUrl: Value(imageUrl),
          isSettled: const Value(false),
        ),
      );

      await database.batch((batch) {
        batch.insertAll(
          database.expenseSplits,
          splits.entries.map(
            (entry) => ExpenseSplitsCompanion(
              splitPk: Value(uuid.v4()),
              expenseFk: Value(expensePk),
              userEmail: Value(entry.key),
              shareAmount: Value(entry.value),
              paidAmount: const Value(0),
              isPaid: const Value(false),
            ),
          ),
          mode: InsertMode.insert,
        );
      });

      createdExpense = await (database.select(database.sharedExpenses)
            ..where((tbl) => tbl.expensePk.equals(expensePk)))
          .getSingle();
    });

    if (createdExpense == null) {
      throw Exception('Failed to create shared expense');
    }

    await BalanceService.recalculateGroupBalances(groupPk);
    await ActivityLogger.logExpenseAdded(
      groupPk,
      actorEmail: paidBy,
      expense: createdExpense!,
      splits: splits,
    );

    return createdExpense!;
  }

  static Future<void> deleteSharedExpense(String expensePk) async {
    final expense = await (database.select(database.sharedExpenses)
          ..where((tbl) => tbl.expensePk.equals(expensePk)))
        .getSingleOrNull();
    if (expense == null) return;

    await database.transaction(() async {
      await (database.delete(database.expenseSplits)
            ..where((tbl) => tbl.expenseFk.equals(expensePk)))
          .go();
      await (database.delete(database.sharedExpenses)
            ..where((tbl) => tbl.expensePk.equals(expensePk)))
          .go();
    });

    await BalanceService.recalculateGroupBalances(expense.groupFk);
    await ActivityLogger.logExpenseDeleted(
      expense.groupFk,
      expense: expense,
      actorEmail: expense.paidBy,
    );
  }

  static Future<void> editSharedExpense(String expensePk, Map<String, dynamic> updates) async {
    if (updates.isEmpty) return;
    final expense = await (database.select(database.sharedExpenses)
          ..where((tbl) => tbl.expensePk.equals(expensePk)))
        .getSingleOrNull();
    if (expense == null) {
      throw Exception('Shared expense not found');
    }

    final companion = SharedExpensesCompanion(
      title: updates.containsKey('title') ? Value(updates['title'] as String) : const Value.absent(),
      description: updates.containsKey('description')
          ? Value((updates['description'] as String?)?.trim())
          : const Value.absent(),
      amount: updates.containsKey('amount')
          ? Value((updates['amount'] as num).toDouble())
          : const Value.absent(),
      currency: updates.containsKey('currency')
          ? Value((updates['currency'] as String).toLowerCase())
          : const Value.absent(),
      categoryFk: updates.containsKey('categoryFk')
          ? Value(updates['categoryFk'] as String?)
          : const Value.absent(),
      paidBy: updates.containsKey('paidBy') ? Value(updates['paidBy'] as String) : const Value.absent(),
      imageUrl:
          updates.containsKey('imageUrl') ? Value(updates['imageUrl'] as String?) : const Value.absent(),
      isSettled: updates.containsKey('isSettled')
          ? Value(updates['isSettled'] as bool)
          : const Value.absent(),
      dateTimeModified: Value(DateTime.now()),
    );

    await (database.update(database.sharedExpenses)
          ..where((tbl) => tbl.expensePk.equals(expensePk)))
        .write(companion);

    final newSplitsRaw = updates['splits'] as Map<String, double>?;
    if (newSplitsRaw != null) {
      await (database.delete(database.expenseSplits)
            ..where((tbl) => tbl.expenseFk.equals(expensePk)))
          .go();
      await database.batch((batch) {
        batch.insertAll(
          database.expenseSplits,
          newSplitsRaw.entries.map(
            (entry) => ExpenseSplitsCompanion(
              splitPk: Value(uuid.v4()),
              expenseFk: Value(expensePk),
              userEmail: Value(entry.key),
              shareAmount: Value(entry.value),
              paidAmount: const Value(0),
              isPaid: const Value(false),
            ),
          ),
          mode: InsertMode.insert,
        );
      });
    } else if (updates.containsKey('amount')) {
      final updatedAmount = (updates['amount'] as num).toDouble();
      final existingSplits = await (database.select(database.expenseSplits)
            ..where((tbl) => tbl.expenseFk.equals(expensePk)))
          .get();
      if (existingSplits.isNotEmpty && expense.amount > 0) {
        final scale = updatedAmount / expense.amount;
        await database.batch((batch) {
          for (final split in existingSplits) {
            batch.update(
              database.expenseSplits,
              ExpenseSplitsCompanion(
                shareAmount: Value(split.shareAmount * scale),
              ),
              where: (tbl) => tbl.splitPk.equals(split.splitPk),
            );
          }
        });
      }
    }

    await BalanceService.recalculateGroupBalances(expense.groupFk);
    await ActivityLogger.logExpenseUpdated(
      expense.groupFk,
      actorEmail: updates['updatedBy'] as String? ?? expense.paidBy,
      expensePk: expensePk,
      expenseTitle: (updates['title'] as String?) ?? expense.title,
      amount: updates.containsKey('amount')
          ? (updates['amount'] as num?)?.toDouble()
          : null,
    );
  }

  static Future<void> updateSettlementStatus(String expensePk, bool isSettled) async {
    await (database.update(database.sharedExpenses)
          ..where((tbl) => tbl.expensePk.equals(expensePk)))
        .write(
      SharedExpensesCompanion(
        isSettled: Value(isSettled),
        dateTimeModified: Value(DateTime.now()),
      ),
    );
  }

  static Future<List<SharedExpenseEntry>> fetchRecentExpenses(
    String groupPk, {
    int limit = 20,
  }) {
    return (database.select(database.sharedExpenses)
          ..where((tbl) => tbl.groupFk.equals(groupPk))
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.dateCreated)])
          ..limit(limit))
        .get();
  }

  static Future<List<SharedExpenseEntry>> fetchGroupExpenses(
    String groupPk, {
    int limit = 100,
    int? offset,
  }) async {
    final query = (database.select(database.sharedExpenses)
          ..where((tbl) => tbl.groupFk.equals(groupPk))
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.dateCreated)])
          ..limit(limit, offset: offset));
    return query.get();
  }

  static Future<List<SharedExpenseEntry>> fetchUserSharedExpenses(String userEmail) async {
    final splitQuery = await (database.select(database.expenseSplits)
          ..where((tbl) => tbl.userEmail.equals(userEmail)))
        .get();
    if (splitQuery.isEmpty) return const [];
    final expenseIds = splitQuery.map((split) => split.expenseFk).toSet().toList();
    return (database.select(database.sharedExpenses)
          ..where((tbl) => tbl.expensePk.isIn(expenseIds)))
        .get();
  }

  static Future<List<SharedExpenseWithGroup>> searchSharedExpenses({
    String? searchQuery,
    String? groupPk,
    DateTime? startDate,
    DateTime? endDate,
    List<String>? memberEmails,
    List<String>? categoryFks,
    bool? settled,
    double? minAmount,
    double? maxAmount,
    int limit = 50,
  }) async {
    final shared = database.sharedExpenses;
    final groups = database.groups;
    final joined = database.select(shared).join([
      innerJoin(groups, groups.groupPk.equalsExp(shared.groupFk)),
    ]);

    if (groupPk != null) {
      joined.where(shared.groupFk.equals(groupPk));
    }
    if (startDate != null) {
      joined.where(shared.dateCreated.isBiggerOrEqualValue(startDate));
    }
    if (endDate != null) {
      joined.where(shared.dateCreated.isSmallerOrEqualValue(endDate));
    }
    if (settled != null) {
      joined.where(shared.isSettled.equals(settled));
    }
    if (categoryFks != null && categoryFks.isNotEmpty) {
      joined.where(shared.categoryFk.isIn(categoryFks));
    }
    if (minAmount != null) {
      joined.where(shared.amount.isBiggerOrEqualValue(minAmount));
    }
    if (maxAmount != null) {
      joined.where(shared.amount.isSmallerOrEqualValue(maxAmount));
    }
    if (memberEmails != null && memberEmails.isNotEmpty) {
      final memberQuery = database.selectOnly(database.expenseSplits)
        ..addColumns([database.expenseSplits.expenseFk])
        ..where(database.expenseSplits.userEmail.isIn(memberEmails));
      joined.where(shared.expensePk.isInQuery(memberQuery));
    }
    final trimmedQuery = searchQuery?.trim();
    if (trimmedQuery != null && trimmedQuery.isNotEmpty) {
      final pattern = '%${trimmedQuery.replaceAll('%', '\\%')}%';
      joined.where(
        shared.title.like(pattern) | shared.description.like(pattern),
      );
    }

    joined.orderBy([OrderingTerm.desc(shared.dateCreated)]);
    joined.limit(limit);

    final rows = await joined.get();
    return rows
        .map(
          (row) => SharedExpenseWithGroup(
            expense: row.readTable(shared),
            group: row.readTable(groups),
          ),
        )
        .toList();
  }
}

class SharedExpenseWithGroup {
  const SharedExpenseWithGroup({required this.expense, required this.group});

  final SharedExpenseEntry expense;
  final GroupEntry group;
}
