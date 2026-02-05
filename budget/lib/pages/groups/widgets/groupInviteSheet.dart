import 'package:budget/services/group_invite_service.dart';
import 'package:budget/struct/settings.dart';
import 'package:budget/widgets/button.dart';
import 'package:budget/widgets/openSnackbar.dart';
import 'package:budget/widgets/textInput.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:budget/functions.dart';
import 'package:intl/intl.dart';
import 'package:budget/struct/design_system.dart';

class GroupInviteSheet extends StatefulWidget {
  const GroupInviteSheet({super.key, required this.groupPk});

  final String groupPk;

  @override
  State<GroupInviteSheet> createState() => _GroupInviteSheetState();
}

class _GroupInviteSheetState extends State<GroupInviteSheet> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  late TextEditingController _displayNameController;
  bool _creating = false;
  bool _accepting = false;
  List<GroupInvite> _invites = [];

  @override
  void initState() {
    super.initState();
    _displayNameController = TextEditingController(
      text: (appStateSettings['currentUserDisplayName'] as String?) ?? '',
    );
    _loadInvites();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _codeController.dispose();
    _displayNameController.dispose();
    super.dispose();
  }

  void _loadInvites() {
    final invites = GroupInviteService.listInvites(groupPk: widget.groupPk);
    setState(() => _invites = invites);
  }

  Future<void> _createInvite() async {
    final email = _emailController.text.trim();
    if (email.isEmpty || !email.contains('@')) {
      openSnackbar(
        SnackbarMessage(
          title: 'Invalid email',
          description: 'Enter a valid email address to send an invite.',
          icon: Icons.warning_rounded,
        ),
      );
      return;
    }
    setState(() => _creating = true);
    try {
      final invite = await GroupInviteService.createInvite(
        groupPk: widget.groupPk,
        senderEmail: appStateSettings['currentUserEmail'] ?? '',
        recipientEmail: email,
      );
      _emailController.clear();
      _loadInvites();
      copyToClipboard(GroupInviteService.generateShareableLink(invite));
      openSnackbar(
        SnackbarMessage(
          title: 'Invite created',
          description: 'Link copied to clipboard',
          icon: Icons.mark_email_read_outlined,
        ),
      );
    } catch (error) {
      openSnackbar(
        SnackbarMessage(
          title: 'Unable to create invite',
          description: error.toString(),
          icon: Icons.error_outline,
        ),
      );
    } finally {
      if (mounted) setState(() => _creating = false);
    }
  }

  Future<void> _acceptInvite() async {
    final code = _codeController.text.trim();
    final displayName = _displayNameController.text.trim().isEmpty
        ? (appStateSettings['currentUserEmail'] as String? ?? '')
        : _displayNameController.text.trim();
    if (code.isEmpty) {
      openSnackbar(
        SnackbarMessage(
          title: 'Missing invite code',
          description: 'Paste the invite code to join this group.',
          icon: Icons.warning_amber_outlined,
        ),
      );
      return;
    }
    setState(() => _accepting = true);
    try {
      await GroupInviteService.acceptInvite(
        code: code,
        joiningEmail: appStateSettings['currentUserEmail'] ?? '',
        displayName: displayName,
      );
      _codeController.clear();
      _loadInvites();
      Navigator.of(context).maybePop();
      openSnackbar(
        SnackbarMessage(
          title: 'Joined group',
          description: 'Invite accepted successfully',
          icon: Icons.check_circle_outline,
        ),
      );
    } catch (error) {
      openSnackbar(
        SnackbarMessage(
          title: 'Unable to accept invite',
          description: error.toString(),
          icon: Icons.error_outline,
        ),
      );
    } finally {
      if (mounted) setState(() => _accepting = false);
    }
  }

  Future<void> _revokeInvite(String code) async {
    await GroupInviteService.revokeInvite(code);
    _loadInvites();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextInput(
            controller: _emailController,
            labelText: 'Recipient email',
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 12),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Button(
              label: 'Generate invite',
              icon: Icons.mail_outline,
              isLoading: _creating,
              onTap: _creating ? null : _createInvite,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Pending invites',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          if (_invites.isEmpty)
            Text(
              'No invites have been created yet.',
              style: Theme.of(context).textTheme.bodyMedium,
            )
          else
            ..._invites.map(
            ..._invites.map(
              (invite) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Container(
                  decoration: DesignSystem.effects.glassCard.copyWith(borderRadius: BorderRadius.circular(16)),
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                       Expanded(
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text(
                               invite.recipientEmail,
                               style: DesignSystem.typography.title.copyWith(color: DesignSystem.colors.textPrimary),
                             ),
                             const SizedBox(height: 4),
                             Text(
                               invite.status == GroupInviteStatus.pending
                                   ? 'Expires ${DateFormat.yMMMd(context.locale.languageCode).format(invite.expiresAt)}'
                                   : invite.status.name,
                               style: DesignSystem.typography.label.copyWith(color: DesignSystem.colors.textSecondary),
                             ),
                           ],
                         ),
                       ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            tooltip: 'Copy link',
                            icon: Icon(Icons.link, color: DesignSystem.colors.primary),
                            onPressed: () {
                              copyToClipboard(GroupInviteService.generateShareableLink(invite));
                              openSnackbar(
                                SnackbarMessage(
                                  title: 'Link copied',
                                  icon: Icons.link,
                                ),
                              );
                            },
                          ),
                          if (invite.status == GroupInviteStatus.pending)
                            IconButton(
                              tooltip: 'Revoke',
                              icon: Icon(Icons.close, color: DesignSystem.colors.expense),
                              onPressed: () => _revokeInvite(invite.code),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ),
          const SizedBox(height: 24),
          Text(
            'Have a code?',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          TextInput(
            controller: _codeController,
            labelText: 'Invite code',
          ),
          const SizedBox(height: 8),
          TextInput(
            controller: _displayNameController,
            labelText: 'Display name',
          ),
          const SizedBox(height: 12),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Button(
              label: 'Join group',
              icon: Icons.groups_2_outlined,
              isLoading: _accepting,
              onTap: _accepting ? null : _acceptInvite,
            ),
          ),
        ],
      ),
    );
  }
}
