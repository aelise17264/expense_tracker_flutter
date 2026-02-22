import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _priceInput = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.all(16),
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
              // Expanded(
              //   flex: 1,
              //   child: ElevatedButton(
              //     onPressed: () {
              //       print(_titleController.text);
              //     },
              //     child: const Text('Save Expense'),
              //   ),
              // ),
              Expanded(
                flex: 1,
                child: TextField(
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    labelText: 'Amount',
                    prefixText: '\$ ',
                  ),
                  controller: _priceInput,
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.close),
            label: const Text('Cancel'),
          ),
        ],
      ),
    );
  }
}
