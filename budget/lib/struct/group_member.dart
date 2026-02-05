import 'package:budget/database/tables.dart';
import 'package:drift/drift.dart';

class GroupMemberModel {
  final String memberPk;
  final String groupFk;
  final String userEmail;
  final String userName;
  final String? userPhotoUrl;
  final DateTime dateJoined;
  final bool isActive;

  const GroupMemberModel({
    required this.memberPk,
    required this.groupFk,
    required this.userEmail,
    required this.userName,
    this.userPhotoUrl,
    required this.dateJoined,
    this.isActive = true,
  });

  factory GroupMemberModel.fromEntry(GroupMemberEntry entry) {
    return GroupMemberModel(
      memberPk: entry.memberPk,
      groupFk: entry.groupFk,
      userEmail: entry.userEmail,
      userName: entry.userName,
      userPhotoUrl: entry.userPhotoUrl,
      dateJoined: entry.dateJoined,
      isActive: entry.isActive,
    );
  }

  GroupMembersCompanion toCompanion() {
    return GroupMembersCompanion(
      memberPk: Value(memberPk),
      groupFk: Value(groupFk),
      userEmail: Value(userEmail),
      userName: Value(userName),
      userPhotoUrl: Value(userPhotoUrl),
      dateJoined: Value(dateJoined),
      isActive: Value(isActive),
    );
  }

  GroupMemberModel copyWith({
    String? memberPk,
    String? groupFk,
    String? userEmail,
    String? userName,
    String? userPhotoUrl,
    DateTime? dateJoined,
    bool? isActive,
  }) {
    return GroupMemberModel(
      memberPk: memberPk ?? this.memberPk,
      groupFk: groupFk ?? this.groupFk,
      userEmail: userEmail ?? this.userEmail,
      userName: userName ?? this.userName,
      userPhotoUrl: userPhotoUrl ?? this.userPhotoUrl,
      dateJoined: dateJoined ?? this.dateJoined,
      isActive: isActive ?? this.isActive,
    );
  }

  factory GroupMemberModel.fromJson(Map<String, dynamic> json) {
    return GroupMemberModel(
      memberPk: json['memberPk'] as String,
      groupFk: json['groupFk'] as String,
      userEmail: json['userEmail'] as String,
      userName: json['userName'] as String,
      userPhotoUrl: json['userPhotoUrl'] as String?,
      dateJoined: DateTime.parse(json['dateJoined'] as String),
      isActive: json['isActive'] as bool? ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'memberPk': memberPk,
      'groupFk': groupFk,
      'userEmail': userEmail,
      'userName': userName,
      'userPhotoUrl': userPhotoUrl,
      'dateJoined': dateJoined.toIso8601String(),
      'isActive': isActive,
    };
  }
}
