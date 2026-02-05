import 'package:budget/database/operations/settlement_operations.dart';
import 'package:budget/database/tables.dart';
import 'package:budget/struct/databaseGlobal.dart';
import 'package:budget/struct/settings.dart';
import 'package:budget/widgets/framework/pageFramework.dart';
import 'package:budget/widgets/globalSnackbar.dart';
import 'package:budget/widgets/openSnackbar.dart';
import 'package:budget/widgets/noResults.dart';
import 'package:budget/widgets/textInput.dart';
import 'package:drift/drift.dart' show OrderingTerm;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SettleUpPage extends StatefulWidget {
  const SettleUpPage({required this.groupPk, Key? key}) : super(key: key);
  final String groupPk;

  @override
  State<SettleUpPage> createState() => _SettleUpPageState();
}

class _SettleUpPageState extends State<SettleUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _amountController = TextEditingController();
  String? _payerEmail;
  String? _receiverEmail;

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageFramework(
      title: "settle-up".tr(),
      backButton: true,
      slivers: [
        SliverPadding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 16),
          sliver: SliverToBoxAdapter(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "settle-select-participants".tr(),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _ParticipantSelector(
                    label: "settle-from".tr(),
                    groupPk: widget.groupPk,
                    currentValue: _payerEmail,
                    onChanged: (value) {
                      setState(() => _payerEmail = value);
                    },
                  ),
                  const SizedBox(height: 16),
                  _ParticipantSelector(
                    label: "settle-to".tr(),
                    groupPk: widget.groupPk,
                    currentValue: _receiverEmail,
                    onChanged: (value) {
                      setState(() => _receiverEmail = value);
                    },
                  ),
                  const SizedBox(height: 24),
                  TextInput(
                    controller: _amountController,
                    labelText: "settle-amount".tr(),
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "settle-amount-required".tr();
                      }
                      final parsed = double.tryParse(value.replaceAll(",", "."));
                      if (parsed == null || parsed <= 0) {
                        return "settle-amount-invalid".tr();
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: _SettleUpButton(
                      formKey: _formKey,
                      groupPk: widget.groupPk,
                      amountController: _amountController,
                      payerEmail: _payerEmail,
                      receiverEmail: _receiverEmail,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _SettleUpButton extends StatefulWidget {
  const _SettleUpButton({
    required this.formKey,
    required this.groupPk,
    required this.amountController,
    required this.payerEmail,
    required this.receiverEmail,
  });

  final GlobalKey<FormState> formKey;
  final String groupPk;
  final TextEditingController amountController;
  final String? payerEmail;
  final String? receiverEmail;

  @override
  State<_SettleUpButton> createState() => _SettleUpButtonState();
}

class _SettleUpButtonState extends State<_SettleUpButton> {
  bool _saving = false;

  Future<void> _showDialogMessage(String title, String message) async {
    if (!mounted) return;
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("ok".tr()),
          ),
        ],
      ),
    );
  }

  Future<void> _handleSettle() async {
    if (_saving) return;

    if (widget.payerEmail == null || widget.receiverEmail == null) {
      await _showDialogMessage(
        "settle-participants-required".tr(),
        "settle-participants-required-desc".tr(),
      );
      return;
    }

    if (widget.payerEmail == widget.receiverEmail) {
      await _showDialogMessage(
        "settle-participants-required".tr(),
        "settle-participants-required-desc".tr(),
      );
      return;
    }

    if (!(widget.formKey.currentState?.validate() ?? false)) {
      return;
    }

    final parsedAmount = double.tryParse(
      widget.amountController.text.replaceAll(",", "."),
    );
    if (parsedAmount == null || parsedAmount <= 0) {
      await _showDialogMessage(
        "settle-amount-invalid".tr(),
        "settle-amount-required".tr(),
      );
      return;
    }

    setState(() => _saving = true);
    try {
      final members = await (database.select(database.groupMembers)
            ..where((tbl) => tbl.groupFk.equals(widget.groupPk)))
          .get();

      if (members.isEmpty) {
        await _showDialogMessage(
          "groups-no-members".tr(),
          "groups-no-members-description".tr(),
        );
        return;
      }

      final memberEmails = members.map((member) => member.userEmail).toSet();
      if (!memberEmails.contains(widget.payerEmail) ||
          !memberEmails.contains(widget.receiverEmail)) {
        await _showDialogMessage(
          "settle-participants-required".tr(),
          "settle-participants-required-desc".tr(),
        );
        return;
      }

      final currency =
          (appStateSettings['selectedCurrency'] as String?) ?? 'usd';

      await SettlementOperations.recordSettlement(
        groupPk: widget.groupPk,
        fromUser: widget.payerEmail!,
        toUser: widget.receiverEmail!,
        amount: parsedAmount,
        currency: currency,
      );

      if (!mounted) return;
      Navigator.of(context).pop();
      openSnackbar(SnackbarMessage(
        title: "settled".tr(),
        icon: Icons.handshake_rounded,
      ));
    } catch (error) {
      await _showDialogMessage(
        "settle-up".tr(),
        error.toString(),
      );
    } finally {
      if (mounted) {
        setState(() => _saving = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: _saving
          ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : const Icon(Icons.handshake_rounded),
      label: Text(_saving ? "saving".tr() : "settle-confirm".tr()),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        textStyle: Theme.of(context).textTheme.titleMedium,
      ),
      onPressed: _saving ? null : _handleSettle,
    );
  }
}

class _ParticipantSelector extends StatelessWidget {
  const _ParticipantSelector({
    required this.label,
    required this.groupPk,
    required this.currentValue,
    required this.onChanged,
  });

  final String label;
  final String groupPk;
  final String? currentValue;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<GroupMemberEntry>>(
      stream: (database.select(database.groupMembers)
            ..where((tbl) => tbl.groupFk.equals(groupPk))
            ..orderBy([(tbl) => OrderingTerm.asc(tbl.userName)])).
          .watch(),
      builder: (context, snapshot) {
        final members = snapshot.data ?? [];
        if (members.isEmpty) {
          return NoResults(
            icon: Icons.group_off,
            title: "groups-no-members".tr(),
            message: "groups-no-members-description".tr(),
          );
        }
        return Material(
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: label,
                border: InputBorder.none,
              ),
              value: currentValue,
              isExpanded: true,
              items: members
                  .map(
                    (member) => DropdownMenuItem<String>(
                      value: member.userEmail,
                      child: Text(member.userName.isNotEmpty
                          ? member.userName
                          : member.userEmail),
                    ),
                  )
                  .toList(),
              onChanged: onChanged,
            ),
          ),
        );
      },
    );
  }
}
