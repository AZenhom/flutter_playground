import 'package:flutter/material.dart';
import 'package:flutter_playground/expense_app/presentation/expense_chart_item.dart';
import 'package:flutter_playground/expense_app/model/expense.dart';

class ExpenseChart extends StatelessWidget {
  final List<ExpenseCategoryBucket> buckets;
  final double maxValue;

  ExpenseChart({super.key, required this.buckets})
    : maxValue = _calculateMaxBucketValue(buckets);

  static double _calculateMaxBucketValue(List<ExpenseCategoryBucket> buckets) {
    var max = 0.0;
    for (final bucket in buckets) {
      if (bucket.totalExpenses > max) {
        max = bucket.totalExpenses;
      }
    }
    return max;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: buckets.map((bucket) {
        return ExpenseChartItem(bucket: bucket, maxValue: maxValue);
      }).toList(),
    );
  }
}
