import 'package:flutter/material.dart';
import 'package:flutter_playground/meal_app/model/meal.dart';
import 'package:flutter_playground/meal_app/model/meal_category.dart';
import 'package:flutter_playground/meal_app/presentation/meal_item.dart';

class MealsList extends StatefulWidget {
  final MealCategory category;
  const MealsList({super.key, required this.category});

  @override
  State<MealsList> createState() => _MealsListState();
}

class _MealsListState extends State<MealsList> {
  final List<Meal> _data = [];

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
        _data.addAll(getFakeMeals(widget.category));
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _data.length,
      itemBuilder: (context, index) {
        return MealItem(key: ValueKey(_data[index].id), meal: _data[index]);
      },
    );
  }
}
