import 'package:flutter/material.dart';
import 'package:flutter_playground/meal_app/model/meal_category.dart';
import 'package:flutter_playground/meal_app/presentation/category_item.dart';
import 'package:flutter_playground/meal_app/presentation/meals_screen.dart';
import 'package:flutter_playground/meal_app/providers/categories_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryGridView extends ConsumerWidget {
  const CategoryGridView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: ref
          .watch(categoriesProvider)
          .when(
            data: (categories) {
              return GridView.builder(
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
              );
            },
            error: (error, stack) {
              return Center(child: Text('Error: $error'));
            },
            loading: () {
              return const Center(child: CircularProgressIndicator());
            },
          ),
    );
  }

  void navigateToCategoryMeals(MealCategory category, BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => MealsScreen(category: category)),
    );
  }
}
