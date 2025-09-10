import 'package:flutter/material.dart';
import 'package:flutter_playground/meal_app/model/meal_category.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoriesProvider = FutureProvider.autoDispose((ref) async {
  await Future.delayed(const Duration(milliseconds: 1500));
  return getFakeCategories();
});

List<MealCategory> getFakeCategories() => [
  const MealCategory(id: 'c1', title: 'Italian', color: Colors.purple),
  const MealCategory(id: 'c2', title: 'Quick & Easy', color: Colors.red),
  const MealCategory(id: 'c3', title: 'Hamburgers', color: Colors.orange),
  const MealCategory(id: 'c4', title: 'German', color: Colors.blue),
  const MealCategory(id: 'c5', title: 'Light & Lovely', color: Colors.amber),
  const MealCategory(id: 'c6', title: 'Exotic', color: Colors.green),
  const MealCategory(id: 'c7', title: 'Breakfast', color: Colors.lightBlue),
  const MealCategory(id: 'c8', title: 'Asian', color: Colors.teal),
];
