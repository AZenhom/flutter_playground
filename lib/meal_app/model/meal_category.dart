import 'package:flutter/material.dart';

class MealCategory {
  final String id;
  final String title;
  final Color color;

  const MealCategory({
    required this.id,
    required this.title,
    required this.color,
  });
}

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
