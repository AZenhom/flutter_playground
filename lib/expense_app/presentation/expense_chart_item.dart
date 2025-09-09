import 'package:flutter/material.dart';
import 'package:flutter_playground/expense_app/model/expense.dart';

class ExpenseChartItem extends StatelessWidget {
  final ExpenseCategoryBucket bucket;
  final double maxValue;

  static const double fullHeight = 100.0;

  const ExpenseChartItem({
    Key? key,
    required this.bucket,
    required this.maxValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: fullHeight,
              child: Column(
                children: [
                  SizedBox(
                    height: maxValue == 0
                        ? fullHeight
                        : fullHeight -
                              ((bucket.totalExpenses / maxValue) * fullHeight),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(6),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Icon(categoryIcons[bucket.category]),
          ],
        ),
      ),
    );
  }
}
