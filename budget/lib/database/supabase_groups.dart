import 'package:budget/database/supabase_manager.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class SupabaseGroups {
  
  static final SupabaseGroups _instance = SupabaseGroups._internal();
  factory SupabaseGroups() => _instance;
  SupabaseGroups._internal();

  final SupabaseClient client = SupabaseManager().client;
  final Uuid uuid = Uuid();

  // Create a new group
  Future<String?> createGroup({
    required String name,
    String? description,
    String? imageUrl,
  }) async {
    try {
      final user = client.auth.currentUser;
      if (user == null) return null;

      final groupPk = uuid.v4();
      
      // 1. Create Group
      await client.from('groups').insert({
        'group_pk': groupPk,
        'name': name,
        'description': description,
        'image_url': imageUrl,
        'created_by': user.id,
      });

      // 2. Add creator as member
      await client.from('group_members').insert({
        'member_pk': uuid.v4(),
        'group_fk': groupPk,
        'user_id': user.id,
        'user_email': user.email,
        'user_name': user.userMetadata?['name'] ?? user.email,
        'is_active': true,
      });

      return groupPk;
    } catch (e) {
      print("Error creating group: $e");
      rethrow;
    }
  }

  // Invite member by email
  Future<bool> inviteMember(String groupPk, String email, {String? name}) async {
    try {
      await client.from('group_members').insert({
        'member_pk': uuid.v4(),
        'group_fk': groupPk,
        'user_email': email,
        'user_name': name,
        // user_id will be linked when appropriate user accepts or if we can lookup (requires edge function usually)
        // For MVP, we insert entry.
      });
      return true;
    } catch (e) {
      print("Error inviting member: $e");
      return false;
    }
  }

  // Get Groups Stream
  Stream<List<Map<String, dynamic>>> getUserGroups() {
    return client
        .from('groups')
        .stream(primaryKey: ['group_pk'])
        .map((data) => List<Map<String, dynamic>>.from(data));
  }

  // Add Shared Expense
  Future<bool> addSharedExpense({
    required String groupPk,
    required String title,
    required double amount,
    required String currency,
    required String paidByEmail,
    String? description,
    String? categoryFk,
    List<Map<String, dynamic>>? splits, // List of {user_email, share_amount, paid_amount, is_paid}
  }) async {
    try {
      final expensePk = uuid.v4();
      
      // 1. Add Expense
      await client.from('shared_expenses').insert({
        'expense_pk': expensePk,
        'group_fk': groupPk,
        'title': title,
        'description': description,
        'amount': amount,
        'currency': currency,
        'category_fk': categoryFk,
        'paid_by': paidByEmail,
        'is_settled': false,
      });

      // 2. Add Splits
      if (splits != null) {
        for (var split in splits) {
          split['split_pk'] = uuid.v4();
          split['expense_fk'] = expensePk;
        }
        await client.from('expense_splits').insert(splits);
      }

      return true;
    } catch (e) {
      print("Error adding shared expense: $e");
      return false;
    }
  }

  // Get Shared Expenses Stream
  Stream<List<Map<String, dynamic>>> getSharedExpenses(String groupPk) {
    return client
        .from('shared_expenses')
        .stream(primaryKey: ['expense_pk'])
        .eq('group_fk', groupPk)
        .order('date_created', ascending: false)
        .map((data) => List<Map<String, dynamic>>.from(data));
  }

  // Get Group Balances
  Future<Map<String, double>> getGroupBalances(String groupPk) async {
    try {
      final balances = <String, double>{};

      // 1. Fetch Expenses and Splits
      final expensesResponse = await client
          .from('shared_expenses')
          .select('*, expense_splits(*)')
          .eq('group_fk', groupPk);
      
      final expenses = List<Map<String, dynamic>>.from(expensesResponse);

      for (var expense in expenses) {
        final paidBy = expense['paid_by'] as String;
        final amount = (expense['amount'] as num).toDouble();
        
        // Payer gets positive balance (they are owed money)
        balances[paidBy] = (balances[paidBy] ?? 0) + amount;

        final splits = List<Map<String, dynamic>>.from(expense['expense_splits']);
        for (var split in splits) {
          final userEmail = split['user_email'] as String;
          final shareAmount = (split['share_amount'] as num).toDouble();

          // Consumer gets negative balance (they owe money)
          balances[userEmail] = (balances[userEmail] ?? 0) - shareAmount;
        }
      }

      // 2. Fetch Settlements
      final settlementsResponse = await client
          .from('settlements')
          .select()
          .eq('group_fk', groupPk);
      
      final settlements = List<Map<String, dynamic>>.from(settlementsResponse);

      for (var settlement in settlements) {
        final fromEmail = settlement['from_user_email'] as String;
        final toEmail = settlement['to_user_email'] as String;
        final amount = (settlement['amount'] as num).toDouble();

        // Payer (from) gets positive (debt reduced/credit increased)
        balances[fromEmail] = (balances[fromEmail] ?? 0) + amount;
        
        // Receiver (to) gets negative (owed amount reduced)
        balances[toEmail] = (balances[toEmail] ?? 0) - amount;
      }

      return balances;
    } catch (e) {
      print("Error calculating balances: $e");
      return {};
    }
  }

  // Settle Debt
  Future<bool> settleDebt({
    required String groupPk,
    required String fromUserEmail,
    required String toUserEmail,
    required double amount,
    required String currency,
  }) async {
    try {
      await client.from('settlements').insert({
        'settlement_pk': uuid.v4(),
        'group_fk': groupPk,
        'from_user_email': fromUserEmail,
        'to_user_email': toUserEmail,
        'amount': amount,
        'currency': currency,
      });
      return true;
    } catch (e) {
       print("Error settling debt: $e");
       return false;
    }
  }
}
