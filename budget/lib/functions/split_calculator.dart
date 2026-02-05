class SplitCalculator {
  // Equal split
  static Map<String, double> calculateEqualSplit(
      double totalAmount, List<String> members) {
    if (members.isEmpty) return {};
    final sharePerPerson = totalAmount / members.length;
    return {for (var member in members) member: sharePerPerson};
  }

  // Unequal split by percentage
  static Map<String, double> calculatePercentageSplit(
      double totalAmount, Map<String, double> percentages) {
    // Validate percentages sum to 100 (allowing for small float error)
    double totalPercent = percentages.values.fold(0, (sum, val) => sum + val);
    if ((totalPercent - 100).abs() > 0.01) {
       throw Exception("Percentages must sum to 100%");
    }

    return percentages.map((member, percent) =>
        MapEntry(member, (totalAmount * percent) / 100));
  }

  // Split by shares/weight
  static Map<String, double> calculateShareSplit(
      double totalAmount, Map<String, int> shares) {
    final totalShares = shares.values.fold(0, (sum, val) => sum + val);
    if (totalShares == 0) return {};
    
    final amountPerShare = totalAmount / totalShares;
    return shares.map((member, share) =>
        MapEntry(member, share * amountPerShare));
  }

  // Exact amounts (Validation only)
  static Map<String, double> calculateExactSplit(
      double totalAmount, Map<String, double> amounts) {
    double totalSplit = amounts.values.fold(0, (sum, val) => sum + val);
    if ((totalSplit - totalAmount).abs() > 0.01) {
      throw Exception("Split amounts must equal total amount");
    }
    return amounts;
  }
}
