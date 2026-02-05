import 'package:budget/database/operations/shared_expense_operations.dart';
import 'package:budget/database/tables.dart';
import 'package:budget/functions/split_calculator.dart';
import 'package:budget/struct/databaseGlobal.dart';
import 'package:budget/struct/settings.dart';
import 'package:drift/drift.dart';
import 'package:intl/intl.dart';

class TransactionConversionResult {
  const TransactionConversionResult({
    required this.createdExpensePks,
    required this.totalConvertedAmount,
    required this.transactionCount,
  });

  final List<String> createdExpensePks;
  final double totalConvertedAmount;
  final int transactionCount;
}

enum ConversionSplitMode { equal, customShares }

class TransactionConversionService {
  static Future<TransactionConversionResult> convertTransactions({
    required String groupPk,
    required List<String> transactionPks,
    required String paidBy,
    required List<String> participantEmails,
    ConversionSplitMode splitMode = ConversionSplitMode.equal,
    Map<String, double>? customShares,
    bool aggregateIntoSingleExpense = false,
    String? aggregatedTitle,
    String? aggregatedDescription,
    String? categoryOverride,
    String? currencyOverride,
  }) async {
    if (transactionPks.isEmpty) {
      throw ArgumentError('No transactions selected for conversion');
    }
    if (participantEmails.isEmpty) {
      throw ArgumentError('At least one participant is required');
    }

    final uniqueParticipants = {...participantEmails, paidBy}.toList();

    final transactions = await (database.select(database.transactions)
          ..where((tbl) => tbl.transactionPk.isIn(transactionPks)))
        .get();
    if (transactions.isEmpty) {
      throw StateError('Unable to find selected transactions');
    }

    final walletPks = transactions
        .map((transaction) => transaction.walletFk)
        .whereType<String>()
        .toSet()
        .toList();
    final wallets = await (database.select(database.wallets)
          ..where((tbl) => tbl.walletPk.isIn(walletPks)))
        .get();
    final walletByPk = {for (final wallet in wallets) wallet.walletPk: wallet};

    final List<String> createdExpensePks = [];
    double totalConverted = 0;

    Map<String, double> resolveSplit(double totalAmount) {
      switch (splitMode) {
        case ConversionSplitMode.equal:
          return SplitCalculator.calculateEqualSplit(totalAmount, uniqueParticipants);
        case ConversionSplitMode.customShares:
          final sanitizedShares = <String, double>{};
          customShares?.forEach((email, value) {
            if (uniqueParticipants.contains(email) && value > 0) {
              sanitizedShares[email] = value;
            }
          });
          if (sanitizedShares.isEmpty) {
            throw SplitCalculationException('Provide at least one custom share greater than zero');
          }
          return SplitCalculator.calculateCustomSplit(
            sanitizedShares,
            totalAmount,
            allowAutoScale: true,
          );
      }
    }

    Future<SharedExpenseEntry> createSharedExpense({
      required String title,
      required double amount,
      String? categoryFk,
      String? description,
      String? currency,
    }) async {
      if (amount <= 0) {
        throw ArgumentError('Shared expense amount must be greater than zero');
      }
      final splits = resolveSplit(amount);
      return SharedExpenseOperations.addSharedExpense(
        groupPk: groupPk,
        title: title.trim().isEmpty ? 'Converted expense' : title.trim(),
        amount: amount,
        paidBy: paidBy,
        splits: splits,
        description: description,
        categoryFk: categoryFk ?? categoryOverride,
        currency: currency ?? currencyOverride ?? appStateSettings['selectedCurrency'],
      );
    }

    if (aggregateIntoSingleExpense) {
      final totalAmount = transactions.fold<double>(
        0,
        (sum, transaction) => sum + transaction.amount.abs(),
      );
      if (totalAmount <= 0) {
        throw StateError('Selected transactions contain no spend amounts to convert');
      }
      final created = await createSharedExpense(
        title: aggregatedTitle ?? 'Converted transactions',
        amount: totalAmount,
        categoryFk: categoryOverride,
        description: aggregatedDescription ??
            'Includes ${transactions.length} converted transactions',
        currency: currencyOverride,
      );
      totalConverted = totalAmount;
      createdExpensePks.add(created.expensePk);
    } else {
      for (final transaction in transactions) {
        final amount = transaction.amount.abs();
        if (amount == 0) continue;
        final wallet = transaction.walletFk != null ? walletByPk[transaction.walletFk] : null;
        final resolvedCurrency = currencyOverride ?? wallet?.currency ?? appStateSettings['selectedCurrency'];
        final description = (aggregatedDescription ?? '').isNotEmpty
            ? aggregatedDescription
            : 'Converted from personal transaction on ' +
                DateFormat.yMMMd().format(transaction.dateCreated);
        final created = await createSharedExpense(
          title: transaction.name.isEmpty ? 'Converted transaction' : transaction.name,
          amount: amount,
          categoryFk: transaction.categoryFk ?? categoryOverride,
          description: description,
          currency: resolvedCurrency,
        );
        totalConverted += amount;
        createdExpensePks.add(created.expensePk);
      }
    }

    return TransactionConversionResult(
      createdExpensePks: createdExpensePks,
      totalConvertedAmount: totalConverted,
      transactionCount: transactions.length,
    );
  }
}
