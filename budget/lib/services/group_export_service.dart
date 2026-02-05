import 'package:budget/database/tables.dart';
import 'package:budget/functions.dart';
import 'package:budget/struct/databaseGlobal.dart';
import 'package:budget/widgets/util/saveFile.dart';
import 'package:csv/csv.dart';
import 'package:drift/drift.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:pdf/widgets.dart' as pw;

class GroupExportService {
  static Future<bool> exportExpensesToCsv({
    required BuildContext context,
    required String groupPk,
    DateTime? startDate,
    DateTime? endDate,
    String fileName = 'group-expenses.csv',
  }) async {
    final query = database.select(database.sharedExpenses)
      ..where((tbl) => tbl.groupFk.equals(groupPk))
      ..orderBy([(tbl) => OrderingTerm.desc(tbl.dateCreated)]);
    if (startDate != null) {
      query.where((tbl) => tbl.dateCreated.isBiggerOrEqualValue(startDate));
    }
    if (endDate != null) {
      query.where((tbl) => tbl.dateCreated.isSmallerOrEqualValue(endDate));
    }
    final expenses = await query.get();
    final formatter = DateFormat.yMMMd();
    final rows = <List<dynamic>>[
      ['Title', 'Amount', 'Currency', 'Paid By', 'Date', 'Category', 'Description'],
      ...expenses.map(
        (expense) => [
          expense.title,
          expense.amount.toStringAsFixed(2),
          expense.currency,
          expense.paidBy,
          formatter.format(expense.dateCreated),
          expense.categoryFk ?? '-',
          expense.description ?? '',
        ],
      ),
    ];
    final csv = const ListToCsvConverter().convert(rows);
    final sanitizedName = fileName.trim().isEmpty ? 'group-expenses.csv' : fileName.trim();
    return saveFile(
      boxContext: context,
      dataStore: null,
      dataString: csv,
      fileName: sanitizedName,
      successMessage: 'csv-saved-success'.tr(),
      errorMessage: 'error-exporting'.tr(),
    );
  }

  static Future<bool> exportGroupSummaryPdf({
    required BuildContext context,
    required String groupPk,
  }) async {
    final group = await (database.select(database.groups)
          ..where((tbl) => tbl.groupPk.equals(groupPk)))
        .getSingleOrNull();
    final expenses = await (database.select(database.sharedExpenses)
          ..where((tbl) => tbl.groupFk.equals(groupPk))
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.dateCreated)]))
        .get();
    final totalSpent = expenses.fold<double>(0, (sum, expense) => sum + expense.amount);
    final currencyLabel = expenses.isNotEmpty ? expenses.first.currency.toUpperCase() : '';
    final byCategory = <String, double>{};
    for (final expense in expenses) {
      final key = expense.categoryFk ?? 'uncategorized';
      byCategory[key] = (byCategory[key] ?? 0) + expense.amount;
    }

    final doc = pw.Document();
    final title = group?.name ?? 'Group';

    doc.addPage(
      pw.MultiPage(
        build: (context) {
          return [
            pw.Text('Group Summary: ' + title, style: pw.TextStyle(fontSize: 22, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 12),
            pw.Text('Expenses: ${expenses.length}'),
            pw.Text(
              'Total Spent: ' +
                  formatCurrencyWithName(totalSpent, expenses.isNotEmpty ? expenses.first.currency : null,
                      alwaysShowSymbol: true),
            ),
            pw.SizedBox(height: 20),
            pw.Text('Breakdown by category', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 8),
            pw.Table.fromTextArray(
              headers: const ['Category', 'Amount'],
              data: byCategory.entries
                  .map(
                    (entry) => [entry.key, entry.value.toStringAsFixed(2) + ' ' + currencyLabel],
                  )
                  .toList(),
            ),
          ];
        },
      ),
    );

    final bytes = await doc.save();
    final fileName = 'group-summary-' + title.replaceAll(' ', '-').toLowerCase() + '.pdf';
    return saveFile(
      boxContext: context,
      dataStore: bytes,
      dataString: null,
      fileName: fileName,
      successMessage: 'file-saved'.tr(),
      errorMessage: 'error-saving'.tr(),
    );
  }
}
