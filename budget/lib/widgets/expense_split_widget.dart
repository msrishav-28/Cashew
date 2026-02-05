import 'package:budget/database/tables.dart';
import 'package:budget/functions/split_calculator.dart';
import 'package:budget/widgets/group_member_avatar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

enum ExpenseSplitMode { equal, customAmounts, percentages, shares }

/// Interactive widget that lets users pick how a shared expense should be split
/// across members. Emits normalized splits whenever inputs change.
class ExpenseSplitWidget extends StatefulWidget {
  const ExpenseSplitWidget({
    super.key,
    required this.members,
    required this.amountController,
    required this.onSplitsChanged,
    this.initialMode = ExpenseSplitMode.equal,
  });

  final List<GroupMemberEntry> members;
  final TextEditingController amountController;
  final ValueChanged<Map<String, double>> onSplitsChanged;
  final ExpenseSplitMode initialMode;

  @override
  State<ExpenseSplitWidget> createState() => _ExpenseSplitWidgetState();
}

class _ExpenseSplitWidgetState extends State<ExpenseSplitWidget> {
  late ExpenseSplitMode _mode;
  late Map<String, TextEditingController> _customControllers;
  late Map<String, TextEditingController> _percentageControllers;
  late Map<String, TextEditingController> _shareControllers;
  Map<String, double> _currentSplits = const {};
  String? _error;

  @override
  void initState() {
    super.initState();
    _mode = widget.initialMode;
    _initControllers();
    widget.amountController.addListener(_onAmountChanged);
    _recalculateSplits();
  }

  @override
  void didUpdateWidget(covariant ExpenseSplitWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!_sameMembers(oldWidget.members, widget.members)) {
      _disposeControllers();
      _initControllers();
      _recalculateSplits();
    }
  }

  @override
  void dispose() {
    widget.amountController.removeListener(_onAmountChanged);
    _disposeControllers();
    super.dispose();
  }

  bool _sameMembers(List<GroupMemberEntry> previous, List<GroupMemberEntry> next) {
    if (previous.length != next.length) return false;
    final prevEmails = previous.map((e) => e.userEmail).toSet();
    final nextEmails = next.map((e) => e.userEmail).toSet();
    return prevEmails.length == nextEmails.length && prevEmails.containsAll(nextEmails);
  }

  void _initControllers() {
    _customControllers = _buildControllers();
    _percentageControllers = _buildControllers(
      initialValueBuilder: (_) => _defaultPercentage(),
    );
    _shareControllers = _buildControllers(initialValueBuilder: (_) => '1');
  }

  Map<String, TextEditingController> _buildControllers({String Function(String email)? initialValueBuilder}) {
    final map = <String, TextEditingController>{};
    for (final member in widget.members) {
      final initialValue = initialValueBuilder?.call(member.userEmail) ?? '';
      final controller = TextEditingController(text: initialValue);
      controller.addListener(_recalculateSplits);
      map[member.userEmail] = controller;
    }
    return map;
  }

  void _disposeControllers() {
    for (final controller in _customControllers.values) {
      controller.removeListener(_recalculateSplits);
      controller.dispose();
    }
    for (final controller in _percentageControllers.values) {
      controller.removeListener(_recalculateSplits);
      controller.dispose();
    }
    for (final controller in _shareControllers.values) {
      controller.removeListener(_recalculateSplits);
      controller.dispose();
    }
  }

  String _defaultPercentage() {
    if (widget.members.isEmpty) return '';
    final share = (100 / widget.members.length).toStringAsFixed(2);
    return share;
  }

  void _onAmountChanged() {
    _recalculateSplits();
  }

  double _parsedAmount() {
    final raw = widget.amountController.text.replaceAll(',', '.');
    final parsed = double.tryParse(raw);
    return parsed == null || parsed <= 0 ? 0 : parsed;
  }

  Map<String, double> _buildRawSplits() {
    switch (_mode) {
      case ExpenseSplitMode.equal:
        final members = widget.members.map((m) => m.userEmail).toList();
        return SplitCalculator.calculateEqualSplit(_parsedAmount(), members);
      case ExpenseSplitMode.customAmounts:
        final map = <String, double>{};
        for (final member in widget.members) {
          final value = double.tryParse(
                (_customControllers[member.userEmail]?.text ?? '').replaceAll(',', '.'),
              ) ??
              0;
          if (value > 0) {
            map[member.userEmail] = value;
          }
        }
        return SplitCalculator.calculateCustomSplit(
          map,
          _parsedAmount(),
          allowAutoScale: true,
        );
      case ExpenseSplitMode.percentages:
        final map = <String, double>{};
        for (final member in widget.members) {
          final value = double.tryParse(
                (_percentageControllers[member.userEmail]?.text ?? '').replaceAll(',', '.'),
              ) ??
              0;
          if (value > 0) {
            map[member.userEmail] = value;
          }
        }
        return SplitCalculator.calculatePercentageSplit(_parsedAmount(), map);
      case ExpenseSplitMode.shares:
        final map = <String, int>{};
        for (final member in widget.members) {
          final value = int.tryParse(_shareControllers[member.userEmail]?.text ?? '');
          if (value != null && value > 0) {
            map[member.userEmail] = value;
          }
        }
        return SplitCalculator.calculateShareSplit(_parsedAmount(), map);
    }
  }

  void _recalculateSplits() {
    if (widget.members.isEmpty) {
      setState(() {
        _error = 'groups-no-members'.tr();
        _currentSplits = const {};
      });
      widget.onSplitsChanged(const {});
      return;
    }
    if (_parsedAmount() <= 0) {
      setState(() {
        _error = 'expense-amount-required'.tr();
        _currentSplits = const {};
      });
      widget.onSplitsChanged(const {});
      return;
    }

    try {
      final result = _buildRawSplits();
      setState(() {
        _currentSplits = result;
        _error = null;
      });
      widget.onSplitsChanged(result);
    } on SplitCalculationException catch (error) {
      setState(() {
        _error = error.message;
        _currentSplits = const {};
      });
      widget.onSplitsChanged(const {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'expense-split'.tr(),
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'expense-amount'.tr(),
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: ExpenseSplitMode.values.map((mode) {
            return ChoiceChip(
              label: Text(_labelForMode(mode)),
              selected: _mode == mode,
              onSelected: (_) {
                if (_mode != mode) {
                  setState(() => _mode = mode);
                  _recalculateSplits();
                }
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
        _buildModeFields(theme),
        if (_error != null) ...[
          const SizedBox(height: 12),
          Text(
            _error!,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.error,
            ),
          ),
        ],
        const SizedBox(height: 16),
        _SplitSummary(splits: _currentSplits, members: widget.members),
      ],
    );
  }

  Widget _buildModeFields(ThemeData theme) {
    switch (_mode) {
      case ExpenseSplitMode.equal:
        return _EqualSplitPreview(
          amount: _parsedAmount(),
          memberCount: widget.members.length,
        );
      case ExpenseSplitMode.customAmounts:
        return _MemberFieldList(
          members: widget.members,
          controllers: _customControllers,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          hint: '0.00',
          suffix: 'expense-amount'.tr(),
        );
      case ExpenseSplitMode.percentages:
        return _MemberFieldList(
          members: widget.members,
          controllers: _percentageControllers,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          hint: '0',
          suffix: '%',
        );
      case ExpenseSplitMode.shares:
        return _MemberFieldList(
          members: widget.members,
          controllers: _shareControllers,
          keyboardType: TextInputType.number,
          hint: '1',
          suffix: 'shares',
        );
    }
  }

  String _labelForMode(ExpenseSplitMode mode) {
    switch (mode) {
      case ExpenseSplitMode.equal:
        return 'Equal';
      case ExpenseSplitMode.customAmounts:
        return 'Amounts';
      case ExpenseSplitMode.percentages:
        return 'Percent';
      case ExpenseSplitMode.shares:
        return 'Shares';
    }
  }
}

class _EqualSplitPreview extends StatelessWidget {
  const _EqualSplitPreview({required this.amount, required this.memberCount});

  final double amount;
  final int memberCount;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (amount <= 0 || memberCount == 0) {
      return Text(
        'expense-amount-required'.tr(),
        style: theme.textTheme.bodyMedium,
      );
    }
    final share = amount / memberCount;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        'Split equally at ' + share.toStringAsFixed(2),
        style: theme.textTheme.bodyMedium,
      ),
    );
  }
}

class _MemberFieldList extends StatelessWidget {
  const _MemberFieldList({
    required this.members,
    required this.controllers,
    required this.keyboardType,
    required this.hint,
    required this.suffix,
  });

  final List<GroupMemberEntry> members;
  final Map<String, TextEditingController> controllers;
  final TextInputType keyboardType;
  final String hint;
  final String suffix;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: members.map((member) {
        final controller = controllers[member.userEmail]!;
        final displayName = member.userName.trim().isEmpty
            ? member.userEmail
            : member.userName.trim();
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Material(
            color: theme.colorScheme.surfaceVariant,
            borderRadius: BorderRadius.circular(18),
            child: ListTile(
              leading: GroupMemberAvatar(
                name: member.userName,
                email: member.userEmail,
                photoUrl: member.userPhotoUrl,
              ),
              title: Text(displayName),
              subtitle: Text(member.userEmail),
              trailing: SizedBox(
                width: 110,
                child: TextField(
                  controller: controller,
                  keyboardType: keyboardType,
                  decoration: InputDecoration(
                    hintText: hint,
                    suffixText: suffix,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _SplitSummary extends StatelessWidget {
  const _SplitSummary({required this.splits, required this.members});

  final Map<String, double> splits;
  final List<GroupMemberEntry> members;

  @override
  Widget build(BuildContext context) {
    if (splits.isEmpty) {
      return const SizedBox.shrink();
    }
    final memberNames = {
      for (final member in members)
        member.userEmail: member.userName.isNotEmpty ? member.userName : member.userEmail,
    };
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: splits.entries.map((entry) {
        final name = memberNames[entry.key] ?? entry.key;
        return Chip(
          label: Text('$name • ${entry.value.toStringAsFixed(2)}'),
        );
      }).toList(),
    );
  }
}
