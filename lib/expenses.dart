import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  //dummy data
  final List<Expense> _ExpenseList = [
    Expense(
      title: 'Trip to Ireland',
      amount: 1326.45,
      expenseDate: DateTime.now(),
      category: Category.travel,
    ),
    Expense(
      title: 'Study time',
      amount: 9.99,
      expenseDate: DateTime.now(),
      category: Category.work,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [Text('The chart'), Text('Expenses list...')],
      ),
    );
  }
}
