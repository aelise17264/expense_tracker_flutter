import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

final formatter = DateFormat.yMd();

enum Category { food, travel, fun, work }
// not string values but can be accessed like strings later

const categoryIcons = {
  Category.food: Icons.dining_outlined,
  Category.travel: Icons.flight_outlined,
  Category.fun: Icons.beach_access,
  Category.work: Icons.computer_outlined,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.expenseDate,
    required this.category,
  }) : id = uuid.v4();
  //v4 creates the unique id as a string without having to format it later

  final String id;
  final String title;
  final double amount;
  final DateTime expenseDate;
  final Category category;

  String get formattedDate {
    return formatter.format(expenseDate);
  }
}

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expenses});

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
    : expenses = allExpenses
          .where((expense) => expense.category == category)
          .toList(); // add additional constructor functions to classes

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount; //add each amount to the sum
    }

    return sum;
  }
}
