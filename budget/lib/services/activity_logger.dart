import 'package:budget/database/tables.dart';
import 'package:budget/services/notification_service.dart';
import 'package:budget/struct/databaseGlobal.dart';
import 'package:drift/drift.dart';

class ActivityLogger {
  static Future<void> logExpenseAdded(
    String groupPk, {
    required String actorEmail,
    required SharedExpenseEntry expense,
    required Map<String, double> splits,
  }) async {
    final description = _formatExpenseDescription(expense.title, expense.amount, splits.length);
    await _insertActivity(
      groupPk,
      activityType: 'expense_added',
      performedBy: actorEmail,
      description: description,
      relatedExpense: expense.expensePk,
    );
    await NotificationService.sendGroupNotification(
      groupPk: groupPk,
      message: description,
      recipients: const [],
    );
  }

  static Future<void> logExpenseDeleted(
    String groupPk, {
    required SharedExpenseEntry expense,
    String? actorEmail,
  }) async {
    await _insertActivity(
      groupPk,
      activityType: 'expense_deleted',
      performedBy: actorEmail ?? expense.paidBy,
      description: 'Removed expense "' + expense.title + '"',
      relatedExpense: expense.expensePk,
    );
  }

  static Future<void> logExpenseUpdated(
    String groupPk, {
    required String actorEmail,
    required String expensePk,
    String? expenseTitle,
    double? amount,
  }) async {
    final amountText = amount != null ? ' (' + amount.toStringAsFixed(2) + ')' : '';
    final description = 'Updated "' + (expenseTitle ?? 'expense') + '"' + amountText;
    await _insertActivity(
      groupPk,
      activityType: 'expense_updated',
      performedBy: actorEmail,
      description: description,
      relatedExpense: expensePk,
    );
  }

  static Future<void> logSettlementRecorded(
    String groupPk, {
    required String actorEmail,
    required SettlementEntry settlement,
  }) async {
    final description = 'Recorded settlement from ' +
        settlement.fromUserEmail +
        ' to ' +
        settlement.toUserEmail +
        ' for ' +
        settlement.amount.toStringAsFixed(2);
    await _insertActivity(
      groupPk,
      activityType: 'settlement_recorded',
      performedBy: actorEmail,
      description: description,
      relatedSettlement: settlement.settlementPk,
    );
    await NotificationService.sendGroupNotification(
      groupPk: groupPk,
      message: description,
      recipients: const [],
    );
  }

  static Future<void> logSettlementMade(
    String groupPk, {
    required String actorEmail,
    required SettlementEntry settlement,
  }) {
    return logSettlementRecorded(
      groupPk,
      actorEmail: actorEmail,
      settlement: settlement,
    );
  }

  static Future<void> logMemberStatus(
    String groupPk, {
    required String actorEmail,
    required String memberEmail,
    required bool joined,
  }) async {
    await _insertActivity(
      groupPk,
      activityType: joined ? 'member_joined' : 'member_left',
      performedBy: actorEmail,
      description: joined
          ? memberEmail + ' joined the group'
          : memberEmail + ' left the group',
    );
  }

  static Future<void> logMemberJoined(
    String groupPk, {
    required String actorEmail,
    required String memberEmail,
  }) {
    return logMemberStatus(
      groupPk,
      actorEmail: actorEmail,
      memberEmail: memberEmail,
      joined: true,
    );
  }

  static Future<void> logMemberLeft(
    String groupPk, {
    required String actorEmail,
    required String memberEmail,
  }) {
    return logMemberStatus(
      groupPk,
      actorEmail: actorEmail,
      memberEmail: memberEmail,
      joined: false,
    );
  }

  static Future<void> _insertActivity(
    String groupPk, {
    required String activityType,
    required String performedBy,
    required String description,
    String? relatedExpense,
    String? relatedSettlement,
  }) async {
    await database.into(database.groupActivity).insert(
      GroupActivityCompanion(
        groupFk: Value(groupPk),
        activityType: Value(activityType),
        performedBy: Value(performedBy),
        description: Value(description),
        relatedExpenseFk: Value(relatedExpense),
        relatedSettlementFk: Value(relatedSettlement),
        dateCreated: Value(DateTime.now()),
      ),
    );
  }

  static String _formatExpenseDescription(String title, double amount, int participants) {
    final participantText = participants == 1 ? 'participant' : 'participants';
    return 'Added "' +
        title +
        '" (' +
        amount.toStringAsFixed(2) +
        ') split between ' +
        participants.toString() +
        ' ' +
        participantText;
  }
}
