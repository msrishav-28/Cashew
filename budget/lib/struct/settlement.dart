import 'package:budget/database/tables.dart';
import 'package:drift/drift.dart';

class SettlementModel {
  final String settlementPk;
  final String groupFk;
  final String fromUserEmail;
  final String toUserEmail;
  final double amount;
  final String currency;
  final String? paymentMethod;
  final String? notes;
  final DateTime dateCreated;

  const SettlementModel({
    required this.settlementPk,
    required this.groupFk,
    required this.fromUserEmail,
    required this.toUserEmail,
    required this.amount,
    required this.currency,
    this.paymentMethod,
    this.notes,
    required this.dateCreated,
  });

  factory SettlementModel.fromEntry(SettlementEntry entry) {
    return SettlementModel(
      settlementPk: entry.settlementPk,
      groupFk: entry.groupFk,
      fromUserEmail: entry.fromUserEmail,
      toUserEmail: entry.toUserEmail,
      amount: entry.amount,
      currency: entry.currency,
      paymentMethod: entry.paymentMethod,
      notes: entry.notes,
      dateCreated: entry.dateCreated,
    );
  }

  SettlementsCompanion toCompanion() {
    return SettlementsCompanion(
      settlementPk: Value(settlementPk),
      groupFk: Value(groupFk),
      fromUserEmail: Value(fromUserEmail),
      toUserEmail: Value(toUserEmail),
      amount: Value(amount),
      currency: Value(currency),
      paymentMethod: Value(paymentMethod),
      notes: Value(notes),
      dateCreated: Value(dateCreated),
    );
  }

  SettlementModel copyWith({
    String? settlementPk,
    String? groupFk,
    String? fromUserEmail,
    String? toUserEmail,
    double? amount,
    String? currency,
    String? paymentMethod,
    String? notes,
    DateTime? dateCreated,
  }) {
    return SettlementModel(
      settlementPk: settlementPk ?? this.settlementPk,
      groupFk: groupFk ?? this.groupFk,
      fromUserEmail: fromUserEmail ?? this.fromUserEmail,
      toUserEmail: toUserEmail ?? this.toUserEmail,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      notes: notes ?? this.notes,
      dateCreated: dateCreated ?? this.dateCreated,
    );
  }

  factory SettlementModel.fromJson(Map<String, dynamic> json) {
    return SettlementModel(
      settlementPk: json['settlementPk'] as String,
      groupFk: json['groupFk'] as String,
      fromUserEmail: json['fromUserEmail'] as String,
      toUserEmail: json['toUserEmail'] as String,
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String,
      paymentMethod: json['paymentMethod'] as String?,
      notes: json['notes'] as String?,
      dateCreated: DateTime.parse(json['dateCreated'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'settlementPk': settlementPk,
      'groupFk': groupFk,
      'fromUserEmail': fromUserEmail,
      'toUserEmail': toUserEmail,
      'amount': amount,
      'currency': currency,
      'paymentMethod': paymentMethod,
      'notes': notes,
      'dateCreated': dateCreated.toIso8601String(),
    };
  }
}
