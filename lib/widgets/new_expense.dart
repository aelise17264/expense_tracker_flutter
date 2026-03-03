import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:intl/intl.dart';

// final dateFormatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<StatefulWidget> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _priceInput = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.fun;

  @override
  void dispose() {
    _titleController.dispose();
    _priceInput.dispose();
    super.dispose();
  }
  // var _expenseTitle = '';

  // void _saveTitleInput(String inputValue) {
  //   _expenseTitle = inputValue;
  // }
  bool _isHovering = false;
  bool _isSaveHovering = false;

  void _getThisDate() async {
    final rightNow = DateTime.now();
    final firstDate = DateTime(rightNow.year - 1, rightNow.month, rightNow.day);
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: rightNow,
      firstDate: firstDate,
      lastDate: rightNow,
    );
    setState(() {
      _selectedDate = selectedDate;
    });
  }

  void _submitData() {
    final enteredAmount = double.tryParse(_priceInput.text);
    final invalidAmount = enteredAmount == null || enteredAmount <= 0;

    if (_titleController.text.trim().isEmpty ||
        invalidAmount ||
        _selectedDate == null) {
      // throw ErrorDescription(
      //   "Input Error: Check your expense title, date and amount. Something isn't right.",
      // );
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Input Error'),
          content: Text('Check your expense title, date and amount.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Got it!'),
            ),
          ],
        ),
      );
      return;
    }
    widget.onAddExpense(
      Expense(
        title: _titleController.text,
        amount: enteredAmount,
        expenseDate: _selectedDate!,
        category: _selectedCategory,
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.fromLTRB(16, 48, 16, 16),
      child: Column(
        //instead of ListView because we don't need scrollability & we have a set number of elements
        children: [
          TextField(
            maxLength: 50,
            decoration: InputDecoration(label: Text('Title')),
            controller: _titleController,
            //using this controller makes it so we don't have to manually store the value, Flutter does it for us!
            // onChanged: _saveTitleInput,
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    labelText: 'Amount',
                    prefixText: '\$ ',
                  ),
                  controller: _priceInput,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r'^\d+\.?\d{0,2}'),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Spacer(),
                    Text(
                      _selectedDate == null
                          ? 'No Date Selected'
                          : formatter.format(_selectedDate!),
                    ),
                    IconButton(
                      onPressed: _getThisDate,
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          // Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(category.name.toUpperCase()),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    if (value == null) {
                      return;
                    } else {
                      _selectedCategory = value;
                    }
                  });
                },
              ),
              Spacer(),
              ElevatedButton.icon(
                onPressed: () {
                  _submitData();
                },
                onHover: (value) {
                  setState(() {
                    _isSaveHovering = value;
                  });
                },
                icon: const Icon(Icons.check),
                label: const Text('Save'),
                // style: ElevatedButton.styleFrom(
                //   backgroundColor: _isSaveHovering
                //       ? Colors.deepPurple
                //       : Colors.white,
                //   foregroundColor: _isSaveHovering
                //       ? Colors.white
                //       : Colors.deepPurple,
                // ),
              ),
              SizedBox(width: 10),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                onHover: (value) {
                  setState(() {
                    _isHovering = value;
                  });
                },
                icon: const Icon(Icons.close),
                label: const Text('Cancel'),
                // style: ElevatedButton.styleFrom(
                //   backgroundColor: _isHovering
                //       ? Colors.deepPurple
                //       : Colors.white,
                //   foregroundColor: _isHovering
                //       ? Colors.white
                //       : Colors.deepPurple,
                // ),
              ),
              // ),
              SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }
}
