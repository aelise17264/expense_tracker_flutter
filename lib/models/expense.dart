import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { food, travel, fun, work }
// not string values but can be accessed like strings later

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
}
