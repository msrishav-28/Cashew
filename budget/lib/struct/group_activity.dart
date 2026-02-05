import 'package:budget/database/tables.dart';
import 'package:drift/drift.dart';

class GroupActivityModel {
  final String activityPk;
  final String groupFk;
  final String activityType;
  final String performedBy;
  final String description;
  final String? relatedExpenseFk;
  final String? relatedSettlementFk;
  final DateTime dateCreated;

  const GroupActivityModel({
    required this.activityPk,
    required this.groupFk,
    required this.activityType,
    required this.performedBy,
    required this.description,
    this.relatedExpenseFk,
    this.relatedSettlementFk,
    required this.dateCreated,
  });

  factory GroupActivityModel.fromEntry(GroupActivityEntry entry) {
    return GroupActivityModel(
      activityPk: entry.activityPk,
      groupFk: entry.groupFk,
      activityType: entry.activityType,
      performedBy: entry.performedBy,
      description: entry.description,
      relatedExpenseFk: entry.relatedExpenseFk,
      relatedSettlementFk: entry.relatedSettlementFk,
      dateCreated: entry.dateCreated,
    );
  }

  GroupActivityCompanion toCompanion() {
    return GroupActivityCompanion(
      activityPk: Value(activityPk),
      groupFk: Value(groupFk),
      activityType: Value(activityType),
      performedBy: Value(performedBy),
      description: Value(description),
      relatedExpenseFk: Value(relatedExpenseFk),
      relatedSettlementFk: Value(relatedSettlementFk),
      dateCreated: Value(dateCreated),
    );
  }

  GroupActivityModel copyWith({
    String? activityPk,
    String? groupFk,
    String? activityType,
    String? performedBy,
    String? description,
    String? relatedExpenseFk,
    String? relatedSettlementFk,
    DateTime? dateCreated,
  }) {
    return GroupActivityModel(
      activityPk: activityPk ?? this.activityPk,
      groupFk: groupFk ?? this.groupFk,
      activityType: activityType ?? this.activityType,
      performedBy: performedBy ?? this.performedBy,
      description: description ?? this.description,
      relatedExpenseFk: relatedExpenseFk ?? this.relatedExpenseFk,
      relatedSettlementFk: relatedSettlementFk ?? this.relatedSettlementFk,
      dateCreated: dateCreated ?? this.dateCreated,
    );
  }

  factory GroupActivityModel.fromJson(Map<String, dynamic> json) {
    return GroupActivityModel(
      activityPk: json['activityPk'] as String,
      groupFk: json['groupFk'] as String,
      activityType: json['activityType'] as String,
      performedBy: json['performedBy'] as String,
      description: json['description'] as String,
      relatedExpenseFk: json['relatedExpenseFk'] as String?,
      relatedSettlementFk: json['relatedSettlementFk'] as String?,
      dateCreated: DateTime.parse(json['dateCreated'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'activityPk': activityPk,
      'groupFk': groupFk,
      'activityType': activityType,
      'performedBy': performedBy,
      'description': description,
      'relatedExpenseFk': relatedExpenseFk,
      'relatedSettlementFk': relatedSettlementFk,
      'dateCreated': dateCreated.toIso8601String(),
    };
  }
}
