import 'package:flutter/material.dart';
import 'package:flutter_playground/create_exoense_sheet.dart';
import 'package:flutter_playground/expenses_list.dart';
import 'package:flutter_playground/model/expense.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});
  @override
  State<StatefulWidget> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  @override
  Widget build(BuildContext context) {
    final expenses = <ExpenseModel>[
      ExpenseModel(
        title: 'Flutter Course',
        amount: 19.99,
        date: DateTime.now(),
        category: Category.work,
      ),
      ExpenseModel(
        title: 'Cinema',
        amount: 15.69,
        date: DateTime.now(),
        category: Category.leisure,
      ),
      ExpenseModel(
        title: 'Pizza',
        amount: 8.99,
        date: DateTime.now(),
        category: Category.food,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Expenses', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _openCreateExpenseSheet,
          ),
        ],
      ),
      body: ExpensesList(expenses: expenses),
    );
  }

  void _openCreateExpenseSheet() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => const CreateExpenseSheet(),
    );
  }
}
