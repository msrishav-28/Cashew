import 'package:budget/database/operations/group_operations.dart';
import 'package:budget/struct/databaseGlobal.dart';
import 'package:budget/struct/group_member.dart';
import 'package:budget/struct/settings.dart';
import 'package:budget/widgets/openBottomSheet.dart';
import 'package:budget/widgets/textInput.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future<String?> showCreateGroupSheet(BuildContext context) {
  return openBottomSheet(
    context,
    const _CreateGroupSheet(),
    fullSnap: false,
    showScrollbar: true,
  );
}

class _CreateGroupSheet extends StatefulWidget {
  const _CreateGroupSheet();

  @override
  State<_CreateGroupSheet> createState() => _CreateGroupSheetState();
}

class _CreateGroupSheetState extends State<_CreateGroupSheet> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  bool _saving = false;

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    setState(() => _saving = true);
    final now = DateTime.now();
    final name = _nameController.text.trim();
    final description = _descriptionController.text.trim();
    final createdBy = (appStateSettings["currentUserEmail"] as String?) ?? "";

    try {
      final currentEmail = (appStateSettings["currentUserEmail"] as String?) ?? "";
      final initialMembers = <GroupMemberModel>[];
      if (currentEmail.isNotEmpty) {
        initialMembers.add(
          GroupMemberModel(
            memberPk: uuid.v4(),
            groupFk: '',
            userEmail: currentEmail,
            userName:
                (appStateSettings["currentUserDisplayName"] as String?) ?? currentEmail,
            userPhotoUrl: appStateSettings["currentUserPhotoUrl"] as String?,
            dateJoined: now,
            isActive: true,
          ),
        );
      }

      final group = await GroupOperations.createGroup(
        name: name,
        createdBy: createdBy,
        description: description.isEmpty ? null : description,
        initialMembers: initialMembers,
      );

      if (!mounted) return;
      Navigator.of(context).pop(group.groupPk);
    } catch (error) {
      debugPrint('Failed to create group: $error');
      if (!mounted) return;
      setState(() => _saving = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('an-error-occured'.tr())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: theme.colorScheme.surface,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 24, 20, 32),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'add-group'.tr(),
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 16),
                TextInput(
                  controller: _nameController,
                  labelText: 'name-placeholder'.tr(),
                  textCapitalization: TextCapitalization.sentences,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'enter-name'.tr();
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextInput(
                  controller: _descriptionController,
                  labelText: 'notes-placeholder'.tr(),
                  maxLines: 3,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: _saving ? null : _submit,
                    icon: _saving
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Icon(Icons.check_rounded),
                    label: Text(_saving ? 'saving'.tr() : 'save'.tr()),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
