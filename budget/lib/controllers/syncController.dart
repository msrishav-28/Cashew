import 'dart:async';
import 'package:budget/database/tables.dart';
import 'package:budget/database/supabase_groups.dart';
import 'package:budget/database/supabase_sync_personal.dart';
import 'package:budget/database/supabase_manager.dart';
import 'package:budget/struct/databaseGlobal.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:drift/drift.dart';

/// Manages synchronization between local Drift database and Supabase cloud.
///
/// Uses a "cloud-first" approach for groups since they require multi-user sync.
/// Personal data remains "local-first" with background sync.
class SyncController {
  static final SyncController _instance = SyncController._internal();
  factory SyncController() => _instance;
  SyncController._internal();

  final SupabaseGroups _cloud = SupabaseGroups();
  final ValueNotifier<bool> isSyncing = ValueNotifier(false);
  DateTime? lastSyncTime;

  StreamSubscription? _connectivitySubscription;

  void init() {
    // Skip init if Supabase is not configured
    if (!SupabaseManager().isConfigured) {
      print('⚠️ SyncController: Supabase not configured, sync disabled.');
      return;
    }
    
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> result) {
      if (!result.contains(ConnectivityResult.none)) {
        sync();
      }
    });
  }

  void dispose() {
    _connectivitySubscription?.cancel();
  }

  Future<void> sync() async {
    if (isSyncing.value) return;
    if (!SupabaseManager().isConfigured) return;
    
    isSyncing.value = true;

    try {
      final connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.none)) return;

      print("☁️ Starting Cloud Sync...");

      // 1. Sync Personal Data
      await syncPersonalData();

      // 2. Sync Groups (Pull from cloud)
      await _syncGroups();

      // 3. Sync Group Members
      await _syncGroupMembers();

      lastSyncTime = DateTime.now();
      print("✅ Cloud Sync Completed at ${lastSyncTime}");
    } catch (e) {
      print("❌ Sync Error: $e");
    } finally {
      isSyncing.value = false;
    }
  }

  /// Pull groups from Supabase and upsert into local Drift database.
  Future<void> _syncGroups() async {
    try {
      final cloudGroups = await _cloud.getUserGroups().first;
      
      for (var group in cloudGroups) {
        final companion = GroupsCompanion(
          groupPk: Value(group['group_pk'] as String),
          name: Value(group['name'] as String),
          description: Value(group['description'] as String?),
          imageUrl: Value(group['image_url'] as String?),
          createdBy: Value(group['created_by'] as String? ?? ''),
          dateCreated: Value(DateTime.tryParse(group['date_created'] ?? '') ?? DateTime.now()),
          archived: Value(group['archived'] as bool? ?? false),
        );
        
        await database.into(database.groups).insertOnConflictUpdate(companion);
      }
      
      print("  ✓ Synced ${cloudGroups.length} groups");
    } catch (e) {
      print("  ✗ Group sync failed: $e");
    }
  }

  /// Pull group members from Supabase for all local groups.
  Future<void> _syncGroupMembers() async {
    try {
      final localGroups = await database.select(database.groups).get();
      int memberCount = 0;
      
      for (var group in localGroups) {
        final members = await SupabaseManager().client
            .from('group_members')
            .select()
            .eq('group_fk', group.groupPk);
        
        for (var member in members) {
          final companion = GroupMembersCompanion(
            memberPk: Value(member['member_pk'] as String),
            groupFk: Value(member['group_fk'] as String),
            userEmail: Value(member['user_email'] as String? ?? ''),
            userName: Value(member['user_name'] as String? ?? ''),
            userPhotoUrl: Value(member['user_photo_url'] as String?),
            dateJoined: Value(DateTime.tryParse(member['date_joined'] ?? '') ?? DateTime.now()),
            isActive: Value(member['is_active'] as bool? ?? true),
          );
          
          await database.into(database.groupMembers).insertOnConflictUpdate(companion);
          memberCount++;
        }
      }
      
      print("  ✓ Synced $memberCount members across ${localGroups.length} groups");
    } catch (e) {
      print("  ✗ Member sync failed: $e");
    }
  }
}
