import 'package:budget/database/operations/group_operations.dart';
import 'package:budget/database/tables.dart';
import 'package:budget/services/recurring_group_expense_service.dart';
import 'package:budget/widgets/button.dart';
import 'package:budget/widgets/openSnackbar.dart';
import 'package:budget/widgets/textInput.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:budget/functions.dart';
import 'package:budget/struct/databaseGlobal.dart';
import 'package:intl/intl.dart';
import 'package:budget/struct/design_system.dart';

class RecurringTemplateSheet extends StatefulWidget {
  const RecurringTemplateSheet({super.key, required this.groupPk});

  final String groupPk;

  @override
  State<RecurringTemplateSheet> createState() => _RecurringTemplateSheetState();
}

class _RecurringTemplateSheetState extends State<RecurringTemplateSheet> {
  List<RecurringGroupExpenseTemplate> _templates = [];
  List<GroupMemberEntry> _members = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final members = await GroupOperations.fetchMembers(widget.groupPk);
    final templates = RecurringGroupExpenseService.listTemplates(groupPk: widget.groupPk);
    if (!mounted) return;
    setState(() {
      _members = members;
      _templates = templates;
      _loading = false;
    });
  }

  Future<void> _deleteTemplate(String templateId) async {
    await RecurringGroupExpenseService.deleteTemplate(templateId);
    _loadData();
    openSnackbar(
      SnackbarMessage(
        title: 'Template deleted',
        icon: Icons.delete_outline,
      ),
    );
  }

  Future<void> _togglePause(RecurringGroupExpenseTemplate template) async {
    await RecurringGroupExpenseService.togglePause(template.templateId, !template.paused);
    _loadData();
  }

  Future<void> _showAddDialog() async {
    final created = await showDialog<bool>(
      context: context,
      builder: (context) => _RecurringTemplateDialog(
        groupPk: widget.groupPk,
        members: _members,
      ),
    );
    if (created == true) {
      _loadData();
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
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Button(
            label: 'Add recurring expense',
            icon: Icons.add_circle_outline,
            onTap: _showAddDialog,
          ),
          const SizedBox(height: 16),
          if (_templates.isEmpty)
            Text(
              'No recurring templates yet. Create one to automate rent, utilities, or other repeating group costs.',
              style: Theme.of(context).textTheme.bodyMedium,
            )
          else
            ..._templates.map((template) {
            ..._templates.map((template) {
              return Container(
                margin: const EdgeInsets.only(bottom: 14),
                decoration: DesignSystem.effects.glassCard.copyWith(borderRadius: BorderRadius.circular(16)),
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            template.title,
                            style: DesignSystem.typography.title.copyWith(color: DesignSystem.colors.textPrimary),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            _buildSubtitle(template),
                            style: DesignSystem.typography.label.copyWith(color: DesignSystem.colors.textSecondary),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          tooltip: template.paused ? 'Resume' : 'Pause',
                          icon: Icon(template.paused ? Icons.play_arrow : Icons.pause, color: DesignSystem.colors.primary),
                          onPressed: () => _togglePause(template),
                        ),
                        IconButton(
                          tooltip: 'Delete',
                          icon: Icon(Icons.delete_outline, color: DesignSystem.colors.expense),
                          onPressed: () => _deleteTemplate(template.templateId),
                        )
                      ],
                    ),
                  ],
                ),
              );
            }),
            }),
        ],
      ),
    );
  }

  String _buildSubtitle(RecurringGroupExpenseTemplate template) {
    final buffer = StringBuffer();
    buffer.write(formatCurrencyWithName(template.amount, template.currency, alwaysShowSymbol: true));
    buffer.write(' • ');
    buffer.write(_describeFrequency(template));
    buffer.write('\nNext run: ');
    buffer.write(DateFormat.yMMMd().format(template.nextRun));
    return buffer.toString();
  }

  String _describeFrequency(RecurringGroupExpenseTemplate template) {
    switch (template.frequency) {
      case RecurringFrequency.weekly:
        return 'Weekly';
      case RecurringFrequency.monthly:
        return 'Monthly';
      case RecurringFrequency.custom:
        return 'Every ${template.customIntervalDays ?? 30} days';
    }
  }
}

class _RecurringTemplateDialog extends StatefulWidget {
  const _RecurringTemplateDialog({required this.groupPk, required this.members});

  final String groupPk;
  final List<GroupMemberEntry> members;

  @override
  State<_RecurringTemplateDialog> createState() => _RecurringTemplateDialogState();
}

class _RecurringTemplateDialogState extends State<_RecurringTemplateDialog> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _currencyController =
      TextEditingController(text: (appStateSettings['selectedCurrency'] ?? 'usd').toString());
  final TextEditingController _customDaysController = TextEditingController(text: '30');
  DateTime _nextRun = DateTime.now();
  RecurringFrequency _frequency = RecurringFrequency.monthly;
  String? _paidBy;
  final Set<String> _selectedMembers = {};
  bool _useCustomShares = false;
  final Map<String, TextEditingController> _shareControllers = {};
  bool _saving = false;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    _currencyController.dispose();
    _customDaysController.dispose();
    for (final controller in _shareControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      firstDate: DateTime.now().subtract(const Duration(days: 1)),
      lastDate: DateTime.now().add(const Duration(days: 365 * 5)),
      initialDate: _nextRun,
    );
    if (picked != null) {
      setState(() => _nextRun = picked);
    }
  }

  Future<void> _save() async {
    final title = _titleController.text.trim();
    final amount = double.tryParse(_amountController.text.replaceAll(',', '.')) ?? 0;
    if (title.isEmpty || amount <= 0) {
      openSnackbar(
        SnackbarMessage(
          title: 'Missing details',
          description: 'Enter a title and positive amount to continue.',
          icon: Icons.warning_amber_outlined,
        ),
      );
      return;
    }
    if (_selectedMembers.isEmpty) {
      openSnackbar(
        SnackbarMessage(
          title: 'Select members',
          description: 'Pick at least one participant.',
          icon: Icons.group_outlined,
        ),
      );
      return;
    }
    if (_paidBy == null) {
      openSnackbar(
        SnackbarMessage(
          title: 'Choose payer',
          description: 'Select who pays this recurring expense.',
          icon: Icons.person_outline,
        ),
      );
      return;
    }
    setState(() => _saving = true);
    final template = RecurringGroupExpenseTemplate(
      templateId: uuid.v4(),
      groupPk: widget.groupPk,
      title: title,
      amount: amount,
      currency: _currencyController.text.trim().isEmpty
          ? (appStateSettings['selectedCurrency'] ?? 'usd')
          : _currencyController.text.trim(),
      paidBy: _paidBy!,
      participants: _selectedMembers.toList(),
      frequency: _frequency,
      customIntervalDays:
          _frequency == RecurringFrequency.custom ? int.tryParse(_customDaysController.text) ?? 30 : null,
      categoryFk: null,
      customShares: _useCustomShares ? _buildCustomShares() : null,
      nextRun: _nextRun,
      lastRun: null,
      paused: false,
    );
    await RecurringGroupExpenseService.upsertTemplate(template);
    if (mounted) {
      setState(() => _saving = false);
      Navigator.pop(context, true);
      openSnackbar(
        SnackbarMessage(
          title: 'Recurring expense saved',
          icon: Icons.autorenew,
        ),
      );
    }
  }

  Map<String, double> _buildCustomShares() {
    final Map<String, double> shares = {};
    for (final member in _selectedMembers) {
      final controller = _shareControllers[member];
      final value = double.tryParse(controller?.text ?? '') ?? 0;
      if (value > 0) {
        shares[member] = value;
      }
    }
    return shares;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Recurring expense'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextInput(
              controller: _titleController,
              labelText: 'Title',
            ),
            const SizedBox(height: 12),
            TextInput(
              controller: _amountController,
              labelText: 'Amount',
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: 12),
            TextInput(
              controller: _currencyController,
              labelText: 'Currency',
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: _paidBy,
              isExpanded: true,
              hint: const Text('Paid by'),
              items: widget.members
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
              children: widget.members.map((member) {
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
            DropdownButtonFormField<RecurringFrequency>(
              value: _frequency,
              isExpanded: true,
              items: RecurringFrequency.values
                  .map((freq) => DropdownMenuItem(
                        value: freq,
                        child: Text(freq.name.capitalizeFirst),
                      ))
                  .toList(),
              onChanged: (value) => setState(() => _frequency = value ?? _frequency),
            ),
            if (_frequency == RecurringFrequency.custom) ...[
              const SizedBox(height: 8),
              TextInput(
                controller: _customDaysController,
                labelText: 'Custom interval (days)',
                keyboardType: TextInputType.number,
              ),
            ],
            const SizedBox(height: 12),
            ListTile(
              onTap: _pickDate,
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.calendar_month),
              title: Text('Next run on ${DateFormat.yMMMd().format(_nextRun)}'),
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Custom shares'),
              value: _useCustomShares,
              onChanged: (value) => setState(() => _useCustomShares = value),
            ),
            if (_useCustomShares)
              Column(
                children: _selectedMembers.map((member) {
                  _shareControllers.putIfAbsent(member, () => TextEditingController());
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: TextInput(
                      controller: _shareControllers[member],
                      labelText: 'Share for $member',
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    ),
                  );
                }).toList(),
              ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: _saving ? null : () => Navigator.pop(context),
          child: Text('cancel'.tr()),
        ),
        FilledButton(
          onPressed: _saving ? null : _save,
          child: _saving
              ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
              : const Text('Save'),
        ),
      ],
    );
  }
}
