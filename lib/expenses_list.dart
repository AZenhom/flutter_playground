import 'package:flutter/material.dart';
import 'package:flutter_playground/model/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});
  final List<ExpenseModel> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) {
        final expense = expenses[index];
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          elevation: 4,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(expense.title),
                SizedBox(height: 4),
                Row(
                  children: [
                    Text('\$${expense.amount.toStringAsFixed(2)}'),
                    Spacer(),
                    Icon(categoryIcons[expense.category]),
                    SizedBox(width: 12),
                    Text(expense.date.toLocal().toString().split(' ')[0]),
                  ],
                )
              ],
            ),
          )
        );
      },
    );
  }
}
