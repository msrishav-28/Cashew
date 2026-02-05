import 'dart:math';

class DebtTransaction {
  final String from;
  final String to;
  final double amount;

  DebtTransaction({required this.from, required this.to, required this.amount});
}

class DebtSimplifier {
  /// Threshold for floating-point comparison to avoid rounding errors.
  /// Amounts below this are considered zero.
  static const double epsilon = 0.01;

  /// Simplify debts using greedy algorithm to minimize number of transactions.
  /// Input: Map of member IDs to their net balances (positive = owed, negative = owes)
  /// Output: List of optimized settlement transactions
  static List<DebtTransaction> simplifyDebts(
      Map<String, double> netBalances) {
    List<DebtTransaction> transactions = [];

    // Separate creditors (positive balance - owed money) and debtors (negative - owes money)
    var creditors = netBalances.entries
        .where((e) => e.value > epsilon)
        .toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    var debtors = netBalances.entries
        .where((e) => e.value < -epsilon)
        .map((e) => MapEntry(e.key, -e.value)) // Make positive for calculation
        .toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    // Match largest creditor with largest debtor (greedy approach)
    int i = 0, j = 0;
    while (i < creditors.length && j < debtors.length) {
      final creditor = creditors[i];
      final debtor = debtors[j];

      // The amount to settle is the minimum of what is owed and what is due
      // Rounding to 2 decimal places to avoid float errors
      double amount = min(creditor.value, debtor.value);
      amount = (amount * 100).round() / 100;

      if (amount > 0) {
        transactions.add(DebtTransaction(
          from: debtor.key,
          to: creditor.key,
          amount: amount,
        ));
      }

      // Update remaining amounts
      creditors[i] = MapEntry(creditor.key, creditor.value - amount);
      debtors[j] = MapEntry(debtor.key, debtor.value - amount);

      // If fully settled (within epsilon), move to next
      if (creditors[i].value < epsilon) i++;
      if (debtors[j].value < epsilon) j++;
    }

    return transactions;
  }
}
