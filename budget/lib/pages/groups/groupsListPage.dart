import 'package:budget/database/supabase_groups.dart';
import 'package:budget/pages/groups/groupDetailsPage.dart';
import 'package:budget/struct/design_system.dart';
import 'package:budget/widgets/tappable.dart';
import 'package:budget/widgets/button.dart';
import 'package:budget/widgets/framework/pageFramework.dart';
import 'package:budget/widgets/openPopup.dart';
import 'package:budget/widgets/textIcons.dart';
import 'package:budget/widgets/textWidgets.dart';
import 'package:flutter/material.dart';
import 'package:budget/colors.dart';
import 'package:easy_localization/easy_localization.dart';

class GroupsListPage extends StatefulWidget {
  const GroupsListPage({required this.enableBackButton, Key? key}) : super(key: key);
  final bool enableBackButton;

  @override
  State<GroupsListPage> createState() => GroupsListPageState();
}

class GroupsListPageState extends State<GroupsListPage> {
  // GlobalKey<PageFrameworkState> pageState = GlobalKey(); // Not strictly needed if using PageFramework directly

  @override
  Widget build(BuildContext context) {
    return PageFramework(
      title: "groups".tr(),
      backButton: widget.enableBackButton,
      dragDownToDismiss: widget.enableBackButton,
      slivers: [
        StreamBuilder<List<Map<String, dynamic>>>(
          stream: SupabaseGroups().getUserGroups(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return SliverFillRemaining(
                child: Center(child: Text("Error: ${snapshot.error}")),
              );
            }
            if (!snapshot.hasData) {
              return SliverFillRemaining(
                 child: Center(child: CircularProgressIndicator()),
              );
            }
            final groups = snapshot.data!;
            if (groups.isEmpty) {
              return SliverFillRemaining(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       TextFont(text: "No groups yet"),
                       SizedBox(height: 10),
                       Button(
                         label: "Create Group",
                         onTap: () => _createGroupPopup(context),
                       )
                    ],
                  ),
                ),
              );
            }

            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final group = groups[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Tappable( // Assuming Tappable is available, otherwise InkWell
                      onTap: () {
                        pushRoute(context, GroupDetailsPage(groupPk: group['group_pk'], groupName: group['name']));
                      },
                      borderRadius: 24,
                      child: Container(
                        decoration: DesignSystem.effects.glassCard,
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: DesignSystem.colors.primary.withOpacity(0.2), // Glassy accent
                                border: Border.all(color: DesignSystem.colors.primaryNeon.withOpacity(0.5), width: 1.5),
                              ),
                              child: Center(
                                child: TextFont(
                                  text: group['name'].substring(0, 1).toUpperCase(),
                                  fontSize: 24,
                                  textColor: DesignSystem.colors.primaryNeon,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFont(
                                    text: group['name'],
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    textColor: DesignSystem.colors.textPrimary,
                                  ),
                                  if (group['description'] != null && group['description'].toString().isNotEmpty)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4.0),
                                      child: TextFont(
                                        text: group['description'],
                                        fontSize: 14,
                                        textColor: DesignSystem.colors.textSecondary,
                                        maxLines: 2,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            Icon(Icons.chevron_right, color: DesignSystem.colors.textTertiary),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                childCount: groups.length,
              ),
            );
          },
        ),
      ],
      floatingActionButton: FloatingActionButton(
        onPressed: () => _createGroupPopup(context),
        child: Icon(Icons.add),
      ),
    );
  }

  void _createGroupPopup(BuildContext context) {
    final nameController = TextEditingController();
    final descriptionController = TextEditingController();

    openPopup(
      context,
      title: "Create Group",
      icon: Icons.group_add,
      description: "Create a new group to share expenses",
      onSubmit: () async {
        if (nameController.text.isNotEmpty) {
           await SupabaseGroups().createGroup(
             name: nameController.text,
             description: descriptionController.text,
           );
           popRoute(context);
        }
      },
      onSubmitLabel: "Create",
      onCancel: () => popRoute(context),
      onCancelLabel: "Cancel",
      child: Column(
        children: [
          TextField(controller: nameController, decoration: InputDecoration(labelText: "Group Name")),
          TextField(controller: descriptionController, decoration: InputDecoration(labelText: "Description")),
          SizedBox(height: 20),
        ],
      )
    );
  }
}
