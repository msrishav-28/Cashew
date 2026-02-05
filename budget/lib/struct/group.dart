import 'package:budget/database/tables.dart';
import 'package:drift/drift.dart';

class GroupModel {
  final String groupPk;
  final String name;
  final String? description;
  final String? imageUrl;
  final String createdBy;
  final DateTime dateCreated;
  final DateTime? dateTimeModified;
  final bool archived;
  final List<String>? memberEmails;

  const GroupModel({
    required this.groupPk,
    required this.name,
    this.description,
    this.imageUrl,
    required this.createdBy,
    required this.dateCreated,
    this.dateTimeModified,
    this.archived = false,
    this.memberEmails,
  });

  factory GroupModel.fromEntry(GroupEntry entry) {
    return GroupModel(
      groupPk: entry.groupPk,
      name: entry.name,
      description: entry.description,
      imageUrl: entry.imageUrl,
      createdBy: entry.createdBy,
      dateCreated: entry.dateCreated,
      dateTimeModified: entry.dateTimeModified,
      archived: entry.archived,
      memberEmails: null,
    );
  }

  GroupsCompanion toCompanion({bool nullToAbsent = true}) {
    return GroupsCompanion(
      groupPk: Value(groupPk),
      name: Value(name),
      description: Value(description),
      imageUrl: Value(imageUrl),
      createdBy: Value(createdBy),
      dateCreated: Value(dateCreated),
      dateTimeModified: Value(dateTimeModified),
      archived: Value(archived),
    );
  }

  GroupModel copyWith({
    String? groupPk,
    String? name,
    String? description,
    String? imageUrl,
    String? createdBy,
    DateTime? dateCreated,
    DateTime? dateTimeModified,
    bool? archived,
    List<String>? memberEmails,
  }) {
    return GroupModel(
      groupPk: groupPk ?? this.groupPk,
      name: name ?? this.name,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      createdBy: createdBy ?? this.createdBy,
      dateCreated: dateCreated ?? this.dateCreated,
      dateTimeModified: dateTimeModified ?? this.dateTimeModified,
      archived: archived ?? this.archived,
      memberEmails: memberEmails ?? this.memberEmails,
    );
  }

  factory GroupModel.fromJson(Map<String, dynamic> json) {
    return GroupModel(
      groupPk: json['groupPk'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String?,
      createdBy: json['createdBy'] as String,
      dateCreated: DateTime.parse(json['dateCreated'] as String),
      dateTimeModified: json['dateTimeModified'] != null
          ? DateTime.parse(json['dateTimeModified'] as String)
          : null,
      archived: json['archived'] as bool? ?? false,
      memberEmails: (json['memberEmails'] as List<dynamic>?)
          ?.map((item) => item.toString())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'groupPk': groupPk,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'createdBy': createdBy,
      'dateCreated': dateCreated.toIso8601String(),
      'dateTimeModified': dateTimeModified?.toIso8601String(),
      'archived': archived,
    };
    if (memberEmails != null) {
      map['memberEmails'] = memberEmails;
    }
    return map;
  }
}
