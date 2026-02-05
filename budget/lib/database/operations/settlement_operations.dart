import 'package:budget/database/tables.dart';
import 'package:budget/services/activity_logger.dart';
import 'package:budget/services/balance_service.dart';
import 'package:budget/struct/databaseGlobal.dart';
import 'package:drift/drift.dart';

class SettlementOperations {
  static Future<SettlementEntry> recordSettlement({
    required String groupPk,
    required String fromUser,
    required String toUser,
    required double amount,
    required String currency,
    String? paymentMethod,
    String? notes,
  }) async {
    final now = DateTime.now();
    final settlementPk = uuid.v4();

    await database.into(database.settlements).insert(
      SettlementsCompanion(
        settlementPk: Value(settlementPk),
        groupFk: Value(groupPk),
        fromUserEmail: Value(fromUser),
        toUserEmail: Value(toUser),
        amount: Value(amount),
        currency: Value(currency),
        paymentMethod: Value(paymentMethod),
        notes: Value(notes),
        dateCreated: Value(now),
      ),
    );

    final entry = await (database.select(database.settlements)
          ..where((tbl) => tbl.settlementPk.equals(settlementPk)))
        .getSingle();

    await BalanceService.recalculateGroupBalances(groupPk);
    await ActivityLogger.logSettlementRecorded(
      groupPk,
      actorEmail: fromUser,
      settlement: entry,
    );

    return entry;
  }

  static Future<List<SettlementEntry>> fetchSettlementsBetweenUsers(
    String groupPk,
    String userA,
    String userB,
  ) {
    return (database.select(database.settlements)
          ..where((tbl) => tbl.groupFk.equals(groupPk))
          ..where(
            (tbl) => (tbl.fromUserEmail.equals(userA) & tbl.toUserEmail.equals(userB)) |
                (tbl.fromUserEmail.equals(userB) & tbl.toUserEmail.equals(userA)),
          )
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.dateCreated)]))
        .get();
  }

  static Future<List<SettlementEntry>> fetchGroupSettlements(String groupPk) {
    return (database.select(database.settlements)
          ..where((tbl) => tbl.groupFk.equals(groupPk))
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.dateCreated)]))
        .get();
  }
}
