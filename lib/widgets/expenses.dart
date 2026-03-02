// ignore_for_file: non_constant_identifier_names

import 'dart:math';

import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
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

  // final List<Expense> _ExpenseList = [];

  void _openAddExpenseModal() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (cxt) => NewExpense(onAddExpense: _addNewExpense),
    );
  }

  void _addNewExpense(Expense expense) {
    setState(() {
      _ExpenseList.add(expense);
    });
  }

  void _deleteExpense(Expense expense) {
    final expenseIndex = _ExpenseList.indexOf(expense);
    setState(() {
      _ExpenseList.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Expense deleted."),
        duration: const Duration(seconds: 5),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _ExpenseList.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text("Start adding your expenses!"),
    );

    if (_ExpenseList.isNotEmpty) {
      mainContent = ExpenseList(
        expenses: _ExpenseList,
        onRemove: _deleteExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker Flutter'),
        actions: [
          IconButton(
            onPressed: () {
              _openAddExpenseModal();
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Text('The Chart'),
            Expanded(child: mainContent),
          ],
        ),
      ),
    );
  }
}
