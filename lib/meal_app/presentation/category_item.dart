import 'package:flutter/material.dart';
import 'package:flutter_playground/meal_app/model/meal_category.dart';

class CategoryItem extends StatelessWidget {
  final Function(MealCategory) onSelectCategory;
  final MealCategory category;

  const CategoryItem({super.key, required this.category, required this.onSelectCategory});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onSelectCategory(category);
      },
      splashColor: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withAlpha((255.0 * 0.55).round()),
              category.color.withAlpha((255.0 * 0.9).round()),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
