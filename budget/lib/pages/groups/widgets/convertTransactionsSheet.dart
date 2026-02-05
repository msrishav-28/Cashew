import 'package:budget/database/operations/group_operations.dart';
import 'package:budget/database/tables.dart';
import 'package:budget/functions.dart';
import 'package:budget/services/transaction_conversion_service.dart';
import 'package:budget/struct/databaseGlobal.dart';
import 'package:budget/struct/settings.dart';
import 'package:budget/widgets/button.dart';
import 'package:budget/widgets/openSnackbar.dart';
import 'package:budget/widgets/textInput.dart';
import 'package:drift/drift.dart' show OrderingTerm;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ConvertTransactionsToSharedSheet extends StatefulWidget {
  const ConvertTransactionsToSharedSheet({super.key, required this.transactionPks});

  final List<String> transactionPks;

  @override
  State<ConvertTransactionsToSharedSheet> createState() => _ConvertTransactionsToSharedSheetState();
}

class _ConvertTransactionsToSharedSheetState extends State<ConvertTransactionsToSharedSheet> {
  List<Transaction> _transactions = [];
  List<GroupEntry> _groups = [];
  GroupEntry? _selectedGroup;
  List<GroupMemberEntry> _members = [];
  Set<String> _selectedMembers = {};
  String? _paidBy;
  bool _aggregate = false;
  ConversionSplitMode _splitMode = ConversionSplitMode.equal;
  final Map<String, TextEditingController> _shareControllers = {};
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  bool _loading = true;
  bool _submitting = false;

  double get _totalAmount => _transactions.fold<double>(
        0,
        (sum, transaction) => sum + (transaction.amount.abs()),
      );

  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _noteController.dispose();
    for (final controller in _shareControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> _loadInitialData() async {
    final transactions = await database.getTransactionsSortedFromPk(widget.transactionPks);
        final groups = await (database.select(database.groups)
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.dateCreated)])).get();
    if (!mounted) return;
    _selectedGroup = groups.isNotEmpty ? groups.first : null;
    setState(() {
      _transactions = transactions;
      _groups = groups;
    });
    if (_selectedGroup != null) {
      await _loadMembers(_selectedGroup!.groupPk);
    }
    if (mounted) setState(() => _loading = false);
  }

  Future<void> _loadMembers(String groupPk) async {
    final members = await GroupOperations.fetchMembers(groupPk);
    if (!mounted) return;
    setState(() {
      _members = members;
      _selectedMembers = members.map((member) => member.userEmail).toSet();
      GroupMemberEntry? payer;
      for (final member in members) {
        if (member.userEmail == appStateSettings['currentUserEmail']) {
          payer = member;
          break;
        }
      }
      final fallback = members.isNotEmpty ? members.first : null;
      _paidBy = (payer ?? fallback)?.userEmail;
    });
  }

  Map<String, double>? _buildCustomShares() {
    if (_splitMode != ConversionSplitMode.customShares) return null;
    final shares = <String, double>{};
    for (final email in _selectedMembers) {
      final controller = _shareControllers[email];
      final amount = double.tryParse(controller?.text ?? '');
      if (amount != null && amount > 0) {
        shares[email] = amount;
      }
    }
    return shares.isEmpty ? null : shares;
  }

  Future<void> _handleConvert() async {
    if (_selectedGroup == null) {
      openSnackbar(
        SnackbarMessage(
          title: 'Select group',
          description: 'Choose a group before converting.',
          icon: Icons.groups_2_outlined,
        ),
      );
      return;
    }
    if (_selectedMembers.isEmpty) {
      openSnackbar(
        SnackbarMessage(
          title: 'Add participants',
          description: 'Select at least one member to split the expense with.',
          icon: Icons.people_outline,
        ),
      );
      return;
    }
    setState(() => _submitting = true);
    try {
      final result = await TransactionConversionService.convertTransactions(
        groupPk: _selectedGroup!.groupPk,
        transactionPks: widget.transactionPks,
        paidBy: _paidBy ?? _selectedMembers.first,
        participantEmails: _selectedMembers.toList(),
        splitMode: _splitMode,
        customShares: _buildCustomShares(),
        aggregateIntoSingleExpense: _aggregate,
        aggregatedTitle: _aggregate ? _titleController.text.trim() : null,
        aggregatedDescription: _noteController.text.trim().isEmpty ? null : _noteController.text.trim(),
      );
      if (!mounted) return;
      Navigator.pop(context, true);
      openSnackbar(
        SnackbarMessage(
          title: 'Converted to shared expense',
          description: '${result.transactionCount} transactions, ${formatCurrencyWithName(result.totalConvertedAmount, null, alwaysShowSymbol: true)}',
          icon: Icons.handshake,
        ),
      );
    } catch (error) {
      openSnackbar(
        SnackbarMessage(
          title: 'Conversion failed',
          description: error.toString(),
          icon: Icons.error_outline,
        ),
      );
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Padding(
        padding: EdgeInsets.all(24.0),
        child: Center(child: CircularProgressIndicator()),
      );
    }
    if (_groups.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(24.0),
        child: Text(
          'Create a group first to convert transactions into shared expenses.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      );
    }
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Total selected: ${widget.transactionPks.length} transactions'),
          const SizedBox(height: 4),
          Text(
            formatCurrencyWithName(_totalAmount, null, alwaysShowSymbol: true),
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            value: _selectedGroup?.groupPk,
            decoration: const InputDecoration(labelText: 'Group'),
            items: _groups
                .map(
                  (group) => DropdownMenuItem(
                    value: group.groupPk,
                    child: Text(group.name),
                  ),
                )
                .toList(),
            onChanged: (value) async {
              final selected = _groups.firstWhere((group) => group.groupPk == value);
              setState(() => _selectedGroup = selected);
              await _loadMembers(selected.groupPk);
            },
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            value: _paidBy,
            decoration: const InputDecoration(labelText: 'Paid by'),
            items: _members
                .map((member) => DropdownMenuItem(
                      value: member.userEmail,
                      child: Text(member.userName.isEmpty ? member.userEmail : member.userName),
                    ))
                .toList(),
            onChanged: (value) => setState(() => _paidBy = value),
          ),
          const SizedBox(height: 12),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text('Participants', style: Theme.of(context).textTheme.bodyMedium),
          ),
          Wrap(
            spacing: 8,
            children: _members.map((member) {
              final selected = _selectedMembers.contains(member.userEmail);
              return FilterChip(
                label: Text(member.userName.isEmpty ? member.userEmail : member.userName),
                selected: selected,
                onSelected: (value) {
                  setState(() {
                    if (value) {
                      _selectedMembers.add(member.userEmail);
                      _shareControllers.putIfAbsent(member.userEmail, () => TextEditingController());
                    } else {
                      _selectedMembers.remove(member.userEmail);
                    }
                  });
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 12),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            value: _aggregate,
            onChanged: (value) => setState(() => _aggregate = value),
            title: const Text('Merge into a single shared expense'),
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<ConversionSplitMode>(
            value: _splitMode,
            decoration: const InputDecoration(labelText: 'Split method'),
            items: ConversionSplitMode.values
                .map(
                  (mode) => DropdownMenuItem(
                    value: mode,
                    child: Text(mode == ConversionSplitMode.equal ? 'Equal split' : 'Custom shares'),
                  ),
                )
                .toList(),
            onChanged: (value) => setState(() => _splitMode = value ?? ConversionSplitMode.equal),
          ),
          if (_splitMode == ConversionSplitMode.customShares) ...[
            const SizedBox(height: 8),
            ..._selectedMembers.map((email) {
              _shareControllers.putIfAbsent(email, () => TextEditingController());
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextInput(
                  controller: _shareControllers[email],
                  labelText: 'Share for $email',
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                ),
              );
            }),
          ],
          if (_aggregate) ...[
            const SizedBox(height: 8),
            TextInput(
              controller: _titleController,
              labelText: 'Expense title',
            ),
            const SizedBox(height: 8),
            TextInput(
              controller: _noteController,
              labelText: 'Note',
              maxLines: 2,
            ),
          ],
          const SizedBox(height: 16),
          ExpansionTile(
            title: const Text('Selected transactions'),
            children: _transactions.map((transaction) {
              return ListTile(
                title: Text(transaction.name.trim().isEmpty ? 'Transaction' : transaction.name),
                subtitle: Text(DateFormat.yMMMd().format(transaction.dateCreated)),
                trailing: Text(formatCurrencyWithName(transaction.amount.abs(), null, alwaysShowSymbol: true)),
              );
            }).toList(),
          ),
          const SizedBox(height: 24),
          Button(
            label: 'Convert to shared expense',
            icon: Icons.groups_2_outlined,
            isLoading: _submitting,
            onTap: _submitting ? null : _handleConvert,
          ),
        ],
      ),
    );
  }
}
