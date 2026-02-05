import 'package:budget/database/tables.dart';
import 'package:budget/pages/groups/widgets/groupActivityTile.dart';
import 'package:budget/struct/databaseGlobal.dart';
import 'package:budget/widgets/noResults.dart';
import 'package:drift/drift.dart' show OrderingTerm;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/// Live-updating feed of group activity entries with sensible defaults for the
/// empty state.
class GroupActivityFeed extends StatelessWidget {
  const GroupActivityFeed({
    super.key,
    required this.groupPk,
    this.limit,
    this.padding = const EdgeInsets.symmetric(horizontal: 20),
  });

  final String groupPk;
  final int? limit;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final query = (database.select(database.groupActivity)
          ..where((tbl) => tbl.groupFk.equals(groupPk))
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.dateCreated)]));
    if (limit != null) {
      query.limit(limit!);
    }
    return StreamBuilder<List<GroupActivityEntry>>(
      stream: query.watch(),
      builder: (context, snapshot) {
        final items = snapshot.data ?? [];
        if (items.isEmpty) {
          return Padding(
            padding: padding,
            child: NoResults(
              icon: Icons.history_rounded,
              title: 'groups-no-activity'.tr(),
              message: 'groups-no-activity-description'.tr(),
            ),
          );
        }
        return Padding(
          padding: padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  'groups-activity'.tr(),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              ...items.map(
                (activity) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: GroupActivityTile(activity: activity),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
