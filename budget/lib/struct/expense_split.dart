import 'package:budget/database/tables.dart';
import 'package:drift/drift.dart';

class ExpenseSplitModel {
  final String splitPk;
  final String expenseFk;
  final String userEmail;
  final double shareAmount;
  final double paidAmount;
  final bool isPaid;

  const ExpenseSplitModel({
    required this.splitPk,
    required this.expenseFk,
    required this.userEmail,
    required this.shareAmount,
    this.paidAmount = 0,
    this.isPaid = false,
  });

  factory ExpenseSplitModel.fromEntry(ExpenseSplitEntry entry) {
    return ExpenseSplitModel(
      splitPk: entry.splitPk,
      expenseFk: entry.expenseFk,
      userEmail: entry.userEmail,
      shareAmount: entry.shareAmount,
      paidAmount: entry.paidAmount,
      isPaid: entry.isPaid,
    );
  }

  ExpenseSplitsCompanion toCompanion() {
    return ExpenseSplitsCompanion(
      splitPk: Value(splitPk),
      expenseFk: Value(expenseFk),
      userEmail: Value(userEmail),
      shareAmount: Value(shareAmount),
      paidAmount: Value(paidAmount),
      isPaid: Value(isPaid),
    );
  }

  ExpenseSplitModel copyWith({
    String? splitPk,
    String? expenseFk,
    String? userEmail,
    double? shareAmount,
    double? paidAmount,
    bool? isPaid,
  }) {
    return ExpenseSplitModel(
      splitPk: splitPk ?? this.splitPk,
      expenseFk: expenseFk ?? this.expenseFk,
      userEmail: userEmail ?? this.userEmail,
      shareAmount: shareAmount ?? this.shareAmount,
      paidAmount: paidAmount ?? this.paidAmount,
      isPaid: isPaid ?? this.isPaid,
    );
  }

  factory ExpenseSplitModel.fromJson(Map<String, dynamic> json) {
    return ExpenseSplitModel(
      splitPk: json['splitPk'] as String,
      expenseFk: json['expenseFk'] as String,
      userEmail: json['userEmail'] as String,
      shareAmount: (json['shareAmount'] as num).toDouble(),
      paidAmount: (json['paidAmount'] as num?)?.toDouble() ?? 0,
      isPaid: json['isPaid'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'splitPk': splitPk,
      'expenseFk': expenseFk,
      'userEmail': userEmail,
      'shareAmount': shareAmount,
      'paidAmount': paidAmount,
      'isPaid': isPaid,
    };
  }
}
