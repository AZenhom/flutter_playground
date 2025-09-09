import 'package:flutter/material.dart';
import 'package:flutter_playground/meal_app/model/meal_category.dart';
import 'package:flutter_playground/meal_app/presentation/category_item.dart';
import 'package:flutter_playground/meal_app/presentation/meals_screen.dart';

class CategoryGridView extends StatefulWidget {
  const CategoryGridView({super.key});

  @override
  State<CategoryGridView> createState() => _CategoryGridViewState();
}

class _CategoryGridViewState extends State<CategoryGridView> {
  final List<MealCategory> _data = [];

  @override
  void initState() {
    super.initState();
    _fetchInitialData();
  }

  Future<void> _fetchInitialData() async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      setState(() {
        _data.clear();
        _data.addAll(getFakeCategories());
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      padding: const EdgeInsets.all(16),
      itemCount: _data.length,
      itemBuilder: (context, index) {
        return CategoryItem(
          key: ValueKey(_data[index].id),
          category: _data[index],
          onSelectCategory: navigateToCategoryDetail,
        );
      },
    );
  }

  void navigateToCategoryDetail(MealCategory category) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => MealsScreen(category: category)),
    );
  }
}
