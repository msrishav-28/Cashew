import 'package:budget/database/tables.dart';
import 'package:drift/drift.dart';

class SharedExpenseModel {
  final String expensePk;
  final String groupFk;
  final String title;
  final String? description;
  final double amount;
  final String currency;
  final String? categoryFk;
  final String paidBy;
  final DateTime dateCreated;
  final DateTime? dateTimeModified;
  final String? imageUrl;
  final bool isSettled;

  const SharedExpenseModel({
    required this.expensePk,
    required this.groupFk,
    required this.title,
    this.description,
    required this.amount,
    required this.currency,
    this.categoryFk,
    required this.paidBy,
    required this.dateCreated,
    this.dateTimeModified,
    this.imageUrl,
    this.isSettled = false,
  });

  factory SharedExpenseModel.fromEntry(SharedExpenseEntry entry) {
    return SharedExpenseModel(
      expensePk: entry.expensePk,
      groupFk: entry.groupFk,
      title: entry.title,
      description: entry.description,
      amount: entry.amount,
      currency: entry.currency,
      categoryFk: entry.categoryFk,
      paidBy: entry.paidBy,
      dateCreated: entry.dateCreated,
      dateTimeModified: entry.dateTimeModified,
      imageUrl: entry.imageUrl,
      isSettled: entry.isSettled,
    );
  }

  SharedExpensesCompanion toCompanion() {
    return SharedExpensesCompanion(
      expensePk: Value(expensePk),
      groupFk: Value(groupFk),
      title: Value(title),
      description: Value(description),
      amount: Value(amount),
      currency: Value(currency),
      categoryFk: Value(categoryFk),
      paidBy: Value(paidBy),
      dateCreated: Value(dateCreated),
      dateTimeModified: Value(dateTimeModified),
      imageUrl: Value(imageUrl),
      isSettled: Value(isSettled),
    );
  }

  SharedExpenseModel copyWith({
    String? expensePk,
    String? groupFk,
    String? title,
    String? description,
    double? amount,
    String? currency,
    String? categoryFk,
    String? paidBy,
    DateTime? dateCreated,
    DateTime? dateTimeModified,
    String? imageUrl,
    bool? isSettled,
  }) {
    return SharedExpenseModel(
      expensePk: expensePk ?? this.expensePk,
      groupFk: groupFk ?? this.groupFk,
      title: title ?? this.title,
      description: description ?? this.description,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      categoryFk: categoryFk ?? this.categoryFk,
      paidBy: paidBy ?? this.paidBy,
      dateCreated: dateCreated ?? this.dateCreated,
      dateTimeModified: dateTimeModified ?? this.dateTimeModified,
      imageUrl: imageUrl ?? this.imageUrl,
      isSettled: isSettled ?? this.isSettled,
    );
  }

  factory SharedExpenseModel.fromJson(Map<String, dynamic> json) {
    return SharedExpenseModel(
      expensePk: json['expensePk'] as String,
      groupFk: json['groupFk'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String,
      categoryFk: json['categoryFk'] as String?,
      paidBy: json['paidBy'] as String,
      dateCreated: DateTime.parse(json['dateCreated'] as String),
      dateTimeModified: json['dateTimeModified'] != null
          ? DateTime.parse(json['dateTimeModified'] as String)
          : null,
      imageUrl: json['imageUrl'] as String?,
      isSettled: json['isSettled'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'expensePk': expensePk,
      'groupFk': groupFk,
      'title': title,
      'description': description,
      'amount': amount,
      'currency': currency,
      'categoryFk': categoryFk,
      'paidBy': paidBy,
      'dateCreated': dateCreated.toIso8601String(),
      'dateTimeModified': dateTimeModified?.toIso8601String(),
      'imageUrl': imageUrl,
      'isSettled': isSettled,
    };
  }
}
