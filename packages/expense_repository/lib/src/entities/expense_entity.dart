import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_repository/src/entities/entities.dart';

import '../models/models.dart';

class ExpenseEntity {
  String expenseId;
  Category category;
  DateTime date;
  int amount;

  ExpenseEntity({
    required this.expenseId,
    required this.category,
    required this.date,
    required this.amount,
  });

  Map<String, Object?> toDocument() {
    return {
      'expenseId': expenseId,
      'category': category.toEntity().toDocument(),
      'date': date,
      'amount': amount,
    };
  }

  static ExpenseEntity fromDocument(Map<String, dynamic> doc) {
    try {
      return ExpenseEntity(
        expenseId: doc['expenseId'] as String? ?? '',
        category: Category.fromEntity(CategoryEntity.fromDocument(
            doc['category'] as Map<String, dynamic>? ?? {})),
        date: (doc['date'] as Timestamp?)?.toDate() ?? DateTime.now(),
        amount: doc['amount'] as int? ?? 0,
      );
    } catch (e) {
      throw FormatException('Error parsing expense document: ${e.toString()}');
    }
  }
}
