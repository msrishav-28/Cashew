# Splitwise Integration Guide for Splice Web/PWA

> **Version:** 2.0  
> **Target Platform:** Web/PWA (Progressive Web App)  
> **Last Updated:** February 5, 2026  
> **Author:** msrishav-28

> [!CAUTION]
> ## ⚠️ IMPORTANT: Backend Migration Complete
> This guide was originally written for **Firebase** integration. The actual implementation uses **Supabase** instead.
> 
> **Key Differences:**
> | Original Plan | Actual Implementation |
> |--------------|----------------------|
> | Firebase Firestore | Supabase PostgreSQL |
> | Firebase Auth | Supabase Auth |
> | Firebase Hosting | Vercel |
> | Firebase Security Rules | Row Level Security (RLS) |
> | `firebase deploy` | `vercel deploy` |
> 
> **Relevant Files:**
> - Schema: [`FINAL_SUPABASE_SCHEMA.sql`](./FINAL_SUPABASE_SCHEMA.sql)
> - Manager: [`lib/database/supabase_manager.dart`](./budget/lib/database/supabase_manager.dart)
> - Groups API: [`lib/database/supabase_groups.dart`](./budget/lib/database/supabase_groups.dart)
> - Sync Controller: [`lib/controllers/syncController.dart`](./budget/lib/controllers/syncController.dart)

---

## 📋 Table of Contents

1. [Overview](#overview)
2. [Splitwise Features Breakdown](#splitwise-features-breakdown)
3. [Architecture Changes](#architecture-changes)
4. [Database Schema Design](#database-schema-design)
5. [Implementation Roadmap](#implementation-roadmap)
6. [File-by-File Modification Guide](#file-by-file-modification-guide)
7. [Web/PWA Specific Considerations](#webpwa-specific-considerations)
8. [Testing Strategy](#testing-strategy)
9. [Deployment Guide](#deployment-guide)
10. [Future Android Migration Notes](#future-android-migration-notes)

---

## Overview

This guide outlines the complete integration of Splitwise functionality into Splice's web/PWA application. The goal is to combine personal budget management (existing Splice features) with group expense splitting (Splitwise features) into a unified, powerful financial management tool.

### Why Web/PWA First?

- **Faster iteration** - No APK builds, instant browser testing
- **Easier debugging** - Browser DevTools
- **Database works out of box** - Drift WASM already configured
- **Simple deployment** - Vercel with `vercel deploy` (originally Firebase Hosting)
- **Instant sharing** - Send URL to testers, no APK installation

### Project Goals

- ✅ Maintain all existing Splice personal budget features
- ✅ Add complete Splitwise group expense splitting
- ✅ Ensure seamless UI/UX integration
- ✅ Support multi-user real-time sync via **Supabase** (migrated from Firebase)
- ✅ Keep GPL-3.0 open source license

---

## Splitwise Features Breakdown

### Core Features to Implement

#### 1. **Group Management**
- Create groups with name, description, and image
- Add/remove members to/from groups
- Invite members via email/link
- Leave groups
- Archive/delete groups
- Group settings and metadata

**User Stories:**
- "As a user, I want to create a 'Roommates' group to track shared apartment expenses"
- "As a user, I want to add my friends to a trip group for our vacation"

#### 2. **Expense Splitting**
- Add expenses to groups
- Split methods:
  - **Equal split**: Divide total equally among all members
  - **Unequal split**: Specify exact amounts, percentages, or shares per person
  - **Multiple payers**: Track when multiple people pay for one expense
  - **You owe the full amount**: When someone pays for you
- Categorize shared expenses (similar to Splice's existing categories)
- Add receipt images/notes to shared expenses
- Edit/delete shared expenses

**User Stories:**
- "As a user, I want to split a ₹1500 dinner bill equally among 5 friends"
- "As a user, I want to split rent where I pay 60% and my roommate pays 40%"
- "As a user, I want to record that I paid ₹5000 for groceries that 3 people will split"

#### 3. **Balance Tracking**
- Calculate who owes whom in each group
- Debt simplification algorithm (minimize transactions)
- Show individual balance with each group member
- Show overall balance across all groups
- Balance history and trends

**User Stories:**
- "As a user, I want to see that Alice owes me ₹500 and I owe Bob ₹300"
- "As a user, I want the app to simplify debts so I pay Bob ₹200 instead of complex chains"

#### 4. **Settlements**
- Record payments between users
- Mark debts as settled
- Settlement history
- Payment methods tracking (cash, UPI, bank transfer)

**User Stories:**
- "As a user, I want to record that Alice paid me back ₹500 via UPI"
- "As a user, I want to see my settlement history with each friend"

#### 5. **Activity Feed**
- Show recent group activities
- Expense added/edited/deleted notifications
- Payment received notifications
- Member joined/left notifications
- Real-time updates

**User Stories:**
- "As a user, I want to see when someone adds a new expense to our group"
- "As a user, I want notifications when someone settles up with me"

#### 6. **Recurring Group Expenses**
- Set up recurring shared expenses (rent, utilities, subscriptions)
- Monthly, weekly, or custom intervals
- Auto-split on schedule

**User Stories:**
- "As a user, I want to automatically split rent of ₹30,000 monthly among roommates"

#### 7. **Currency Support**
- Multiple currency support per group
- Automatic conversion using real-time rates
- Show original and converted amounts

**User Stories:**
- "As a user, I want to track expenses in USD during my US trip but see them in INR"

#### 8. **Reports and Insights**
- Group spending breakdown by category
- Member contribution analysis
- Monthly/yearly group spending trends
- Export group expenses to CSV

**User Stories:**
- "As a user, I want to see how much our group spent on food vs entertainment last month"

---

## Architecture Changes

### Current Splice Architecture

```
Splice (Single User)
├── Local Database (Drift/SQLite)
├── Firebase Authentication
├── Firebase Sync (personal data)
└── Offline-first approach
```

### New Architecture with Splitwise

```
Splice + Splitwise (Multi-User)
├── Local Database (Drift/SQLite)
│   ├── Personal transactions (existing)
│   └── Group data cache (new)
├── Firebase Authentication (existing)
├── Firebase Firestore
│   ├── Personal sync (existing)
│   └── Shared groups and expenses (new)
├── Real-time listeners for group updates
└── Conflict resolution for multi-user edits
```

### Key Architectural Decisions

#### 1. **Separate vs Unified Transactions**
**Decision:** Keep separate tables for personal and shared expenses initially.

**Rationale:**
- Cleaner data model
- Easier to implement different permissions
- Can merge later if needed
- Personal expenses don't need multi-user sync overhead

#### 2. **Local-first vs Cloud-first**
**Decision:** Hybrid approach
- Personal transactions: Local-first (existing Splice behavior)
- Group expenses: Cloud-first with local cache

**Rationale:**
- Groups require real-time multi-user sync
- Can't rely on offline-first for shared data
- Personal data keeps existing offline reliability

#### 3. **Database Strategy**
**Decision:** Drift for local storage + Firestore for group sync

**Rationale:**
- Leverage Splice's existing Drift setup
- Firestore provides real-time multi-user sync
- WASM SQLite works great on web

---

## Database Schema Design

### New Tables for Drift (Local Database)

#### Table: `Groups`

```dart
class Groups extends Table {
  TextColumn get groupPk => text()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  TextColumn get imageUrl => text().nullable()();
  TextColumn get createdBy => text()(); // User ID
  DateTimeColumn get dateCreated => dateTime()();
  DateTimeColumn get dateTimeModified => dateTime().nullable()();
  BoolColumn get archived => boolean().withDefault(const Constant(false))();
  
  @override
  Set<Column> get primaryKey => {groupPk};
}
```

#### Table: `GroupMembers`

```dart
class GroupMembers extends Table {
  TextColumn get memberPk => text()();
  TextColumn get groupFk => text()(); // Foreign key to Groups
  TextColumn get userEmail => text()();
  TextColumn get userName => text()();
  TextColumn get userPhotoUrl => text().nullable()();
  DateTimeColumn get dateJoined => dateTime()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  
  @override
  Set<Column> get primaryKey => {memberPk};
}
```

#### Table: `SharedExpenses`

```dart
class SharedExpenses extends Table {
  TextColumn get expensePk => text()();
  TextColumn get groupFk => text()(); // Foreign key to Groups
  TextColumn get title => text()();
  TextColumn get description => text().nullable()();
  RealColumn get amount => real()();
  TextColumn get currency => text()();
  TextColumn get categoryFk => text().nullable()(); // Reuse existing categories
  TextColumn get paidBy => text()(); // User ID who paid
  DateTimeColumn get dateCreated => dateTime()();
  DateTimeColumn get dateTimeModified => dateTime().nullable()();
  TextColumn get imageUrl => text().nullable()(); // Receipt image
  BoolColumn get isSettled => boolean().withDefault(const Constant(false))();
  
  @override
  Set<Column> get primaryKey => {expensePk};
}
```

#### Table: `ExpenseSplits`

```dart
class ExpenseSplits extends Table {
  TextColumn get splitPk => text()();
  TextColumn get expenseFk => text()(); // Foreign key to SharedExpenses
  TextColumn get userEmail => text()(); // Who owes this split
  RealColumn get shareAmount => real()(); // How much this user owes
  RealColumn get paidAmount => real().withDefault(const Constant(0.0))(); // If user also paid
  BoolColumn get isPaid => boolean().withDefault(const Constant(false))();
  
  @override
  Set<Column> get primaryKey => {splitPk};
}
```

#### Table: `GroupBalances`

```dart
class GroupBalances extends Table {
  TextColumn get balancePk => text()();
  TextColumn get groupFk => text()();
  TextColumn get fromUserEmail => text()(); // Who owes
  TextColumn get toUserEmail => text()(); // Who is owed
  RealColumn get amount => real()(); // How much is owed
  TextColumn get currency => text()();
  DateTimeColumn get lastUpdated => dateTime()();
  
  @override
  Set<Column> get primaryKey => {balancePk};
}
```

#### Table: `Settlements`

```dart
class Settlements extends Table {
  TextColumn get settlementPk => text()();
  TextColumn get groupFk => text()();
  TextColumn get fromUserEmail => text()(); // Who paid
  TextColumn get toUserEmail => text()(); // Who received
  RealColumn get amount => real()();
  TextColumn get currency => text()();
  TextColumn get paymentMethod => text().nullable()(); // UPI, Cash, Bank Transfer
  TextColumn get notes => text().nullable()();
  DateTimeColumn get dateCreated => dateTime()();
  
  @override
  Set<Column> get primaryKey => {settlementPk};
}
```

#### Table: `GroupActivity`

```dart
class GroupActivity extends Table {
  TextColumn get activityPk => text()();
  TextColumn get groupFk => text()();
  TextColumn get activityType => text()(); // expense_added, payment_made, member_joined, etc.
  TextColumn get performedBy => text()(); // User email
  TextColumn get description => text()();
  TextColumn get relatedExpenseFk => text().nullable()();
  TextColumn get relatedSettlementFk => text().nullable()();
  DateTimeColumn get dateCreated => dateTime()();
  
  @override
  Set<Column> get primaryKey => {activityPk};
}
```

### Firestore Collections (Cloud Database)

#### Collection: `groups`

```typescript
{
  groupId: string,
  name: string,
  description: string,
  imageUrl: string,
  createdBy: string, // User UID
  members: string[], // Array of user emails
  dateCreated: Timestamp,
  dateModified: Timestamp,
  archived: boolean
}
```

#### Collection: `groups/{groupId}/expenses`

```typescript
{
  expenseId: string,
  title: string,
  description: string,
  amount: number,
  currency: string,
  category: string,
  paidBy: string, // User email
  splits: {
    [userEmail: string]: {
      shareAmount: number,
      paidAmount: number,
      isPaid: boolean
    }
  },
  dateCreated: Timestamp,
  dateModified: Timestamp,
  imageUrl: string,
  isSettled: boolean
}
```

#### Collection: `groups/{groupId}/settlements`

```typescript
{
  settlementId: string,
  fromUser: string,
  toUser: string,
  amount: number,
  currency: string,
  paymentMethod: string,
  notes: string,
  dateCreated: Timestamp
}
```

#### Collection: `groups/{groupId}/activity`

```typescript
{
  activityId: string,
  type: string,
  performedBy: string,
  description: string,
  relatedExpenseId: string,
  relatedSettlementId: string,
  dateCreated: Timestamp
}
```

#### Collection: `users/{userId}/groupMemberships`

```typescript
{
  groupId: string,
  role: string, // member, admin
  dateJoined: Timestamp,
  isActive: boolean
}
```

---

## Implementation Roadmap

### Phase 1: Database Setup (Week 1)
**Estimated Time:** 5-7 days

#### Tasks:
1. **Update schema version**
   - Bump `schemaVersionGlobal` in `budget/lib/database/tables.dart`
   - Current schema version can be found at the top of `tables.dart`

2. **Add new table definitions**
   - Add all 7 new tables to `tables.dart`
   - Follow existing table patterns in the file
   - Use proper Drift annotations

3. **Generate Drift schema**
   ```bash
   cd budget
   dart run build_runner build
   ```

4. **Export new schema version**
   ```bash
   dart run drift_dev schema dump lib/database/tables.dart drift_schemas/drift_schema_v[NEW_VERSION].json
   ```

5. **Generate migration steps**
   ```bash
   dart run drift_dev schema steps drift_schemas/ lib/database/schema_versions.dart
   ```

6. **Implement migration strategy**
   - Edit `stepByStep()` function in `tables.dart`
   - Add CREATE TABLE statements for new tables
   - Test migration on clean database
   - Test migration on existing user database

7. **Create data models**
   - Create Dart classes in `budget/lib/struct/` for each new entity
   - Follow pattern from existing `transaction.dart`, `budget.dart` etc.

**Files to Modify:**
- `budget/lib/database/tables.dart` (add tables)
- `budget/lib/database/schema_versions.dart` (auto-generated)
- `budget/lib/struct/group.dart` (new file)
- `budget/lib/struct/shared_expense.dart` (new file)
- `budget/lib/struct/expense_split.dart` (new file)
- `budget/lib/struct/settlement.dart` (new file)

**Testing Checklist:**
- [ ] Clean install creates all tables
- [ ] Migration from current version works
- [ ] Foreign key constraints work
- [ ] All CRUD operations work on new tables

---

### Phase 2: Firebase Firestore Setup (Week 1-2)
**Estimated Time:** 3-5 days

#### Tasks:
1. **Update Firebase configuration**
   - Ensure Firestore is enabled in Firebase Console
   - Update `budget/lib/firebase_options.dart` if needed

2. **Create Firestore service layer**
   - Create `budget/lib/database/firestore_groups.dart`
   - Implement CRUD operations for groups
   - Implement real-time listeners

3. **Set up Firestore Security Rules**
   ```javascript
   rules_version = '2';
   service cloud.firestore {
     match /databases/{database}/documents {
       // Groups
       match /groups/{groupId} {
         allow read: if request.auth != null && 
                     request.auth.token.email in resource.data.members;
         allow create: if request.auth != null;
         allow update: if request.auth != null && 
                       request.auth.token.email in resource.data.members;
         allow delete: if request.auth != null && 
                       request.auth.token.email == resource.data.createdBy;
         
         // Group expenses subcollection
         match /expenses/{expenseId} {
           allow read: if request.auth != null && 
                       request.auth.token.email in get(/databases/$(database)/documents/groups/$(groupId)).data.members;
           allow write: if request.auth != null && 
                        request.auth.token.email in get(/databases/$(database)/documents/groups/$(groupId)).data.members;
         }
         
         // Settlements subcollection
         match /settlements/{settlementId} {
           allow read: if request.auth != null && 
                       request.auth.token.email in get(/databases/$(database)/documents/groups/$(groupId)).data.members;
           allow write: if request.auth != null && 
                        request.auth.token.email in get(/databases/$(database)/documents/groups/$(groupId)).data.members;
         }
         
         // Activity subcollection
         match /activity/{activityId} {
           allow read: if request.auth != null && 
                       request.auth.token.email in get(/databases/$(database)/documents/groups/$(groupId)).data.members;
           allow create: if request.auth != null && 
                         request.auth.token.email in get(/databases/$(database)/documents/groups/$(groupId)).data.members;
         }
       }
       
       // User group memberships
       match /users/{userId}/groupMemberships/{groupId} {
         allow read, write: if request.auth != null && request.auth.uid == userId;
       }
     }
   }
   ```

4. **Implement sync service**
   - Create `budget/lib/database/sync_groups.dart`
   - Sync local Drift DB ↔️ Firestore
   - Handle conflict resolution
   - Implement retry logic

5. **Add Firestore packages to pubspec.yaml**
   ```yaml
   dependencies:
     cloud_firestore: ^4.15.0
     cloud_firestore_web: ^3.10.0
   ```

**Files to Create:**
- `budget/lib/database/firestore_groups.dart`
- `budget/lib/database/sync_groups.dart`

**Files to Modify:**
- `budget/pubspec.yaml` (add dependencies)
- `budget/web/index.html` (ensure Firestore scripts loaded)
- Firebase Console (security rules)

**Testing Checklist:**
- [ ] Can create group in Firestore
- [ ] Real-time listener updates local DB
- [ ] Security rules prevent unauthorized access
- [ ] Offline changes sync when online
- [ ] Multiple users see same data in real-time

---

### Phase 3: UI Components (Week 2-3)
**Estimated Time:** 7-10 days

#### Tasks:

1. **Create group list page**
   - File: `budget/lib/pages/groups_page.dart`
   - Show all groups user is part of
   - Display group name, members, balance owed/owing
   - Add FAB to create new group
   - Reuse existing Splice list widgets where possible

2. **Create group details page**
   - File: `budget/lib/pages/group_details_page.dart`
   - Show group info (name, members, total expenses)
   - List all expenses in group
   - Show balances between members
   - Tabs: Expenses | Balances | Activity
   - Edit/delete group options

3. **Create add/edit group page**
   - File: `budget/lib/pages/add_group_page.dart`
   - Form: group name, description, image
   - Add members (email input)
   - Validate inputs
   - Save to both Drift and Firestore

4. **Create add shared expense page**
   - File: `budget/lib/pages/add_shared_expense_page.dart`
   - Amount input (reuse Splice's amount widget)
   - Category selection (reuse existing categories)
   - Split type selector:
     - Equal split (default)
     - Unequal split
     - Custom amounts
   - Member selection with checkboxes
   - Paid by selector
   - Notes and image upload

5. **Create expense split calculator widget**
   - File: `budget/lib/widgets/expense_split_widget.dart`
   - Interactive split calculation
   - Real-time updates as user adjusts
   - Show each person's share
   - Validate total equals expense amount

6. **Create balance summary widget**
   - File: `budget/lib/widgets/group_balance_widget.dart`
   - Show simplified balances
   - "You owe [Person] ₹X"
   - "You are owed ₹Y overall"
   - Visual indicators (red for owe, green for owed)
   - Tap to settle up

7. **Create settle up page**
   - File: `budget/lib/pages/settle_up_page.dart`
   - Select who to settle with
   - Enter amount
   - Payment method dropdown
   - Notes field
   - Record settlement

8. **Create activity feed widget**
   - File: `budget/lib/widgets/group_activity_feed.dart`
   - List recent activities
   - Icons for different activity types
   - Time ago (e.g., "2 hours ago")
   - Real-time updates

9. **Update home page navigation**
   - File: `budget/lib/pages/home_page.dart`
   - Add "Groups" tab to bottom navigation
   - Badge showing outstanding balance count
   - Smooth navigation between personal and group views

10. **Update settings page**
    - File: `budget/lib/pages/settings_page.dart`
    - Add group preferences section
    - Default split method
    - Notification preferences

**Files to Create:**
- `budget/lib/pages/groups_page.dart`
- `budget/lib/pages/group_details_page.dart`
- `budget/lib/pages/add_group_page.dart`
- `budget/lib/pages/add_shared_expense_page.dart`
- `budget/lib/pages/settle_up_page.dart`
- `budget/lib/widgets/expense_split_widget.dart`
- `budget/lib/widgets/group_balance_widget.dart`
- `budget/lib/widgets/group_activity_feed.dart`
- `budget/lib/widgets/group_member_avatar.dart`

**Files to Modify:**
- `budget/lib/pages/home_page.dart` (add navigation)
- `budget/lib/pages/settings_page.dart` (add group settings)

**Design Guidelines:**
- Follow Splice's Material You design patterns
- Reuse existing color schemes from `colors.dart`
- Match existing transaction card designs for expense cards
- Use consistent padding and spacing
- Support both light and dark themes
- Ensure responsive design for different screen sizes

**Testing Checklist:**
- [ ] Can navigate to all new pages
- [ ] Forms validate correctly
- [ ] Lists scroll smoothly
- [ ] Real-time updates work
- [ ] Dark mode works correctly
- [ ] Responsive on mobile and desktop browsers

---

### Phase 4: Business Logic (Week 3-4)
**Estimated Time:** 7-10 days

#### Tasks:

1. **Implement expense splitting logic**
   - File: `budget/lib/functions/split_calculator.dart`
   
   ```dart
   class SplitCalculator {
     // Equal split
     static Map<String, double> calculateEqualSplit(
       double totalAmount, 
       List<String> members
     ) {
       final sharePerPerson = totalAmount / members.length;
       return {for (var member in members) member: sharePerPerson};
     }
     
     // Unequal split by percentage
     static Map<String, double> calculatePercentageSplit(
       double totalAmount,
       Map<String, double> percentages
     ) {
       // Validate percentages sum to 100
       // Calculate amounts
     }
     
     // Custom amounts
     static Map<String, double> calculateCustomSplit(
       Map<String, double> customAmounts
     ) {
       // Validate amounts match total
     }
     
     // Split by shares
     static Map<String, double> calculateShareSplit(
       double totalAmount,
       Map<String, int> shares
     ) {
       final totalShares = shares.values.reduce((a, b) => a + b);
       final amountPerShare = totalAmount / totalShares;
       return shares.map((user, share) => 
         MapEntry(user, share * amountPerShare)
       );
     }
   }
   ```

2. **Implement debt simplification algorithm**
   - File: `budget/lib/functions/debt_simplifier.dart`
   
   ```dart
   class DebtSimplifier {
     // Simplify debts using greedy algorithm
     static List<DebtTransaction> simplifyDebts(
       Map<String, double> netBalances
     ) {
       List<DebtTransaction> transactions = [];
       
       // Separate creditors (positive) and debtors (negative)
       var creditors = netBalances.entries
         .where((e) => e.value > 0.01)
         .toList()
         ..sort((a, b) => b.value.compareTo(a.value));
       
       var debtors = netBalances.entries
         .where((e) => e.value < -0.01)
         .map((e) => MapEntry(e.key, -e.value))
         .toList()
         ..sort((a, b) => b.value.compareTo(a.value));
       
       // Match largest creditor with largest debtor
       int i = 0, j = 0;
       while (i < creditors.length && j < debtors.length) {
         final creditor = creditors[i];
         final debtor = debtors[j];
         
         final amount = min(creditor.value, debtor.value);
         
         transactions.add(DebtTransaction(
           from: debtor.key,
           to: creditor.key,
           amount: amount,
         ));
         
         creditors[i] = MapEntry(creditor.key, creditor.value - amount);
         debtors[j] = MapEntry(debtor.key, debtor.value - amount);
         
         if (creditors[i].value < 0.01) i++;
         if (debtors[j].value < 0.01) j++;
       }
       
       return transactions;
     }
     
     // Calculate net balances for a group
     static Map<String, double> calculateNetBalances(
       List<SharedExpense> expenses,
       List<Settlement> settlements
     ) {
       Map<String, double> balances = {};
       
       // Process expenses
       for (var expense in expenses) {
         // Payer gets credited
         balances[expense.paidBy] = 
           (balances[expense.paidBy] ?? 0) + expense.amount;
         
         // Each split member gets debited
         for (var split in expense.splits) {
           balances[split.userEmail] = 
             (balances[split.userEmail] ?? 0) - split.shareAmount;
         }
       }
       
       // Process settlements
       for (var settlement in settlements) {
         balances[settlement.fromUser] = 
           (balances[settlement.fromUser] ?? 0) + settlement.amount;
         balances[settlement.toUser] = 
           (balances[settlement.toUser] ?? 0) - settlement.amount;
       }
       
       return balances;
     }
   }
   
   class DebtTransaction {
     final String from;
     final String to;
     final double amount;
     
     DebtTransaction({required this.from, required this.to, required this.amount});
   }
   ```

3. **Implement group operations**
   - File: `budget/lib/database/operations/group_operations.dart`
   
   ```dart
   // Create group
   Future<Group> createGroup(String name, String description, List<String> members)
   
   // Add member to group
   Future<void> addMemberToGroup(String groupId, String userEmail)
   
   // Remove member from group
   Future<void> removeMemberFromGroup(String groupId, String userEmail)
   
   // Delete group
   Future<void> deleteGroup(String groupId)
   
   // Archive group
   Future<void> archiveGroup(String groupId)
   ```

4. **Implement shared expense operations**
   - File: `budget/lib/database/operations/shared_expense_operations.dart`
   
   ```dart
   // Add shared expense
   Future<SharedExpense> addSharedExpense({
     required String groupId,
     required String title,
     required double amount,
     required String paidBy,
     required Map<String, double> splits,
     String? category,
     String? notes,
   })
   
   // Edit shared expense
   Future<void> editSharedExpense(String expenseId, Map<String, dynamic> updates)
   
   // Delete shared expense
   Future<void> deleteSharedExpense(String expenseId)
   
   // Get group expenses
   Future<List<SharedExpense>> getGroupExpenses(String groupId)
   
   // Get user expenses across all groups
   Future<List<SharedExpense>> getUserSharedExpenses(String userEmail)
   ```

5. **Implement settlement operations**
   - File: `budget/lib/database/operations/settlement_operations.dart`
   
   ```dart
   // Record settlement
   Future<Settlement> recordSettlement({
     required String groupId,
     required String fromUser,
     required String toUser,
     required double amount,
     String? paymentMethod,
     String? notes,
   })
   
   // Get settlements between two users
   Future<List<Settlement>> getSettlementsBetweenUsers(
     String groupId, 
     String user1, 
     String user2
   )
   
   // Get all settlements in group
   Future<List<Settlement>> getGroupSettlements(String groupId)
   ```

6. **Implement balance calculator service**
   - File: `budget/lib/services/balance_service.dart`
   
   ```dart
   class BalanceService {
     // Calculate and update all balances for a group
     static Future<void> recalculateGroupBalances(String groupId)
     
     // Get user's total balance across all groups
     static Future<double> getUserTotalBalance(String userEmail)
     
     // Get balance between two users
     static Future<double> getBalanceBetweenUsers(
       String groupId,
       String user1,
       String user2
     )
     
     // Get simplified debts for a group
     static Future<List<DebtTransaction>> getSimplifiedDebts(String groupId)
   }
   ```

7. **Implement activity logger**
   - File: `budget/lib/services/activity_logger.dart`
   
   ```dart
   class ActivityLogger {
     static Future<void> logExpenseAdded(
       String groupId,
       String performedBy,
       SharedExpense expense
     )
     
     static Future<void> logSettlementMade(
       String groupId,
       String performedBy,
       Settlement settlement
     )
     
     static Future<void> logMemberJoined(
       String groupId,
       String memberEmail
     )
     
     static Future<void> logMemberLeft(
       String groupId,
       String memberEmail
     )
   }
   ```

8. **Implement notification service**
   - File: `budget/lib/services/notification_service.dart`
   
   ```dart
   class NotificationService {
     // Web push notifications for group activities
     static Future<void> sendGroupNotification(
       String groupId,
       String message,
       List<String> recipients
     )
     
     // In-app notification badge
     static Future<int> getUnreadNotificationCount(String userEmail)
   }
   ```

**Files to Create:**
- `budget/lib/functions/split_calculator.dart`
- `budget/lib/functions/debt_simplifier.dart`
- `budget/lib/database/operations/group_operations.dart`
- `budget/lib/database/operations/shared_expense_operations.dart`
- `budget/lib/database/operations/settlement_operations.dart`
- `budget/lib/services/balance_service.dart`
- `budget/lib/services/activity_logger.dart`
- `budget/lib/services/notification_service.dart`

**Testing Checklist:**
- [ ] Equal split calculation is correct
- [ ] Unequal split validates properly
- [ ] Debt simplification produces minimal transactions
- [ ] Balance calculation accounts for all expenses and settlements
- [ ] Activity logging works for all event types
- [ ] Edge cases handled (empty groups, zero amounts, etc.)

---

### Phase 5: Integration & Polish (Week 4-5)
**Estimated Time:** 7-10 days

#### Tasks:

1. **Integrate with existing Splice features**
   - Allow converting personal expenses to shared expenses
   - Link categories between personal and shared expenses
   - Unified search across personal and shared expenses
   - Combined reports (personal + group spending)

2. **Add group expense filtering**
   - Filter by date range
   - Filter by category
   - Filter by member
   - Filter by settled/unsettled

3. **Implement group invitation system**
   - Generate shareable group invite links
   - Email invitations
   - Accept/decline invitations
   - Invitation expiry

4. **Add currency conversion for groups**
   - Support multi-currency groups
   - Real-time exchange rates
   - Show amounts in user's preferred currency

5. **Implement export features**
   - Export group expenses to CSV
   - Generate PDF reports for groups
   - Share group summary

6. **Add recurring group expenses**
   - Create recurring expense templates
   - Auto-create expenses on schedule
   - Edit/pause recurring expenses

7. **Implement group search**
   - Search expenses within group
   - Search across all groups
   - Search by amount, title, category, member

8. **Add data validation**
   - Validate all inputs
   - Prevent negative amounts
   - Ensure splits sum to total
   - Check member permissions

9. **Error handling**
   - Graceful offline handling
   - Sync conflict resolution
   - User-friendly error messages
   - Retry failed operations

10. **Performance optimization**
    - Lazy load expense lists
    - Paginate large groups
    - Cache frequently accessed data
    - Optimize Firestore queries

**Files to Modify:**
- `budget/lib/pages/transaction_page.dart` (add convert to shared option)
- `budget/lib/functions.dart` (add helper functions)
- `budget/lib/widgets/transaction_entries.dart` (show shared expenses)

**Testing Checklist:**
- [ ] Personal to shared conversion works
- [ ] Search finds correct results
- [ ] Filters work correctly
- [ ] Invitations are sent and accepted
- [ ] Currency conversion is accurate
- [ ] Exports generate correct data
- [ ] Recurring expenses auto-create
- [ ] All inputs validate properly
- [ ] Errors display helpful messages
- [ ] App performs well with large data sets

---

### Phase 6: Testing & Bug Fixes (Week 5-6)
**Estimated Time:** 7-10 days

#### Testing Strategy:

1. **Unit Tests**
   - Test split calculation functions
   - Test debt simplification algorithm
   - Test balance calculations
   - Test all CRUD operations

2. **Integration Tests**
   - Test Drift ↔️ Firestore sync
   - Test multi-user scenarios
   - Test conflict resolution
   - Test offline → online sync

3. **UI Tests**
   - Test all navigation flows
   - Test form validations
   - Test responsive layouts
   - Test dark mode

4. **Multi-user Testing**
   - Create test group with 3-5 test accounts
   - Add expenses from different accounts
   - Settle up between users
   - Verify real-time updates

5. **Performance Testing**
   - Test with 100+ expenses in a group
   - Test with 10+ groups
   - Test sync performance
   - Test app startup time

6. **Browser Compatibility**
   - Chrome/Edge (Chromium)
   - Firefox
   - Safari
   - Mobile browsers

**Create Test Files:**
- `budget/test/split_calculator_test.dart`
- `budget/test/debt_simplifier_test.dart`
- `budget/test/group_operations_test.dart`
- `budget/test/balance_service_test.dart`

**Testing Checklist:**
- [ ] All unit tests pass
- [ ] Integration tests pass
- [ ] UI tests pass
- [ ] Multi-user scenarios work correctly
- [ ] Performance is acceptable
- [ ] Works in all target browsers
- [ ] No memory leaks
- [ ] Proper error handling throughout

---

## File-by-File Modification Guide

### Core Files to Modify

#### 1. `budget/lib/database/tables.dart`

**What to do:**
- Add 7 new table definitions (Groups, GroupMembers, SharedExpenses, etc.)
- Increment `schemaVersionGlobal` by 1
- Add new tables to `@DriftDatabase` annotation

**Example:**
```dart
// At the top of the file
int schemaVersionGlobal = 39; // Increment this

// In the file
@DriftDatabase(
  tables: [
    // Existing tables...
    Transactions,
    Categories,
    Wallets,
    Budgets,
    // Add new tables
    Groups,
    GroupMembers,
    SharedExpenses,
    ExpenseSplits,
    GroupBalances,
    Settlements,
    GroupActivity,
  ],
)
```

**Steps:**
1. Backup current `tables.dart`
2. Add table class definitions at the end of file
3. Update `@DriftDatabase` annotation
4. Increment schema version
5. Run `dart run build_runner build`
6. Fix any compilation errors

---

#### 2. `budget/lib/main.dart`

**What to do:**
- Initialize Firestore for web
- Add any global providers for groups

**Add to imports:**
```dart
import 'package:cloud_firestore/cloud_firestore.dart';
```

**Add to `main()` function:**
```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  // Initialize Firestore with web-specific settings
  if (kIsWeb) {
    FirebaseFirestore.instance.settings = const Settings(
      persistenceEnabled: true,
      cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
    );
  }
  
  // Rest of existing initialization...
  runApp(MyApp());
}
```

---

#### 3. `budget/lib/pages/home_page.dart`

**What to do:**
- Add "Groups" tab to bottom navigation
- Show badge with outstanding balance count

**Modify bottom navigation:**
```dart
BottomNavigationBar(
  currentIndex: _selectedIndex,
  items: [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.account_balance_wallet),
      label: 'Accounts',
    ),
    // Add this new item
    BottomNavigationBarItem(
      icon: Badge(
        label: Text('3'), // Count of groups with unsettled balances
        child: Icon(Icons.group),
      ),
      label: 'Groups',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),
  ],
  onTap: _onTabTapped,
)
```

**Add navigation case:**
```dart
void _onTabTapped(int index) {
  if (index == 2) {
    pushRoute(context, GroupsPage());
  } else {
    // Existing navigation logic
  }
}
```

---

#### 4. `budget/pubspec.yaml`

**What to add:**
```yaml
dependencies:
  # Existing dependencies...
  
  # Firestore for groups
  cloud_firestore: ^4.15.0
  cloud_firestore_web: ^3.10.0
  
  # For UUID generation
  uuid: ^4.3.3
  
  # For image upload (receipts)
  image_picker: ^1.0.7
  firebase_storage: ^11.6.0
  firebase_storage_web: ^3.6.11
  
  # For better date handling
  intl: ^0.18.1
```

**After adding:**
```bash
cd budget
flutter pub get
```

---

#### 5. `budget/web/index.html`

**What to do:**
- Ensure Firestore SDK is loaded

**Check if present (usually already there from Firebase auth):**
```html
<script src="https://www.gstatic.com/firebasejs/10.7.1/firebase-app-compat.js"></script>
<script src="https://www.gstatic.com/firebasejs/10.7.1/firebase-firestore-compat.js"></script>
<script src="https://www.gstatic.com/firebasejs/10.7.1/firebase-auth-compat.js"></script>
<script src="https://www.gstatic.com/firebasejs/10.7.1/firebase-storage-compat.js"></script>
```

---

#### 6. `budget/lib/struct/` (New Files)

**Create these model files:**

**`budget/lib/struct/group.dart`:**
```dart
class Group {
  final String groupPk;
  final String name;
  final String? description;
  final String? imageUrl;
  final String createdBy;
  final DateTime dateCreated;
  final DateTime? dateTimeModified;
  final bool archived;
  final List<String> members;
  
  Group({
    required this.groupPk,
    required this.name,
    this.description,
    this.imageUrl,
    required this.createdBy,
    required this.dateCreated,
    this.dateTimeModified,
    required this.archived,
    required this.members,
  });
  
  // Add toJson, fromJson, copyWith methods
}
```

**`budget/lib/struct/shared_expense.dart`:**
```dart
class SharedExpense {
  final String expensePk;
  final String groupFk;
  final String title;
  final String? description;
  final double amount;
  final String currency;
  final String? categoryFk;
  final String paidBy;
  final DateTime dateCreated;
  final DateTime? dateTimeModified;
  final String? imageUrl;
  final bool isSettled;
  final Map<String, ExpenseSplit> splits;
  
  SharedExpense({
    required this.expensePk,
    required this.groupFk,
    required this.title,
    this.description,
    required this.amount,
    required this.currency,
    this.categoryFk,
    required this.paidBy,
    required this.dateCreated,
    this.dateTimeModified,
    this.imageUrl,
    required this.isSettled,
    required this.splits,
  });
  
  // Add toJson, fromJson, copyWith methods
}
```

Create similar files for:
- `expense_split.dart`
- `settlement.dart`
- `group_balance.dart`
- `group_activity.dart`

---

#### 7. Firebase Security Rules

**In Firebase Console → Firestore → Rules:**

Copy the rules provided in Phase 2 above.

**Test rules:**
```bash
firebase deploy --only firestore:rules
```

---

### Web/PWA Specific Files

#### 1. `budget/web/manifest.json`

**What to check:**
- Ensure app name is updated if you rename
- Icons are present
- Start URL is correct

**Current structure should work as-is for groups feature.**

---

#### 2. `budget/web/worker.sql-wasm.js`

**No modifications needed** - This handles SQLite WASM for Drift. It already supports all database operations including new tables.

---

## Web/PWA Specific Considerations

### 1. Local Storage Limits

**Issue:** Browsers limit IndexedDB/localStorage  
**Solution:**
- Implement pagination for expense lists
- Cache only recent data locally
- Use Firestore as source of truth
- Periodically clean old cached data

**Implementation:**
```dart
// In your sync service
Future<void> cleanOldCache() async {
  final cutoffDate = DateTime.now().subtract(Duration(days: 90));
  await database.delete(database.sharedExpenses)
    .where((e) => e.dateCreated.isSmallerThan(Variable(cutoffDate)))
    .go();
}
```

### 2. Offline Support

**Challenge:** Groups require real-time sync  
**Solution:**
- Show cached data when offline
- Queue writes for when online
- Display "offline" indicator
- Show last sync timestamp

**Implementation:**
```dart
class SyncStatus {
  static bool isOnline = true;
  static DateTime? lastSyncTime;
  
  static Stream<bool> get onlineStatus =>
    // Listen to connectivity changes
    Connectivity().onConnectivityChanged.map((result) => 
      result != ConnectivityResult.none
    );
}
```

### 3. Performance Optimization

**Web-specific optimizations:**

1. **Lazy Load Images**
   ```dart
   // Use cached_network_image package
   CachedNetworkImage(
     imageUrl: expense.imageUrl,
     placeholder: (context, url) => CircularProgressIndicator(),
     errorWidget: (context, url, error) => Icon(Icons.error),
   )
   ```

2. **Virtualized Lists**
   ```dart
   // Use ListView.builder for large lists
   ListView.builder(
     itemCount: expenses.length,
     itemBuilder: (context, index) => ExpenseCard(expenses[index]),
   )
   ```

3. **Optimize Firestore Queries**
   ```dart
   // Use limits and pagination
   FirebaseFirestore.instance
     .collection('groups')
     .doc(groupId)
     .collection('expenses')
     .orderBy('dateCreated', descending: true)
     .limit(20) // Load only 20 at a time
     .snapshots();
   ```

### 4. PWA Features

**Add to `index.html`:**
```html
<head>
  <!-- ... existing meta tags ... -->
  
  <!-- PWA Meta Tags -->
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
  <meta name="apple-mobile-web-app-title" content="Splice">
  
  <!-- Theme color -->
  <meta name="theme-color" content="#6750A4">
</head>
```

**Service Worker for Offline:**
The Flutter build automatically generates a service worker. Ensure it's registered in `index.html`:
```html
<script>
  if ('serviceWorker' in navigator) {
    window.addEventListener('flutter-first-frame', function () {
      navigator.serviceWorker.register('flutter_service_worker.js');
    });
  }
</script>
```

### 5. Web Push Notifications

**Setup:**
1. Generate VAPID keys in Firebase Console
2. Request notification permission
3. Handle notification clicks

**Implementation:**
```dart
import 'package:firebase_messaging/firebase_messaging.dart';

class WebNotifications {
  static Future<void> requestPermission() async {
    if (kIsWeb) {
      NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );
      
      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        // Get token
        String? token = await FirebaseMessaging.instance.getToken(
          vapidKey: "YOUR_VAPID_KEY",
        );
        // Save token to Firestore
      }
    }
  }
  
  static Future<void> setupMessageHandler() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Show in-app notification
      showInAppNotification(message);
    });
  }
}
```

### 6. Browser-Specific Issues

**Safari:**
- IndexedDB size limits are stricter
- Service worker behavior differs
- Test thoroughly on iOS Safari

**Firefox:**
- IndexedDB performance can be slower
- Test with large datasets

**Mobile Browsers:**
- Smaller screens - ensure responsive design
- Touch interactions - add proper tap targets (min 44x44px)
- Viewport height issues with keyboard

**Testing Matrix:**
| Browser | Desktop | Mobile | Priority |
|---------|---------|--------|----------|
| Chrome | ✅ | ✅ | High |
| Safari | ✅ | ✅ | High |
| Firefox | ✅ | ✅ | Medium |
| Edge | ✅ | ✅ | Medium |

---

## Testing Strategy

### Local Testing

**Run in Chrome:**
```bash
cd budget
flutter run -d chrome
```

**Run in web server mode:**
```bash
flutter run -d web-server --web-port=8080
```

**Test responsive design:**
1. Open Chrome DevTools (F12)
2. Click device toolbar icon (Ctrl+Shift+M)
3. Test different device sizes

### Multi-User Testing

**Setup test accounts:**
1. Create 3-5 Firebase test accounts
   - testuser1@example.com
   - testuser2@example.com
   - etc.

2. Open app in multiple browser windows (incognito mode)
3. Log in with different accounts
4. Create a group and add all test users
5. Add expenses from different accounts
6. Verify real-time updates across windows

**Test scenarios:**
- [ ] User A creates group, User B joins
- [ ] User A adds expense, User B sees it immediately
- [ ] User A settles with User B, balances update
- [ ] User A goes offline, adds expense, comes online, syncs
- [ ] Both users edit same expense simultaneously (conflict)

### Performance Testing

**Test with large data:**
```dart
// Create script to generate test data
Future<void> generateTestData() async {
  final groupId = 'test-group-123';
  
  // Create 100 expenses
  for (int i = 0; i < 100; i++) {
    await addSharedExpense(
      groupId: groupId,
      title: 'Test Expense $i',
      amount: Random().nextDouble() * 1000,
      paidBy: 'testuser1@example.com',
      splits: {
        'testuser1@example.com': 500,
        'testuser2@example.com': 500,
      },
    );
  }
}
```

**Measure:**
- Page load time
- List scroll performance
- Sync latency
- Memory usage

**Tools:**
- Chrome DevTools → Performance tab
- Chrome DevTools → Network tab
- Lighthouse audit

### Automated Tests

**Unit tests:**
```bash
cd budget
flutter test test/split_calculator_test.dart
```

**Integration tests:**
```bash
flutter test integration_test/group_flow_test.dart -d chrome
```

---

## Deployment Guide

### Pre-Deployment Checklist

- [ ] All tests pass
- [ ] No console errors
- [ ] Tested in all target browsers
- [ ] Performance is acceptable
- [ ] Firestore rules are set
- [ ] Security rules tested
- [ ] Environment variables set
- [ ] Version number updated in `pubspec.yaml`

### Build for Production

```bash
cd budget

# Build web app
flutter build web --release

# Output is in build/web/
```

### Deploy to Firebase Hosting

**1. Install Firebase CLI (if not already):**
```bash
npm install -g firebase-tools
```

**2. Login to Firebase:**
```bash
firebase login
```

**3. Initialize Firebase (if first time):**
```bash
cd budget
firebase init hosting
```

Select:
- Public directory: `build/web`
- Configure as single-page app: Yes
- Set up automatic builds: No

**4. Deploy:**
```bash
firebase deploy --only hosting
```

**5. Verify deployment:**
```bash
firebase hosting:channel:open live
```

### Deploy Firestore Rules

```bash
firebase deploy --only firestore:rules
```

### Post-Deployment Testing

1. Open deployed URL
2. Test authentication
3. Create test group
4. Add test expense
5. Verify real-time sync
6. Test on mobile browser
7. Test PWA install

### Monitoring

**Firebase Console:**
- Monitor Firestore usage
- Check authentication logs
- Review hosting analytics

**Set up alerts:**
- Firestore read/write limits
- Authentication errors
- Hosting bandwidth

---

## Future Android Migration Notes

When you're ready to port to Android, here's what you need to know:

### What Transfers Automatically

✅ **All business logic** (`lib/functions/`, `lib/services/`)  
✅ **All UI code** (`lib/pages/`, `lib/widgets/`)  
✅ **Database code** (`lib/database/`)  
✅ **Models** (`lib/struct/`)  
✅ **90% of your codebase**

### What Needs Platform-Specific Work

#### 1. **Notifications**
- Web: Firebase Cloud Messaging (FCM) for web push
- Android: FCM with native notification channels

**Files to modify:**
- `budget/android/app/src/main/AndroidManifest.xml` (add notification permissions)
- Create `budget/android/app/src/main/kotlin/.../NotificationService.kt`

#### 2. **Image Upload**
- Web: Works with `image_picker` web version
- Android: Needs camera and gallery permissions

**Add to AndroidManifest.xml:**
```xml
<uses-permission android:name="android.permission.CAMERA" />
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
```

#### 3. **Offline Storage**
- Web: IndexedDB (limited to ~50MB typically)
- Android: SQLite (no practical limit)

No code changes needed, but Android will have better offline performance.

#### 4. **Biometric Auth**
If you add group permissions/privacy:
- Web: Not available
- Android: Use `local_auth` package

#### 5. **Background Sync**
- Web: Limited (service workers)
- Android: Full background sync capability

### Android Build Checklist

```bash
# 1. Test on Android emulator
flutter run -d emulator-5554

# 2. Test on physical device
flutter run -d <device-id>

# 3. Build debug APK
flutter build apk --debug

# 4. Build release APK
flutter build apk --release

# 5. Build app bundle (for Play Store)
flutter build appbundle --release
```

### Testing Android-Specific Features

- [ ] Push notifications work
- [ ] Camera/gallery access works
- [ ] Biometric auth works
- [ ] Background sync works
- [ ] Offline mode better performance
- [ ] Battery optimization doesn't kill sync

---

## Quick Reference Commands

### Development
```bash
# Run on Chrome
flutter run -d chrome

# Run with hot reload
flutter run -d chrome --hot

# Clean build
flutter clean && flutter pub get

# Generate Drift code
dart run build_runner build

# Watch mode (auto-regenerate)
dart run build_runner watch
```

### Database
```bash
# Export schema
dart run drift_dev schema dump lib/database/tables.dart drift_schemas/drift_schema_v[VERSION].json

# Generate migrations
dart run drift_dev schema steps drift_schemas/ lib/database/schema_versions.dart
```

### Firebase
```bash
# Deploy everything
firebase deploy

# Deploy only hosting
firebase deploy --only hosting

# Deploy only Firestore rules
firebase deploy --only firestore:rules

# View logs
firebase functions:log
```

### Testing
```bash
# Run all tests
flutter test

# Run specific test
flutter test test/split_calculator_test.dart

# Run integration tests
flutter test integration_test/
```

### Build
```bash
# Build web (release)
flutter build web --release

# Build web (debug)
flutter build web --debug

# Build and serve locally
flutter build web && cd build/web && python -m http.server 8000
```

---

## Troubleshooting

### Common Issues

#### 1. **Firestore Permission Denied**
**Error:** `PERMISSION_DENIED: Missing or insufficient permissions`

**Solution:**
- Check security rules in Firebase Console
- Verify user is authenticated
- Ensure user email is in group members list

#### 2. **Drift Migration Failed**
**Error:** `Migration failed: table already exists`

**Solution:**
```dart
// In tables.dart, in the migration handler:
await m.alterTable(TableMigration(database.groups));
```

#### 3. **Web Build Fails**
**Error:** `Failed to compile application`

**Solution:**
```bash
flutter clean
flutter pub get
flutter build web --release
```

#### 4. **Real-time Updates Not Working**
**Issue:** Changes not appearing for other users

**Solution:**
- Check Firestore listeners are set up
- Verify internet connection
- Check browser console for errors
- Ensure StreamBuilder is used correctly

#### 5. **Balance Calculation Incorrect**
**Issue:** Balances don't match expected values

**Solution:**
- Add debug logging to `calculateNetBalances()`
- Verify all expenses have correct splits
- Check settlement records
- Ensure amounts are using correct signs (+ for credit, - for debit)

---

## Performance Benchmarks

Target performance metrics for web:

| Metric | Target | Acceptable |
|--------|--------|------------|
| Initial load time | < 2s | < 4s |
| Time to interactive | < 3s | < 5s |
| List scroll (100 items) | 60 FPS | 30 FPS |
| Firestore query | < 500ms | < 1s |
| Sync latency | < 1s | < 2s |
| Memory usage | < 100MB | < 200MB |

**How to measure:**
1. Open Chrome DevTools
2. Go to Performance tab
3. Record while performing actions
4. Analyze flame chart

---

## Resources

### Documentation
- [Flutter Web](https://flutter.dev/web)
- [Drift Database](https://drift.simonbinder.eu/)
- [Firebase Firestore](https://firebase.google.com/docs/firestore)
- [Material Design 3](https://m3.material.io/)

### Helpful Packages
- `cloud_firestore` - Firestore SDK
- `drift` - SQL database
- `uuid` - Generate unique IDs
- `intl` - Internationalization
- `cached_network_image` - Image caching
- `connectivity_plus` - Network status

### Community Resources
- [Flutter Discord](https://discord.gg/flutter)
- [r/FlutterDev](https://reddit.com/r/FlutterDev)
- [Stack Overflow - Flutter](https://stackoverflow.com/questions/tagged/flutter)

---

## Changelog

### Version 1.0 (Feb 3, 2026)
- Initial guide created
- Database schema defined
- Implementation roadmap outlined
- Web/PWA specific guidance added

---

## Contributing

Since Splice is GPL-3.0 licensed, your modifications must also be open source. When sharing this project:

1. Keep GPL-3.0 license
2. Attribute original Splice author (jameskokoska)
3. Document your changes
4. Share source code with users

---

## License

This integration follows Splice's GPL-3.0 license. See [LICENSE](LICENSE) file.

---

## Contact

**Repository:** https://github.com/msrishav-28/Splice  
**Original Splice:** https://github.com/jameskokoska/Splice

---

**Good luck with your Splitwise integration! 🚀**

Feel free to update this guide as you progress through implementation.
