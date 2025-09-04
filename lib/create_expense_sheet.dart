import 'package:flutter/material.dart';
import 'package:flutter_playground/model/expense.dart';
import 'package:intl/intl.dart';

class CreateExpenseSheet extends StatefulWidget {
  const CreateExpenseSheet({super.key, required this.onAddNewExpense});

  final void Function(ExpenseModel expense) onAddNewExpense;

  @override
  State<StatefulWidget> createState() {
    return _CreateExpenseSheetState();
  }
}

class _CreateExpenseSheetState extends State<CreateExpenseSheet> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category? _selectedCategory;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  final _dateFormatter = DateFormat()
      .add_d()
      .addPattern("/")
      .add_M()
      .addPattern("/")
      .add_y();

  void _onSubmitExpenseData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.tryParse(_amountController.text);
    if (enteredTitle.isEmpty ||
        enteredAmount == null ||
        enteredAmount <= 0 ||
        _selectedDate == null ||
        _selectedCategory == null) {
      // Show error
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Invalid Input'),
          content: Text(
            'Please make sure to enter a valid title, amount, date and category.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Text('Okay'),
            ),
          ],
        ),
      );
      return;
    }
    final newExpense = ExpenseModel(
      title: enteredTitle,
      amount: enteredAmount,
      date: _selectedDate!,
      category: _selectedCategory!,
    );
    widget.onAddNewExpense(newExpense);
    Navigator.of(context).pop(newExpense);
  }

  void _showDatePicker() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller: _titleController,
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(labelText: 'Amount', prefixText: '\$'),
            keyboardType: TextInputType.number,
            controller: _amountController,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextField(
                  readOnly: true,
                  decoration: InputDecoration(labelText: 'Date'),
                  onTap: _showDatePicker,
                  controller: TextEditingController(
                    text: _selectedDate != null
                        ? _dateFormatter.format(_selectedDate!)
                        : '',
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.calendar_today),
                onPressed: _showDatePicker,
              ),
            ],
          ),
          const SizedBox(height: 16),
          DropdownButton(
            isExpanded: true,
            items: Category.values.map((category) {
              return DropdownMenuItem(
                value: category,
                child: Text(category.name),
              );
            }).toList(),
            onChanged: (value) {
              if (value == null) {
                return;
              }
              setState(() {
                _selectedCategory = value;
              });
            },
            hint: Text('Category', style: TextStyle(color: Colors.grey[600])),
            value: _selectedCategory,
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: _onSubmitExpenseData,
            child: Text('Add Expense'),
          ),
        ],
      ),
    );
  }
}
