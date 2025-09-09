import 'package:flutter/material.dart';
import 'package:flutter_playground/meal_app/presentation/category_grid_view.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Categories')),
      body: const CategoryGridView(),
    );
  }
}
