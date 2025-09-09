import 'package:flutter/material.dart';
import 'package:flutter_playground/meal_app/model/meal_category.dart';
import 'package:flutter_playground/meal_app/presentation/meals_list.dart';

class MealsScreen extends StatelessWidget {
  final MealCategory category;
  const MealsScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(category.title)),
      body: MealsList(category: category),
    );
  }
}
