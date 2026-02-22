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
  void _openAddExpenseModal() {
    showModalBottomSheet(
      context: context,
      builder: (cxt) => const NewExpense(),
    );
  }

  @override
  Widget build(BuildContext context) {
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
            Expanded(child: ExpenseList(expenses: _ExpenseList)),
          ],
        ),
      ),
    );
  }
}
