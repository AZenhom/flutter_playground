import 'package:flutter/material.dart';
import 'package:flutter_playground/create_expense_sheet.dart';
import 'package:flutter_playground/expenses_list.dart';
import 'package:flutter_playground/model/expense.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});
  @override
  State<StatefulWidget> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
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
    
  void _addNewExpense(ExpenseModel expense) {
    setState(() {
      expenses.add(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses'),
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
      isScrollControlled: true,
      builder: (ctx) => CreateExpenseSheet(onAddNewExpense: _addNewExpense),
    );
  }
}
