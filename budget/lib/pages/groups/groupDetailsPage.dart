import 'package:budget/database/supabase_groups.dart';
import 'package:budget/widgets/button.dart';
import 'package:budget/widgets/framework/pageFramework.dart';
import 'package:budget/widgets/openPopup.dart';
import 'package:budget/widgets/textIcons.dart';
import 'package:budget/widgets/textWidgets.dart';
import 'package:flutter/material.dart';
import 'package:budget/database/supabase_manager.dart';
import 'package:budget/struct/design_system.dart';
import 'package:budget/widgets/tappable.dart';
import 'package:budget/pages/groups/addSharedExpensePage.dart';
import 'package:budget/functions.dart';

class GroupDetailsPage extends StatelessWidget {
  final String groupPk;
  final String groupName; // Added this parameter

  const GroupDetailsPage({Key? key, required this.groupPk, required this.groupName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageFramework(
      title: groupName,
      backButton: true,
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 Button(
                   label: "Add Expense",
                   onTap: () {
                     pushRoute(context, AddSharedExpensePage(groupPk: groupPk));
                   },
                 ),
                 Button(label: "Invite Member", onTap: () => _inviteMemberPopup(context)),
               ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder<Map<String, double>>(
              future: SupabaseGroups().getGroupBalances(groupPk),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return SizedBox.shrink();
                final balances = snapshot.data!;
                if (balances.isEmpty) return SizedBox.shrink();
                
                return Container(
                  decoration: DesignSystem.effects.glassCard,
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Balances", style: DesignSystem.typography.header2.copyWith(color: DesignSystem.colors.textPrimary)),
                      SizedBox(height: 12),
                       ...balances.entries.map((e) {
                         final amount = e.value;
                         final color = amount > 0 ? DesignSystem.colors.income : (amount < 0 ? DesignSystem.colors.expense : DesignSystem.colors.textSecondary);
                         final text = amount > 0 ? "is owed ${amount.toStringAsFixed(2)}" : (amount < 0 ? "owes ${(-amount).toStringAsFixed(2)}" : "settled");
                         return Padding(
                           padding: const EdgeInsets.symmetric(vertical: 4.0),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text(e.key, style: DesignSystem.typography.body.copyWith(color: DesignSystem.colors.textPrimary)),
                               Text(text, style: DesignSystem.typography.title.copyWith(color: color)),
                             ],
                           ),
                         );
                       }).toList(),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        SliverToBoxAdapter(child: Padding(padding: EdgeInsets.all(8), child: TextFont(text: "Expenses", fontWeight: FontWeight.bold))),
        StreamBuilder<List<Map<String, dynamic>>>(
          stream: SupabaseGroups().getSharedExpenses(groupPk),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()));
            final expenses = snapshot.data!;
            if (expenses.isEmpty) return SliverToBoxAdapter(child: Center(child: TextFont(text: "No expenses")));
            
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final expense = expenses[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
                    child: Container(
                      decoration: DesignSystem.effects.glassCard.copyWith(borderRadius: BorderRadius.circular(16)),
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: DesignSystem.colors.primary.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(10),
                            child: Icon(Icons.receipt_long, color: DesignSystem.colors.primary, size: 20),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  expense['title'],
                                  style: DesignSystem.typography.title.copyWith(color: DesignSystem.colors.textPrimary),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "Paid by ${expense['paid_by']}",
                                  style: DesignSystem.typography.label.copyWith(color: DesignSystem.colors.textSecondary),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "${expense['amount']} ${expense['currency']}",
                            style: DesignSystem.typography.header2.copyWith(color: DesignSystem.colors.textPrimary, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                childCount: expenses.length,
              ),
            );
          },
        ),
      ],
    );
  }

  void _inviteMemberPopup(BuildContext context) {
    final emailController = TextEditingController();
    openPopup(
      context,
      title: "Invite Member",
      icon: Icons.person_add,
      onSubmit: () async {
        if (emailController.text.isNotEmpty) {
          await SupabaseGroups().inviteMember(groupPk, emailController.text);
          popRoute(context);
        }
      },
      onSubmitLabel: "Invite",
      onCancel: () => popRoute(context),
      child: Column(
        children: [
          TextField(controller: emailController, decoration: InputDecoration(labelText: "Email")),
        ],
      ),
    );
  }
}
