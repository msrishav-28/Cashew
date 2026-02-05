import 'package:budget/database/tables.dart';
import 'package:drift/drift.dart';

class GroupBalanceModel {
  final String balancePk;
  final String groupFk;
  final String fromUserEmail;
  final String toUserEmail;
  final double amount;
  final String currency;
  final DateTime lastUpdated;

  const GroupBalanceModel({
    required this.balancePk,
    required this.groupFk,
    required this.fromUserEmail,
    required this.toUserEmail,
    required this.amount,
    required this.currency,
    required this.lastUpdated,
  });

  factory GroupBalanceModel.fromEntry(GroupBalanceEntry entry) {
    return GroupBalanceModel(
      balancePk: entry.balancePk,
      groupFk: entry.groupFk,
      fromUserEmail: entry.fromUserEmail,
      toUserEmail: entry.toUserEmail,
      amount: entry.amount,
      currency: entry.currency,
      lastUpdated: entry.lastUpdated,
    );
  }

  GroupBalancesCompanion toCompanion() {
    return GroupBalancesCompanion(
      balancePk: Value(balancePk),
      groupFk: Value(groupFk),
      fromUserEmail: Value(fromUserEmail),
      toUserEmail: Value(toUserEmail),
      amount: Value(amount),
      currency: Value(currency),
      lastUpdated: Value(lastUpdated),
    );
  }

  GroupBalanceModel copyWith({
    String? balancePk,
    String? groupFk,
    String? fromUserEmail,
    String? toUserEmail,
    double? amount,
    String? currency,
    DateTime? lastUpdated,
  }) {
    return GroupBalanceModel(
      balancePk: balancePk ?? this.balancePk,
      groupFk: groupFk ?? this.groupFk,
      fromUserEmail: fromUserEmail ?? this.fromUserEmail,
      toUserEmail: toUserEmail ?? this.toUserEmail,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }

  factory GroupBalanceModel.fromJson(Map<String, dynamic> json) {
    return GroupBalanceModel(
      balancePk: json['balancePk'] as String,
      groupFk: json['groupFk'] as String,
      fromUserEmail: json['fromUserEmail'] as String,
      toUserEmail: json['toUserEmail'] as String,
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String,
      lastUpdated: DateTime.parse(json['lastUpdated'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'balancePk': balancePk,
      'groupFk': groupFk,
      'fromUserEmail': fromUserEmail,
      'toUserEmail': toUserEmail,
      'amount': amount,
      'currency': currency,
      'lastUpdated': lastUpdated.toIso8601String(),
    };
  }
}
