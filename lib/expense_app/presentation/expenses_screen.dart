import 'package:flutter/material.dart';
import 'package:flutter_playground/expense_app/presentation/create_expense_sheet.dart';
import 'package:flutter_playground/expense_app/presentation/expense_chart.dart';
import 'package:flutter_playground/expense_app/presentation/expenses_list.dart';
import 'package:flutter_playground/expense_app/model/expense.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});
  @override
  State<StatefulWidget> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  final expenses = <ExpenseModel>[

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
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ExpenseChart(buckets: groupExpensesByCategory(expenses)),
            ),
            Expanded(child: ExpensesList(expenses: expenses)),
          ],
        ),
      ),
    );
  }

  void _openCreateExpenseSheet() {
    showModalBottomSheet(
      useSafeArea: true,
      context: context,
      isScrollControlled: true,
      builder: (ctx) => CreateExpenseSheet(onAddNewExpense: _addNewExpense),
    );
  }
}
