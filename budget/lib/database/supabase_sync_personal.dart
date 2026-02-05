import 'package:budget/database/supabase_manager.dart';
import 'package:budget/database/tables.dart';
import 'package:budget/struct/databaseGlobal.dart';
import 'package:budget/struct/settings.dart';
import 'package:budget/widgets/globalSnackbar.dart';
import 'package:budget/widgets/navigationFramework.dart';
import 'package:budget/widgets/openSnackbar.dart';
import 'package:flutter/widgets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:drift/drift.dart'; // For Insertable
import 'dart:convert';

/// Migrates all local data to Supabase
/// This is a one-way sync for migration purposes.
Future<bool> uploadLocalDataToSupabase() async {
  try {
    final user = SupabaseManager().client.auth.currentUser;
    if (user == null) {
      openSnackbar(SnackbarMessage(title: "Please sign in to Supabase first."));
      return false;
    }
    final String userId = user.id;

    // Helper to upload a list of data
    Future<void> uploadTable<T>(String tableName, List<dynamic> items,
        Map<String, dynamic> Function(dynamic) mapper) async {
      if (items.isEmpty) return;

      const int batchSize = 100;
      for (var i = 0; i < items.length; i += batchSize) {
        var end = (i + batchSize < items.length) ? i + batchSize : items.length;
        var batch = items.sublist(i, end).map((item) {
          try {
            return mapper(item);
          } catch (e) {
            print("Error mapping item for $tableName: $e");
            return null;
          }
        }).where((element) => element != null).cast<Map<String, dynamic>>().toList();

        if (batch.isNotEmpty) {
           await SupabaseManager().client.from(tableName).upsert(batch);
        }
      }
    }

    // 1. Wallets
    List<TransactionWallet> wallets = await database.getAllWallets();
    await uploadTable('wallets', wallets, (item) {
       item = item as TransactionWallet;
       return {
      'wallet_pk': item.walletPk,
      'user_id': userId,
      'name': item.name,
      'colour': item.colour,
      'icon_name': item.iconName,
      'date_created': item.dateCreated.toIso8601String(),
      'date_time_modified': item.dateTimeModified?.toIso8601String(),
      'order': item.order,
      'currency': item.currency,
      'currency_format': item.currencyFormat,
      'decimals': item.decimals,
      // Convert list enums to JSON string if needed, depending on how converters work. 
      // Drift usually exposes the converted type. We typically store JSON string in TEXT columns.
      'home_page_widget_display': jsonEncode(item.homePageWidgetDisplay.map((e) => e.index).toList()),
    };});

    // 2. Categories
    List<TransactionCategory> categories = await database.getAllCategories();
    await uploadTable('categories', categories, (item) { 
        item = item as TransactionCategory;
        return {
      'category_pk': item.categoryPk,
      'user_id': userId,
      'name': item.name,
      'colour': item.colour,
      'icon_name': item.iconName,
      'emoji_icon_name': item.emojiIconName,
      'date_created': item.dateCreated.toIso8601String(),
      'date_time_modified': item.dateTimeModified?.toIso8601String(),
      'order': item.order,
      'income': item.income,
      'method_added': item.methodAdded?.index,
      'main_category_pk': item.mainCategoryPk,
    };});

    // 3. Transactions
    List<Transaction> transactions = await database.getAllTransactions();
    await uploadTable('transactions', transactions, (item) {
        item = item as Transaction;
        return {
      'transaction_pk': item.transactionPk,
      'user_id': userId,
      'name': item.name,
      'amount': item.amount,
      'note': item.note,
      'category_fk': item.categoryFk,
      'sub_category_fk': item.subCategoryFk,
      'wallet_fk': item.walletFk,
      'date_created': item.dateCreated.toIso8601String(),
      'date_time_modified': item.dateTimeModified?.toIso8601String(),
      'original_date_due': item.originalDateDue?.toIso8601String(),
      'income': item.income,
      'period_length': item.periodLength,
      'reoccurrence': item.reoccurrence?.index,
      'end_date': item.endDate?.toIso8601String(),
      'upcoming_transaction_notification': item.upcomingTransactionNotification,
      'type': item.type?.index,
      'paid': item.paid,
      'created_another_future_transaction': item.createdAnotherFutureTransaction,
      'skip_paid': item.skipPaid,
      'method_added': item.methodAdded?.index,
      'transaction_owner_email': item.transactionOwnerEmail,
      // 'shared_key': item.sharedKey, // We might not migrate legacy shared keys, or keep them for reference
      // 'shared_status': item.sharedStatus?.index,
    };});

    // 4. Budgets
    List<Budget> budgets = await database.getAllBudgets();
    await uploadTable('budgets', budgets, (item) {
        item = item as Budget;
        return {
      'budget_pk': item.budgetPk,
      'user_id': userId,
      'name': item.name,
      'amount': item.amount,
      'colour': item.colour,
      'start_date': item.startDate.toIso8601String(),
      'end_date': item.endDate.toIso8601String(),
      'wallet_fks': jsonEncode(item.walletFks),
      'category_fks': jsonEncode(item.categoryFks),
      'category_fks_exclude': jsonEncode(item.categoryFksExclude),
      'period_length': item.periodLength,
      'reoccurrence': item.reoccurrence?.index,
      'date_created': item.dateCreated.toIso8601String(),
      'date_time_modified': item.dateTimeModified?.toIso8601String(),
      'pinned': item.pinned,
      'order': item.order,
      'wallet_fk': item.walletFk,
      'income': item.income,
      'archived': item.archived,
      'added_transactions_only': item.addedTransactionsOnly,
      'is_absolute_spending_limit': item.isAbsoluteSpendingLimit,
    };});

    // 5. Objectives
    List<Objective> objectives = await database.getAllObjectives();
    await uploadTable('objectives', objectives, (item) {
        item = item as Objective;
        return {
      'objective_pk': item.objectivePk,
      'user_id': userId,
      'type': item.type.index,
      'name': item.name,
      'amount': item.amount,
      'order': item.order,
      'colour': item.colour,
      'date_created': item.dateCreated.toIso8601String(),
      'end_date': item.endDate?.toIso8601String(),
      'date_time_modified': item.dateTimeModified?.toIso8601String(),
      'icon_name': item.iconName,
      'emoji_icon_name': item.emojiIconName,
      'income': item.income,
      'pinned': item.pinned,
      'archived': item.archived,
      'wallet_fk': item.walletFk,
    };});

    // 6. Scanner Templates
    List<ScannerTemplate> templates = await database.getAllScannerTemplates();
    await uploadTable('scanner_templates', templates, (item) {
        item = item as ScannerTemplate;
        return {
      'scanner_template_pk': item.scannerTemplatePk,
      'user_id': userId,
      'date_created': item.dateCreated.toIso8601String(),
      'date_time_modified': item.dateTimeModified?.toIso8601String(),
      'template_name': item.templateName,
      'contains': item.contains,
      'title_transaction_before': item.titleTransactionBefore,
      'title_transaction_after': item.titleTransactionAfter,
      'amount_transaction_before': item.amountTransactionBefore,
      'amount_transaction_after': item.amountTransactionAfter,
      'default_category_fk': item.defaultCategoryFk,
      'wallet_fk': item.walletFk,
      'ignore': item.ignore,
    };});

    // 7. Associated Titles (Smart mapping)
    List<TransactionAssociatedTitle> associatedTitles = await database.getAllAssociatedTitles();
    await uploadTable('associated_titles', associatedTitles, (item) {
        item = item as TransactionAssociatedTitle;
        return {
      'associated_title_pk': item.associatedTitlePk,
      'user_id': userId,
      'category_fk': item.categoryFk,
      'title': item.title,
      'date_created': item.dateCreated.toIso8601String(),
      'date_time_modified': item.dateTimeModified?.toIso8601String(),
      'order': item.order,
      'is_exact_match': item.isExactMatch,
    };});

    // 8. Category Budget Limits
    List<CategoryBudgetLimit> categoryLimits = await database.getAllCategoryBudgetLimits();
    await uploadTable('category_budget_limits', categoryLimits, (item) {
        item = item as CategoryBudgetLimit;
        return {
      'category_limit_pk': item.categoryLimitPk,
      'user_id': userId,
      'category_fk': item.categoryFk,
      'budget_fk': item.budgetFk,
      'amount': item.amount,
      'date_time_modified': item.dateTimeModified?.toIso8601String(),
      'wallet_fk': item.walletFk,
    };});

    openSnackbar(SnackbarMessage(
      title: "Migration Complete!", 
      description: "Your local data has been uploaded to Supabase.",
      icon: Icons.check_circle_rounded,
    ));
    return true;

  } catch (e) {
    print("Migration Error: $e");
    openSnackbar(SnackbarMessage(
      title: "Migration Failed", 
      description: e.toString(),
      icon: Icons.error_rounded,
    ));
    return false;
  }
}


// Basic Sync Implementation (Add/Update only for MVP)
Future<bool> syncPersonalData() async {
  try {
    final user = SupabaseManager().client.auth.currentUser;
    if (user == null) return false;

    final String lastSyncedString = appStateSettings["lastSynced"] ?? DateTime(2000).toIso8601String();
    final DateTime lastSynced = DateTime.parse(lastSyncedString);
    final DateTime now = DateTime.now();

    print("Syncing Data... Last Synced: $lastSynced");

    // 1. Wallets
    await _syncTable<Wallet>(
      table: database.wallets, 
      supabaseTable: 'wallets', 
      lastSynced: lastSynced,
      toMap: (item) => {
        'wallet_pk': item.walletPk,
        'name': item.name,
        'amount': item.amount,
        'currency': item.currency,
        'colour': item.colour,
        'icon_name': item.iconName,
        'date_created': item.dateCreated.toIso8601String(),
        'datetime_modified': item.dateTimeModified?.toIso8601String(),
        'order': item.order,
        'user_id': user.id,
      },
      fromMap: (map) => Wallet(
        walletPk: map['wallet_pk'],
        name: map['name'],
        amount: (map['amount'] as num).toDouble(),
        currency: map['currency'],
        colour: map['colour'],
        iconName: map['icon_name'],
        dateCreated: DateTime.parse(map['date_created']),
        dateTimeModified: map['datetime_modified'] != null ? DateTime.parse(map['datetime_modified']) : null,
        order: map['order'],
        decimals: 2, // Default
      ),
      tableIdField: 'wallet_pk',
    );

    // 2. Categories
    await _syncTable<TransactionCategory>(
      table: database.categories,
      supabaseTable: 'categories',
      lastSynced: lastSynced,
      toMap: (item) => {
        'category_pk': item.categoryPk,
        'name': item.name,
        'colour': item.colour,
        'icon_name': item.iconName,
        'emoji_icon_name': item.emojiIconName,
        'income': item.income,
        'order': item.order,
        'date_created': item.dateCreated.toIso8601String(),
        'datetime_modified': item.dateTimeModified?.toIso8601String(),
        'user_id': user.id,
        'main_category_pk': item.mainCategoryPk,
      },
      fromMap: (map) => TransactionCategory(
        categoryPk: map['category_pk'],
        name: map['name'],
        colour: map['colour'],
        iconName: map['icon_name'],
        emojiIconName: map['emoji_icon_name'],
        income: map['income'] ?? false,
        order: map['order'],
        dateCreated: DateTime.parse(map['date_created']),
        dateTimeModified: map['datetime_modified'] != null ? DateTime.parse(map['datetime_modified']) : null,
        mainCategoryPk: map['main_category_pk'],
      ),
      tableIdField: 'category_pk',
    );

    // 3. Transactions
    await _syncTable<Transaction>(
      table: database.transactions,
      supabaseTable: 'transactions',
      lastSynced: lastSynced,
      toMap: (item) => {
        'transaction_pk': item.transactionPk,
        'name': item.name,
        'amount': item.amount,
        'note': item.note,
        'category_fk': item.categoryFk,
        'wallet_fk': item.walletFk,
        'date_created': item.dateCreated.toIso8601String(),
        'datetime_modified': item.dateTimeModified?.toIso8601String(),
        'income': item.income,
        'paid': item.paid,
        'skip_paid': item.skipPaid,
        'user_id': user.id,
      },
      fromMap: (map) => Transaction(
        transactionPk: map['transaction_pk'],
        name: map['name'],
        amount: (map['amount'] as num).toDouble(),
        note: map['note'],
        categoryFk: map['category_fk'],
        walletFk: map['wallet_fk'],
        dateCreated: DateTime.parse(map['date_created']),
        dateTimeModified: map['datetime_modified'] != null ? DateTime.parse(map['datetime_modified']) : null,
        income: map['income'] ?? false,
        paid: map['paid'] ?? false,
        skipPaid: map['skip_paid'] ?? false,
      ),
      tableIdField: 'transaction_pk',
    );

    // 4. Budgets
    await _syncTable<Budget>(
      table: database.budgets,
      supabaseTable: 'budgets',
      lastSynced: lastSynced,
      toMap: (item) => {
        'budget_pk': item.budgetPk,
        'name': item.name,
        'amount': item.amount,
        'start_date': item.startDate.toIso8601String(),
        'end_date': item.endDate.toIso8601String(),
        'date_created': item.dateCreated.toIso8601String(),
        'datetime_modified': item.dateTimeModified?.toIso8601String(),
        'user_id': user.id,
        'wallet_fk': item.walletFk,
        // ... mapped fields
      },
      fromMap: (map) => Budget(
        budgetPk: map['budget_pk'],
        name: map['name'],
        amount: (map['amount'] as num).toDouble(),
        startDate: DateTime.parse(map['start_date']),
        endDate: DateTime.parse(map['end_date']),
        dateCreated: DateTime.parse(map['date_created']),
        dateTimeModified: map['datetime_modified'] != null ? DateTime.parse(map['datetime_modified']) : null,
        walletFk: map['wallet_fk'],
        order: 0,
        periodLength: 1, // details omitted for brevity in MVP
        reoccurrence: null,
      ),
      tableIdField: 'budget_pk',
    );

    // 5. Goals (Objectives)
    await _syncTable<Objective>(
      table: database.objectives,
      supabaseTable: 'objectives',
      lastSynced: lastSynced,
      toMap: (item) => {
         'objective_pk': item.objectivePk,
         'name': item.name,
         'amount': item.amount,
         'order': item.order,
         'date_created': item.dateCreated.toIso8601String(),
         'datetime_modified': item.dateTimeModified?.toIso8601String(),
         'user_id': user.id,
      },
      fromMap: (map) => Objective(
        objectivePk: map['objective_pk'],
        name: map['name'],
        amount: (map['amount'] as num).toDouble(),
        order: map['order'],
        dateCreated: DateTime.parse(map['date_created']),
        dateTimeModified: map['datetime_modified'] != null ? DateTime.parse(map['datetime_modified']) : null,
        pinned: true,
        archived: false,
        income: false,
        type: ObjectiveType.goal,
      ),
      tableIdField: 'objective_pk',
    );

    // Update lastSynced
    updateSettings("lastSynced", now.toIso8601String(), updateGlobalState: false);

    return true;

  } catch (e) {
    print("Error during sync: $e");
    return false;
  }
}

// Generic Sync Helper
Future<void> _syncTable<T>({
  required var table, // Drift TableInfo
  required String supabaseTable,
  required DateTime lastSynced,
  required Map<String, dynamic> Function(T) toMap,
  required T Function(Map<String, dynamic>) fromMap,
  required String tableIdField,
}) async {
  final client = SupabaseManager().client;
  final user = client.auth.currentUser;
  if (user == null) return;

  // UPLOAD: Local -> Cloud
  // Assuming 'table' supports get() and having(dateTimeModified > lastSynced)
  // Since I can't easily query Generic Table with Drift without code generation helpers usually,
  // I will use 'database.select(table)' and filter in Dart for now to avoid complexity with Drift's Expression classes.
  // Ideally: (database.select(table)..where((t) => t.dateTimeModified.isBiggerThanValue(lastSynced))).get();
  
  final allLocal = await database.select(table as TableInfo).get();
  final localChanges = allLocal.where((item) {
    try {
      final mod = (item as dynamic).dateTimeModified as DateTime?;
      return mod != null && mod.isAfter(lastSynced);
    } catch (_) { return false; }
  }).toList();

  if (localChanges.isNotEmpty) {
      final List<Map<String, dynamic>> records = localChanges.map((item) => toMap(item)).toList();
      await client.from(supabaseTable).upsert(records);
      print("Uploaded ${records.length} to $supabaseTable");
  }

  // DOWNLOAD: Cloud -> Local
  final remoteChanges = await client
      .from(supabaseTable)
      .select()
      .gt('datetime_modified', lastSynced.toIso8601String());

  if (remoteChanges.isNotEmpty) {
    final List<dynamic> rows = remoteChanges as List<dynamic>;
    for (var row in rows) {
       final item = fromMap(row as Map<String, dynamic>);
       // Upsert to Drift
       await database.into(table as TableInfo).insertOnConflictUpdate(item as Insertable);
    }
    print("Downloaded ${rows.length} from $supabaseTable");
  }
}

Future<bool> createSyncBackup({bool changeMadeSync = false}) async {
  // Trigger sync
  // throttling to avoid too many calls?
  // For now direct call.
  return await syncPersonalData();
}
