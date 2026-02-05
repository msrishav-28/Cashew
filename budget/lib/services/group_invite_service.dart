import 'package:budget/database/operations/group_operations.dart';
import 'package:budget/struct/databaseGlobal.dart';
import 'package:budget/struct/settings.dart';

const _groupInvitesSettingsKey = 'groupInvitesCache';

enum GroupInviteStatus { pending, accepted, expired, revoked }

class GroupInvite {
  GroupInvite({
    required this.code,
    required this.groupPk,
    required this.senderEmail,
    required this.recipientEmail,
    required this.expiresAt,
    required this.createdAt,
    this.acceptedAt,
    this.status = GroupInviteStatus.pending,
  });

  final String code;
  final String groupPk;
  final String senderEmail;
  final String recipientEmail;
  final DateTime createdAt;
  final DateTime expiresAt;
  final DateTime? acceptedAt;
  final GroupInviteStatus status;

  bool get isExpired => DateTime.now().isAfter(expiresAt);

  GroupInvite copyWith({
    GroupInviteStatus? status,
    DateTime? acceptedAt,
  }) {
    return GroupInvite(
      code: code,
      groupPk: groupPk,
      senderEmail: senderEmail,
      recipientEmail: recipientEmail,
      expiresAt: expiresAt,
      createdAt: createdAt,
      acceptedAt: acceptedAt ?? this.acceptedAt,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'groupPk': groupPk,
      'senderEmail': senderEmail,
      'recipientEmail': recipientEmail,
      'createdAt': createdAt.toIso8601String(),
      'expiresAt': expiresAt.toIso8601String(),
      'acceptedAt': acceptedAt?.toIso8601String(),
      'status': status.index,
    };
  }

  factory GroupInvite.fromJson(Map<String, dynamic> json) {
    return GroupInvite(
      code: json['code'] as String,
      groupPk: json['groupPk'] as String,
      senderEmail: json['senderEmail'] as String,
      recipientEmail: json['recipientEmail'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      expiresAt: DateTime.parse(json['expiresAt'] as String),
      acceptedAt: json['acceptedAt'] != null ? DateTime.parse(json['acceptedAt'] as String) : null,
      status: GroupInviteStatus.values[(json['status'] as int?) ?? 0],
    );
  }
}

class GroupInviteService {
  static List<GroupInvite> _loadInvites() {
    final raw = appStateSettings[_groupInvitesSettingsKey];
    if (raw is List) {
      return raw
          .whereType<Map>()
          .map((entry) => GroupInvite.fromJson(Map<String, dynamic>.from(entry)))
          .toList();
    }
    return [];
  }

  static Future<void> _persist(List<GroupInvite> invites) async {
    final payload = invites.map((invite) => invite.toJson()).toList();
    await updateSettings(_groupInvitesSettingsKey, payload, updateGlobalState: true);
  }

  static Future<GroupInvite> createInvite({
    required String groupPk,
    required String senderEmail,
    required String recipientEmail,
    Duration validFor = const Duration(days: 7),
  }) async {
    final invites = _loadInvites();
    final invite = GroupInvite(
      code: uuid.v4(),
      groupPk: groupPk,
      senderEmail: senderEmail,
      recipientEmail: recipientEmail,
      createdAt: DateTime.now(),
      expiresAt: DateTime.now().add(validFor),
    );
    invites.removeWhere((existing) => existing.code == invite.code);
    invites.add(invite);
    await _persist(invites);
    return invite;
  }

  static List<GroupInvite> listInvites({
    String? groupPk,
    GroupInviteStatus? status,
  }) {
    return _loadInvites().where((invite) {
      final matchesGroup = groupPk == null || invite.groupPk == groupPk;
      final matchesStatus = status == null || invite.status == status;
      return matchesGroup && matchesStatus;
    }).toList();
  }

  static GroupInvite? findByCode(String code) {
    try {
      return _loadInvites().firstWhere((invite) => invite.code == code);
    } catch (_) {
      return null;
    }
  }

  static Future<GroupInvite> acceptInvite({
    required String code,
    required String joiningEmail,
    required String displayName,
  }) async {
    final invites = _loadInvites();
    final idx = invites.indexWhere((invite) => invite.code == code);
    if (idx == -1) {
      throw StateError('Invite not found');
    }
    final invite = invites[idx];
    if (invite.status == GroupInviteStatus.revoked) {
      throw StateError('Invite has been revoked');
    }
    if (invite.isExpired) {
      invites[idx] = invite.copyWith(status: GroupInviteStatus.expired);
      await _persist(invites);
      throw StateError('Invite has expired');
    }
    await GroupOperations.addMemberToGroup(
      groupPk: invite.groupPk,
      userEmail: joiningEmail,
      userName: displayName,
      actorEmail: invite.senderEmail,
    );
    invites[idx] = invite.copyWith(
      status: GroupInviteStatus.accepted,
      acceptedAt: DateTime.now(),
    );
    await _persist(invites);
    return invites[idx];
  }

  static Future<void> revokeInvite(String code) async {
    final invites = _loadInvites();
    final idx = invites.indexWhere((invite) => invite.code == code);
    if (idx == -1) return;
    invites[idx] = invites[idx].copyWith(status: GroupInviteStatus.revoked);
    await _persist(invites);
  }

  static Future<void> purgeExpired() async {
    final invites = _loadInvites();
    final updated = invites.where((invite) {
      if (invite.status == GroupInviteStatus.pending && invite.isExpired) {
        return false;
      }
      return true;
    }).toList();
    if (updated.length != invites.length) {
      await _persist(updated);
    }
  }

  static String generateShareableLink(GroupInvite invite) {
    final origin = appStateSettings['webAppOrigin'] ?? 'https://cashew.app';
    return origin + '/join-group?code=' + invite.code;
  }
}
