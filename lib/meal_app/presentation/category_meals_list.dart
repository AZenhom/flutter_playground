import 'package:flutter/material.dart';
import 'package:flutter_playground/meal_app/model/meal_category.dart';
import 'package:flutter_playground/meal_app/presentation/meal_item.dart';
import 'package:flutter_playground/meal_app/providers/meals_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryMealsList extends ConsumerWidget {
  final MealCategory category;
  const CategoryMealsList({super.key, required this.category});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref
        .watch(mealsProvider(category))
        .when(
          data: (meals) {
            if (meals.isEmpty)
              return const Center(
                child: Text('No meals found for this category.'),
              );
            else
              return ListView.builder(
                itemCount: meals.length,
                itemBuilder: (context, index) {
                  return MealItem(
                    key: ValueKey(meals[index].id),
                    meal: meals[index],
                  );
                },
              );
          },
          error: (error, stack) {
            return Center(child: Text('Error fetching meals: $error'));
          },
          loading: () {
            return const Center(child: CircularProgressIndicator());
          },
        );
  }
}
