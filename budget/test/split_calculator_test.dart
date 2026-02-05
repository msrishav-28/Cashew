import 'package:test/test.dart';
import 'package:budget/functions/split_calculator.dart';
import 'package:budget/functions/debt_simplifier.dart';

/// Unit tests for SplitCalculator - Core expense splitting logic
void main() {
  group('SplitCalculator', () {
    group('calculateEqualSplit', () {
      test('should split amount equally among members', () {
        final result = SplitCalculator.calculateEqualSplit(
          100.0,
          ['Alice', 'Bob', 'Charlie'],
        );

        expect(result['Alice'], closeTo(33.33, 0.01));
        expect(result['Bob'], closeTo(33.33, 0.01));
        expect(result['Charlie'], closeTo(33.33, 0.01));
      });

      test('should return empty map for empty members list', () {
        final result = SplitCalculator.calculateEqualSplit(100.0, []);
        expect(result, isEmpty);
      });

      test('should handle single member', () {
        final result = SplitCalculator.calculateEqualSplit(100.0, ['Alice']);
        expect(result['Alice'], 100.0);
      });

      test('should handle zero amount', () {
        final result = SplitCalculator.calculateEqualSplit(
          0.0,
          ['Alice', 'Bob'],
        );
        expect(result['Alice'], 0.0);
        expect(result['Bob'], 0.0);
      });
    });

    group('calculatePercentageSplit', () {
      test('should split by valid percentages', () {
        final result = SplitCalculator.calculatePercentageSplit(
          1000.0,
          {'Alice': 50.0, 'Bob': 30.0, 'Charlie': 20.0},
        );

        expect(result['Alice'], 500.0);
        expect(result['Bob'], 300.0);
        expect(result['Charlie'], 200.0);
      });

      test('should throw when percentages do not sum to 100', () {
        expect(
          () => SplitCalculator.calculatePercentageSplit(
            100.0,
            {'Alice': 50.0, 'Bob': 30.0},
          ),
          throwsException,
        );
      });

      test('should allow small float error in percentage sum', () {
        // 33.33 + 33.33 + 33.34 = 100.0
        final result = SplitCalculator.calculatePercentageSplit(
          300.0,
          {'Alice': 33.33, 'Bob': 33.33, 'Charlie': 33.34},
        );

        expect(result['Alice'], closeTo(100.0, 0.1));
        expect(result['Bob'], closeTo(100.0, 0.1));
        expect(result['Charlie'], closeTo(100.0, 0.1));
      });
    });

    group('calculateShareSplit', () {
      test('should split by shares/weight', () {
        final result = SplitCalculator.calculateShareSplit(
          120.0,
          {'Alice': 2, 'Bob': 1, 'Charlie': 1},
        );

        // Total shares = 4, amount per share = 30
        expect(result['Alice'], 60.0);
        expect(result['Bob'], 30.0);
        expect(result['Charlie'], 30.0);
      });

      test('should return empty map when total shares is zero', () {
        final result = SplitCalculator.calculateShareSplit(
          100.0,
          {'Alice': 0, 'Bob': 0},
        );
        expect(result, isEmpty);
      });

      test('should handle single share', () {
        final result = SplitCalculator.calculateShareSplit(
          100.0,
          {'Alice': 5},
        );
        expect(result['Alice'], 100.0);
      });
    });

    group('calculateExactSplit', () {
      test('should validate when amounts equal total', () {
        final result = SplitCalculator.calculateExactSplit(
          100.0,
          {'Alice': 60.0, 'Bob': 40.0},
        );

        expect(result['Alice'], 60.0);
        expect(result['Bob'], 40.0);
      });

      test('should throw when amounts do not equal total', () {
        expect(
          () => SplitCalculator.calculateExactSplit(
            100.0,
            {'Alice': 60.0, 'Bob': 30.0},
          ),
          throwsException,
        );
      });

      test('should allow small float error', () {
        // 33.33 + 33.33 + 33.34 = 100.0
        final result = SplitCalculator.calculateExactSplit(
          100.0,
          {'Alice': 33.33, 'Bob': 33.33, 'Charlie': 33.34},
        );

        expect(result.length, 3);
      });
    });
  });

  group('DebtSimplifier', () {
    test('should simplify simple two-person debt', () {
      final transactions = DebtSimplifier.simplifyDebts({
        'Alice': 50.0, // Alice is owed 50
        'Bob': -50.0, // Bob owes 50
      });

      expect(transactions.length, 1);
      expect(transactions[0].from, equals('Bob'));
      expect(transactions[0].to, equals('Alice'));
      expect(transactions[0].amount, 50.0);
    });

    test('should simplify multi-person debts', () {
      // Alice paid 60, Bob and Charlie owe 30 each
      final transactions = DebtSimplifier.simplifyDebts({
        'Alice': 60.0,
        'Bob': -30.0,
        'Charlie': -30.0,
      });

      expect(transactions.length, 2);
      
      // Should have Bob -> Alice and Charlie -> Alice
      final toAlice = transactions.where((t) => t.to == 'Alice').toList();
      expect(toAlice.length, 2);
      
      double totalToAlice = toAlice.fold(0.0, (sum, t) => sum + t.amount);
      expect(totalToAlice, closeTo(60.0, 0.01));
    });

    test('should handle complex debt simplification', () {
      // A owes B 10, B owes C 20, C owes A 5
      // Net: A = -5, B = 10, C = -5
      final transactions = DebtSimplifier.simplifyDebts({
        'A': -5.0,
        'B': 10.0,
        'C': -5.0,
      });

      // Should result in simplified transactions
      expect(transactions.isNotEmpty, true);
      
      // Total money flowing should equal the positive balances
      double totalFlow = transactions.fold(0.0, (sum, t) => sum + t.amount);
      expect(totalFlow, closeTo(10.0, 0.01));
    });

    test('should return empty list when all balances near zero', () {
      final transactions = DebtSimplifier.simplifyDebts({
        'Alice': 0.005,
        'Bob': -0.005,
      });

      expect(transactions, isEmpty);
    });

    test('should return empty list for empty input', () {
      final transactions = DebtSimplifier.simplifyDebts({});
      expect(transactions, isEmpty);
    });

    test('epsilon constant should be accessible and correct', () {
      expect(DebtSimplifier.epsilon, 0.01);
    });
  });
}
