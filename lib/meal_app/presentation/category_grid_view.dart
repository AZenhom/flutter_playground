import 'package:flutter/material.dart';
import 'package:flutter_playground/meal_app/model/meal_category.dart';
import 'package:flutter_playground/meal_app/presentation/category_item.dart';
import 'package:flutter_playground/meal_app/presentation/meals_screen.dart';
import 'package:flutter_playground/meal_app/providers/categories_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryGridView extends ConsumerStatefulWidget {
  const CategoryGridView({super.key});

  @override
  ConsumerState<CategoryGridView> createState() => _CategoryGridViewState();
}

class _CategoryGridViewState extends ConsumerState<CategoryGridView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ref
          .watch(categoriesProvider)
          .when(
            data: (categories) {
              _animationController.forward();
              return AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return SlideTransition(
                    child: child,
                    position:
                        Tween<Offset>(
                          begin: const Offset(0, 0.7),
                          end: const Offset(0, 0),
                        ).animate(
                          CurvedAnimation(
                            parent: _animationController,
                            curve: Curves.easeOut,
                          ),
                        ),
                  );
                },
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
                      onSelectCategory: (category) =>
                          navigateToCategoryMeals(category, context),
                    );
                  },
                ),
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
