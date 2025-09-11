import 'package:flutter/material.dart';
import 'package:flutter_playground/meal_app/model/meal_category.dart';
import 'package:flutter_playground/meal_app/presentation/category_item.dart';
import 'package:flutter_playground/meal_app/presentation/meals_screen.dart';

class CategoryGridView extends StatelessWidget {
  final List<MealCategory> categories;
  const CategoryGridView({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                padding: const EdgeInsets.all(16),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryItem(
                    key: ValueKey(categories[index].id),
                    category: categories[index],
                    onSelectCategory: (category) => navigateToCategoryMeals(category, context),
                  );
                },
              )
    );
  }

  void navigateToCategoryMeals(MealCategory category, BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => MealsScreen(category: category)),
    );
  }
}
