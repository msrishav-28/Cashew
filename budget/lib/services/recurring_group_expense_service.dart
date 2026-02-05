import 'package:budget/database/operations/shared_expense_operations.dart';
import 'package:budget/database/tables.dart';
import 'package:budget/functions/split_calculator.dart';
import 'package:budget/struct/databaseGlobal.dart';
import 'package:budget/struct/settings.dart';

const _recurringTemplatesKey = 'groupRecurringTemplates';

enum RecurringFrequency { weekly, monthly, custom }

class RecurringGroupExpenseTemplate {
  RecurringGroupExpenseTemplate({
    required this.templateId,
    required this.groupPk,
    required this.title,
    required this.amount,
    required this.currency,
    required this.paidBy,
    required this.participants,
    required this.frequency,
    this.customIntervalDays,
    this.categoryFk,
    this.customShares,
    required this.nextRun,
    this.lastRun,
    this.paused = false,
  });

  final String templateId;
  final String groupPk;
  final String title;
  final double amount;
  final String currency;
  final String paidBy;
  final List<String> participants;
  final RecurringFrequency frequency;
  final int? customIntervalDays;
  final String? categoryFk;
  final Map<String, double>? customShares;
  final DateTime nextRun;
  final DateTime? lastRun;
  final bool paused;

  RecurringGroupExpenseTemplate copyWith({
    DateTime? nextRun,
    DateTime? lastRun,
    bool? paused,
  }) {
    return RecurringGroupExpenseTemplate(
      templateId: templateId,
      groupPk: groupPk,
      title: title,
      amount: amount,
      currency: currency,
      paidBy: paidBy,
      participants: participants,
      frequency: frequency,
      customIntervalDays: customIntervalDays,
      categoryFk: categoryFk,
      customShares: customShares,
      nextRun: nextRun ?? this.nextRun,
      lastRun: lastRun ?? this.lastRun,
      paused: paused ?? this.paused,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'templateId': templateId,
      'groupPk': groupPk,
      'title': title,
      'amount': amount,
      'currency': currency,
      'paidBy': paidBy,
      'participants': participants,
      'frequency': frequency.index,
      'customIntervalDays': customIntervalDays,
      'categoryFk': categoryFk,
      'customShares': customShares,
      'nextRun': nextRun.toIso8601String(),
      'lastRun': lastRun?.toIso8601String(),
      'paused': paused,
    };
  }

  factory RecurringGroupExpenseTemplate.fromJson(Map<String, dynamic> json) {
    return RecurringGroupExpenseTemplate(
      templateId: json['templateId'] as String,
      groupPk: json['groupPk'] as String,
      title: json['title'] as String,
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String,
      paidBy: json['paidBy'] as String,
      participants:
          (json['participants'] as List<dynamic>).map((value) => value.toString()).toList(),
      frequency: RecurringFrequency.values[(json['frequency'] as int?) ?? 0],
      customIntervalDays: json['customIntervalDays'] as int?,
      categoryFk: json['categoryFk'] as String?,
      customShares: (json['customShares'] as Map?)?.map(
        (key, value) => MapEntry(key.toString(), (value as num).toDouble()),
      ),
      nextRun: DateTime.parse(json['nextRun'] as String),
      lastRun: json['lastRun'] != null ? DateTime.parse(json['lastRun'] as String) : null,
      paused: json['paused'] as bool? ?? false,
    );
  }
}

class RecurringGroupExpenseService {
  static List<RecurringGroupExpenseTemplate> _loadTemplates() {
    final raw = appStateSettings[_recurringTemplatesKey];
    if (raw is List) {
      return raw
          .whereType<Map>()
          .map((entry) => RecurringGroupExpenseTemplate.fromJson(
                Map<String, dynamic>.from(entry),
              ))
          .toList();
    }
    return [];
  }

  static Future<void> _persist(List<RecurringGroupExpenseTemplate> templates) async {
    await updateSettings(
      _recurringTemplatesKey,
      templates.map((template) => template.toJson()).toList(),
      updateGlobalState: true,
    );
  }

  static Future<RecurringGroupExpenseTemplate> upsertTemplate(
    RecurringGroupExpenseTemplate template,
  ) async {
    final templates = _loadTemplates();
    final idx = templates.indexWhere((item) => item.templateId == template.templateId);
    if (idx == -1) {
      templates.add(template);
    } else {
      templates[idx] = template;
    }
    await _persist(templates);
    return template;
  }

  static Future<void> deleteTemplate(String templateId) async {
    final templates = _loadTemplates();
    templates.removeWhere((template) => template.templateId == templateId);
    await _persist(templates);
  }

  static List<RecurringGroupExpenseTemplate> listTemplates({String? groupPk}) {
    return _loadTemplates().where((template) {
      return groupPk == null || template.groupPk == groupPk;
    }).toList();
  }

  static Future<void> togglePause(String templateId, bool pause) async {
    final templates = _loadTemplates();
    final idx = templates.indexWhere((template) => template.templateId == templateId);
    if (idx == -1) return;
    templates[idx] = templates[idx].copyWith(paused: pause);
    await _persist(templates);
  }

  static Future<List<SharedExpenseEntry>> processDueTemplates({String? groupPk}) async {
    final templates = _loadTemplates();
    final now = DateTime.now();
    final List<SharedExpenseEntry> createdExpenses = [];
    bool changed = false;
    for (var i = 0; i < templates.length; i++) {
      final template = templates[i];
      if (groupPk != null && template.groupPk != groupPk) {
        continue;
      }
      if (template.paused || template.participants.isEmpty || template.amount <= 0) {
        continue;
      }
      if (template.nextRun.isAfter(now)) {
        continue;
      }
      final splits = template.customShares != null && template.customShares!.isNotEmpty
          ? SplitCalculator.calculateCustomSplit(
              template.customShares!,
              template.amount,
              allowAutoScale: true,
            )
          : SplitCalculator.calculateEqualSplit(template.amount, template.participants);
      final expense = await SharedExpenseOperations.addSharedExpense(
        groupPk: template.groupPk,
        title: template.title,
        amount: template.amount,
        paidBy: template.paidBy,
        splits: splits,
        currency: template.currency,
        categoryFk: template.categoryFk,
        description: 'Generated from recurring template',
      );
      createdExpenses.add(expense);
      final nextRun = _computeNextRun(template);
      templates[i] = template.copyWith(
        lastRun: now,
        nextRun: nextRun,
      );
      changed = true;
    }
    if (changed) {
      await _persist(templates);
    }
    return createdExpenses;
  }

  static DateTime _computeNextRun(RecurringGroupExpenseTemplate template) {
    switch (template.frequency) {
      case RecurringFrequency.weekly:
        return template.nextRun.add(const Duration(days: 7));
      case RecurringFrequency.monthly:
        final base = template.nextRun;
        final nextMonth = DateTime(base.year, base.month + 1, base.day);
        return nextMonth;
      case RecurringFrequency.custom:
        final days = template.customIntervalDays ?? 30;
        return template.nextRun.add(Duration(days: days));
    }
  }
}
