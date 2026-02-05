import 'package:budget/colors.dart';
import 'package:budget/database/operations/shared_expense_operations.dart';
import 'package:budget/database/tables.dart';
import 'package:budget/functions.dart';
import 'package:budget/functions/split_calculator.dart';
import 'package:budget/struct/currencyFunctions.dart';
import 'package:budget/struct/databaseGlobal.dart';
import 'package:budget/struct/settings.dart';
import 'package:budget/struct/design_system.dart';
import 'package:budget/widgets/button.dart';
import 'package:budget/widgets/expense_split_widget.dart';
import 'package:budget/widgets/framework/pageFramework.dart';
import 'package:budget/widgets/framework/popupFramework.dart';
import 'package:budget/widgets/globalSnackbar.dart';
import 'package:budget/widgets/group_member_avatar.dart';
import 'package:budget/widgets/noResults.dart';
import 'package:budget/widgets/openBottomSheet.dart';
import 'package:budget/widgets/openPopup.dart';
import 'package:budget/widgets/tappable.dart';
import 'package:budget/widgets/textInput.dart';
import 'package:budget/widgets/textWidgets.dart';
import 'package:budget/widgets/saveBottomButton.dart';
import 'package:budget/widgets/openSnackbar.dart';
import 'package:drift/drift.dart' show OrderingTerm;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AddSharedExpensePage extends StatefulWidget {
  const AddSharedExpensePage({required this.groupPk, Key? key})
      : super(key: key);
  final String groupPk;

  @override
  State<AddSharedExpensePage> createState() => _AddSharedExpensePageState();
}

class _AddSharedExpensePageState extends State<AddSharedExpensePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _paidByController = TextEditingController();
  Map<String, double> _currentSplits = const {};
  ExpenseSplitMode _splitMode = ExpenseSplitMode.equal;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    _descriptionController.dispose();
    _paidByController.dispose();
    super.dispose();
  }

  void _openPayerSheet(List<GroupMemberEntry> members) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return PopupFramework(
          title: "expense-paid-by".tr(),
          child: Column(
            children: members.map((member) {
              final email = member.userEmail;
              final displayName =
                  member.userName.isNotEmpty ? member.userName : email;
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Tappable(
                  color: Theme.of(context).colorScheme.surfaceVariant,
                  borderRadius: 16,
                  onTap: () {
                    setState(() {
                      _paidByController.text = email;
                    });
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        GroupMemberAvatar(
                          name: member.userName,
                          email: member.userEmail,
                          photoUrl: member.userPhotoUrl,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(displayName,
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                              if (displayName != email)
                                Text(email,
                                    style:
                                        Theme.of(context).textTheme.bodySmall),
                            ],
                          ),
                        ),
                        if (_paidByController.text == email)
                          Icon(Icons.check_circle,
                              color: Theme.of(context).colorScheme.primary),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }

  void _openSplitSheet(List<GroupMemberEntry> members) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            return DraggableScrollableSheet(
              initialChildSize: 0.7,
              minChildSize: 0.5,
              maxChildSize: 0.9,
              expand: false,
              builder: (context, scrollController) {
                return PopupFramework(
                  title: "expense-split".tr(),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: ExpenseSplitWidget(
                      members: members,
                      amountController: _amountController,
                      initialMode: _splitMode,
                      onSplitsChanged: (splits) {
                        setState(() {
                          _currentSplits = splits;
                        });
                      },
                      onModeChanged: (mode) {
                        setState(() {
                          _splitMode = mode;
                        });
                      },
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageFramework(
      title: "add-shared-expense".tr(),
      backButton: true,
      resizeToAvoidBottomInset: true,
      slivers: [
        SliverToBoxAdapter(
          child: StreamBuilder<List<GroupMemberEntry>>(
            stream: (database.select(database.groupMembers)
                  ..where((tbl) => tbl.groupFk.equals(widget.groupPk))
                  ..orderBy([(tbl) => OrderingTerm.asc(tbl.userName)]))
                .watch(),
            builder: (context, snapshot) {
              final members = snapshot.data ?? [];
              if (members.isNotEmpty && _paidByController.text.isEmpty) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (mounted && _paidByController.text.isEmpty) {
                    setState(() {
                      _paidByController.text = appStateSettings["userEmail"] ??
                          members.first.userEmail;
                      // Fallback if current user not in group (unlikely)
                      if (!members.any(
                          (m) => m.userEmail == _paidByController.text)) {
                        _paidByController.text = members.first.userEmail;
                      }
                    });
                  }
                });
              }

              return Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      // Big Amount Input
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: IntrinsicWidth(
                          child: TextField(
                            controller: _amountController,
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            textAlign: TextAlign.center,
                            style: DesignSystem.typography.headerHero.copyWith(
                              color: DesignSystem.colors.primary,
                              shadows: [
                                Shadow(
                                  color: DesignSystem.colors.primary.withOpacity(0.5),
                                  blurRadius: 20,
                                ),
                              ],
                            ),
                            decoration: InputDecoration(
                              hintText: '0',
                              border: InputBorder.none,
                              prefixText: Provider.of<AllWallets>(context)
                                      .indexedByPk[
                                          appStateSettings["selectedWalletPk"]]
                                      ?.currency
                                      .toString()
                                      .toUpperCase() ??
                                  "\$",
                              prefixStyle: DesignSystem.typography.header1.copyWith(
                                color: DesignSystem.colors.textSecondary,
                              ),
                            ),
                            onChanged: (_) => setState(() {}),
                          ),
                        ),
                      ),
                      // Title
                      TextInput(
                        controller: _titleController,
                        labelText: "expense-title".tr(),
                        icon: Icons.title,
                        textCapitalization: TextCapitalization.sentences,
                        validator: (value) => value == null || value.isEmpty
                            ? "expense-title-required".tr()
                            : null,
                      ),
                      const SizedBox(height: 16),
                      // Description
                      TextInput(
                        controller: _descriptionController,
                        labelText: "expense-description".tr(),
                        icon: Icons.notes,
                        textCapitalization: TextCapitalization.sentences,
                        maxLines: 2,
                      ),
                      const SizedBox(height: 24),
                      if (members.isNotEmpty)
                        _SplitDetailsCard(
                          payerEmail: _paidByController.text,
                          splitMode: _splitMode,
                          members: members,
                          onPayerTap: () => _openPayerSheet(members),
                          onSplitTap: () => _openSplitSheet(members),
                        ),
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
      staticOverlay: Align(
        alignment: AlignmentDirectional.bottomCenter,
        child: SaveBottomButton(
          label: "save".tr(),
          onTap: () async {
            await _handleSave(context);
          },
        ),
      ),
    );
  }

  Future<void> _handleSave(BuildContext context) async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    final payer = _paidByController.text;
    if (payer.isEmpty) {
      openSnackbar(SnackbarMessage(title: "expense-payer-required".tr()));
      return;
    }

    final parsedAmount =
        double.tryParse(_amountController.text.replaceAll(",", "."));
    if (parsedAmount == null || parsedAmount <= 0) {
      openSnackbar(SnackbarMessage(title: "expense-amount-invalid".tr()));
      return;
    }

    try {
      final members = await (database.select(database.groupMembers)
            ..where((tbl) => tbl.groupFk.equals(widget.groupPk)))
          .get();
      final memberEmailList =
          members.map((member) => member.userEmail).toList();
      final memberEmails = memberEmailList.toSet();

      var filteredSplits = Map<String, double>.fromEntries(
        _currentSplits.entries.where(
          (entry) => memberEmails.contains(entry.key) && entry.value > 0,
        ),
      );

      // Default to equal split if no splits defined or relevant
      if (filteredSplits.isEmpty && _splitMode == ExpenseSplitMode.equal) {
        filteredSplits = SplitCalculator.calculateEqualSplit(
          parsedAmount,
          memberEmailList,
        );
      } else if (filteredSplits.isEmpty) {
        // If custom mode but empty, likely user didn't open the sheet. Default to equal.
        filteredSplits = SplitCalculator.calculateEqualSplit(
            parsedAmount, memberEmailList);
      }

      await SharedExpenseOperations.addSharedExpense(
        groupPk: widget.groupPk,
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim().isEmpty
            ? null
            : _descriptionController.text.trim(),
        amount: parsedAmount,
        paidBy: payer,
        splits: filteredSplits,
      );

      if (mounted) {
        HapticFeedback.heavyImpact();
        Navigator.pop(context);
        openSnackbar(SnackbarMessage(
            title: "expense-added".tr(),
            icon: Icons.check_circle_outline));
      }
    } catch (e) {
      openPopup(context,
          title: "Error",
          description: e.toString(),
          onSubmitLabel: "ok".tr(),
          onSubmit: () => Navigator.pop(context));
    }
  }
}

class _SplitDetailsCard extends StatelessWidget {
  const _SplitDetailsCard({
    required this.payerEmail,
    required this.splitMode,
    required this.members,
    required this.onPayerTap,
    required this.onSplitTap,
  });

  final String payerEmail;
  final ExpenseSplitMode splitMode;
  final List<GroupMemberEntry> members;
  final VoidCallback onPayerTap;
  final VoidCallback onSplitTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final payer = members.firstWhere(
      (m) => m.userEmail == payerEmail,
      orElse: () => GroupMemberEntry(
          memberPk: "",
          groupFk: "",
          userEmail: payerEmail,
          userName: payerEmail,
          dateJoined: DateTime.now(),
          isActive: true),
    );

    String splitInfo = "";
    switch (splitMode) {
      case ExpenseSplitMode.equal:
        splitInfo = "split-equally".tr();
        break;
      case ExpenseSplitMode.percentages:
        splitInfo = "split-by-percentage".tr();
        break;
      case ExpenseSplitMode.shares:
        splitInfo = "split-by-shares".tr();
        break;
      case ExpenseSplitMode.customAmounts:
        splitInfo = "split-unequally".tr();
        break;
    }

    return Container(
      decoration: DesignSystem.effects.glassCard.copyWith(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: DesignSystem.colors.glassHeavy),
      ),
      child: Column(
        children: [
          Tappable(
            onTap: () {
              HapticFeedback.lightImpact();
              onPayerTap();
            },
            borderRadius: 20,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  const Icon(Icons.person_outline_rounded),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Paid by", style: theme.textTheme.bodySmall),
                        Text(
                          payer.userName.isNotEmpty ? payer.userName : payerEmail,
                          style: DesignSystem.typography.title.copyWith(
                            color: DesignSystem.colors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.keyboard_arrow_down_rounded),
                ],
              ),
            ),
          ),
          Divider(height: 1, color: theme.colorScheme.outlineVariant),
          Tappable(
            onTap: () {
              HapticFeedback.lightImpact();
              onSplitTap();
            },
            borderRadius: 20,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  const Icon(Icons.call_split_rounded),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Split", style: theme.textTheme.bodySmall),
                        Text(
                          splitInfo,
                          style: DesignSystem.typography.title.copyWith(
                            color: DesignSystem.colors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.keyboard_arrow_down_rounded),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
