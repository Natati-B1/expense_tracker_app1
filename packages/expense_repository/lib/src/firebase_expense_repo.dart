import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_repository/expense_repository.dart';
import 'package:uuid/uuid.dart';

class FirebaseExpenseRepo implements ExpenseRepository {
  final categoryCollection =
      FirebaseFirestore.instance.collection('categories');
  final expenseCollection = FirebaseFirestore.instance.collection('expenses');

  @override
  Future<void> createCategory(Category category) async {
    try {
      await categoryCollection
          .doc(category.categoryId)
          .set(category.toEntity().toDocument());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<Category>> getCategory() async {
    try {
      final categories = await categoryCollection.get();

      if (categories.docs.isEmpty) {
        // Add default categories if none exist
        final defaultCategories = [
          Category(
            categoryId: const Uuid().v1(),
            name: 'Food',
            icon: 'food',
            color: 0xFF4CAF50,
            totalExpenses: 0,
          ),
          Category(
            categoryId: const Uuid().v1(),
            name: 'Shopping',
            icon: 'shopping',
            color: 0xFF2196F3,
            totalExpenses: 0,
          ),
          Category(
            categoryId: const Uuid().v1(),
            name: 'Entertainment',
            icon: 'entertainment',
            color: 0xFF9C27B0,
            totalExpenses: 0,
          ),
        ];

        // Save default categories to Firestore
        for (var category in defaultCategories) {
          await createCategory(category);
        }

        return defaultCategories;
      }

      return categories.docs
          .map(
              (e) => Category.fromEntity(CategoryEntity.fromDocument(e.data())))
          .toList();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> createExpense(Expense expense) async {
    try {
      await expenseCollection
          .doc(expense.expenseId)
          .set(expense.toEntity().toDocument());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<Expense>> getExpenses() async {
    try {
      final expenses = await expenseCollection.get();

      if (expenses.docs.isEmpty) {
        // Return empty list if no expenses exist
        return [];
      }

      return expenses.docs
          .map((e) {
            try {
              return Expense.fromEntity(ExpenseEntity.fromDocument(e.data()));
            } catch (e) {
              log('Error parsing expense document: ${e.toString()}');
              return null;
            }
          })
          .whereType<Expense>()
          .toList();
    } catch (e) {
      log('Error getting expenses: ${e.toString()}');
      rethrow;
    }
  }
}
