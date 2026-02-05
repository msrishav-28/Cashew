import 'package:budget/database/tables.dart';
import 'package:budget/services/activity_logger.dart';
import 'package:budget/struct/databaseGlobal.dart';
import 'package:budget/struct/group_member.dart';
import 'package:drift/drift.dart';

class GroupOperations {
  static Future<GroupEntry?> fetchGroup(String groupPk) async {
    return (database.select(database.groups)
          ..where((tbl) => tbl.groupPk.equals(groupPk)))
        .getSingleOrNull();
  }

  static Future<List<GroupMemberEntry>> fetchMembers(String groupPk) {
    return (database.select(database.groupMembers)
          ..where((tbl) => tbl.groupFk.equals(groupPk))
          ..orderBy([(tbl) => OrderingTerm.asc(tbl.userName)]))
        .get();
  }

  static Future<GroupEntry> createGroup({
    required String name,
    required String createdBy,
    String? description,
    String? imageUrl,
    List<GroupMemberModel> initialMembers = const [],
  }) async {
    final now = DateTime.now();
    final groupPk = uuid.v4();
    await database.into(database.groups).insert(
      GroupsCompanion(
        groupPk: Value(groupPk),
        name: Value(name),
        description: Value(description),
        imageUrl: Value(imageUrl),
        createdBy: Value(createdBy),
        dateCreated: Value(now),
        dateTimeModified: Value(now),
        archived: const Value(false),
      ),
      mode: InsertMode.insertOrReplace,
    );

    if (initialMembers.isNotEmpty) {
      await addMembers(groupPk, initialMembers, actorEmail: createdBy);
    } else if (createdBy.isNotEmpty) {
      await ActivityLogger.logMemberJoined(
        groupPk,
        actorEmail: createdBy,
        memberEmail: createdBy,
      );
    }

    return (database.select(database.groups)
          ..where((tbl) => tbl.groupPk.equals(groupPk)))
        .getSingle();
  }

  static Future<void> addMembers(
    String groupPk,
    List<GroupMemberModel> members, {
    String? actorEmail,
  }) async {
    if (members.isEmpty) return;
    await database.batch((batch) {
      batch.insertAll(
        database.groupMembers,
        members.map((member) {
          final model = member.copyWith(groupFk: groupPk, memberPk: uuid.v4());
          return model.toCompanion();
        }).toList(),
        mode: InsertMode.insertOrIgnore,
      );
    });
    for (final member in members) {
      await ActivityLogger.logMemberJoined(
        groupPk,
        actorEmail: actorEmail ?? member.userEmail,
        memberEmail: member.userEmail,
      );
    }
  }

  static Future<GroupMemberEntry?> addMemberToGroup({
    required String groupPk,
    required String userEmail,
    required String userName,
    String? userPhotoUrl,
    bool isActive = true,
    String? actorEmail,
  }) async {
    final entry = GroupMembersCompanion(
      memberPk: Value(uuid.v4()),
      groupFk: Value(groupPk),
      userEmail: Value(userEmail),
      userName: Value(userName),
      userPhotoUrl: Value(userPhotoUrl),
      dateJoined: Value(DateTime.now()),
      isActive: Value(isActive),
    );
    await database.into(database.groupMembers).insert(entry, mode: InsertMode.insertOrIgnore);
    final addedMember = await (database.select(database.groupMembers)
          ..where((tbl) => tbl.groupFk.equals(groupPk))
          ..where((tbl) => tbl.userEmail.equals(userEmail)))
        .getSingleOrNull();
    if (addedMember != null) {
      await ActivityLogger.logMemberJoined(
        groupPk,
        actorEmail: actorEmail ?? userEmail,
        memberEmail: userEmail,
      );
    }
    return addedMember;
  }

  static Future<void> removeMemberFromGroup({
    required String groupPk,
    required String userEmail,
    String? actorEmail,
  }) async {
    final updated = await (database.update(database.groupMembers)
          ..where((tbl) => tbl.groupFk.equals(groupPk))
          ..where((tbl) => tbl.userEmail.equals(userEmail)))
        .write(
      const GroupMembersCompanion(
        isActive: Value(false),
      ),
    );
    if (updated > 0) {
      await ActivityLogger.logMemberLeft(
        groupPk,
        actorEmail: actorEmail ?? userEmail,
        memberEmail: userEmail,
      );
    }
  }

  static Future<void> deleteGroup(String groupPk) async {
    await database.transaction(() async {
      final expenses = await (database.select(database.sharedExpenses)
            ..where((tbl) => tbl.groupFk.equals(groupPk)))
          .get();
      if (expenses.isNotEmpty) {
        final expenseIds = expenses.map((expense) => expense.expensePk).toList();
        await (database.delete(database.expenseSplits)
              ..where((tbl) => tbl.expenseFk.isIn(expenseIds)))
            .go();
        await (database.delete(database.sharedExpenses)
              ..where((tbl) => tbl.groupFk.equals(groupPk)))
            .go();
      }

      await (database.delete(database.settlements)
            ..where((tbl) => tbl.groupFk.equals(groupPk)))
          .go();
      await (database.delete(database.groupBalances)
            ..where((tbl) => tbl.groupFk.equals(groupPk)))
          .go();
      await (database.delete(database.groupActivity)
            ..where((tbl) => tbl.groupFk.equals(groupPk)))
          .go();
      await (database.delete(database.groupMembers)
            ..where((tbl) => tbl.groupFk.equals(groupPk)))
          .go();
      await (database.delete(database.groups)
            ..where((tbl) => tbl.groupPk.equals(groupPk)))
          .go();
    });
  }

  static Future<void> archiveGroup(String groupPk, bool archived) async {
    await (database.update(database.groups)
          ..where((tbl) => tbl.groupPk.equals(groupPk)))
        .write(
      GroupsCompanion(
        archived: Value(archived),
        dateTimeModified: Value(DateTime.now()),
      ),
    );
  }
}
