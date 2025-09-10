import 'package:flutter_playground/meal_app/model/meal.dart';
import 'package:flutter_playground/meal_app/model/meal_category.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mealsProvider = FutureProvider.autoDispose
    .family<List<Meal>, MealCategory>((ref, category) async {
      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: 1500));
      return getFakeMeals(category);
    });

List<Meal> getFakeMeals(MealCategory category) => [
  Meal(
    id: 'm1',
    title: 'Spaghetti with Tomato Sauce',
    imageUrl:
        'https://www.foodiesfeed.com/wp-content/uploads/2023/06/cherry-tomatoes-spaghetti.jpg.webp',
    categories: ['c1', 'c2', 'c5'],
    ingredients: ['4 Tomatoes', '1 Tablespoon of Olive Oil', '1 Onion'],
    steps: [
      'Cut the tomatoes and the onion into small pieces.',
      'Boil some water - add salt to it once it boils.',
      'Put the spaghetti into the boiling water - they should be done in about 10 to 12 minutes.',
    ],
    duration: 20,
    complexity: Complexity.simple,
    affordability: Affordability.affordable,
    isGlutenFree: false,
    isLactoseFree: true,
    isVegan: true,
    isVegetarian: true,
  ),
  Meal(
    id: 'm2',
    title: 'Toast Hawaii',
    imageUrl:
        'https://www.foodiesfeed.com/wp-content/uploads/ff-images/2025/06/avocado-toast-with-poached-eggs-and-cherry-tomatoes.webp',
    categories: ['c2', 'c7'],
    ingredients: ['1 Slice White Bread', '1 Slice Ham', '1 Slice Pineapple'],
    steps: [
      'Butter one side of the white bread',
      'Layer ham, the pineapple and cheese on the white bread',
      'Bake the toast for round about 10 minutes in the oven at 200°C',
    ],
    duration: 10,
    complexity: Complexity.simple,
    affordability: Affordability.affordable,
    isGlutenFree: false,
    isLactoseFree: false,
    isVegan: false,
    isVegetarian: false,
  ),
  Meal(
    id: 'm3',
    title: 'Classic Hamburger',
    imageUrl:
        'https://www.foodiesfeed.com/wp-content/uploads/2023/06/burger-with-melted-cheese.jpg.webp',
    categories: ['c3'],
    ingredients: ['1 Hamburger Bun', '1 Beef Patty', 'Lettuce'],
    steps: [
      'Grill the beef patty to your desired doneness.',
      'Toast the hamburger bun on the grill.',
      'Assemble the burger with lettuce, tomato, onion, and cheese.',
    ],
    duration: 30,
    complexity: Complexity.simple,
    affordability: Affordability.affordable,
    isGlutenFree: false,
    isLactoseFree: false,
    isVegan: false,
    isVegetarian: false,
  ),
  Meal(
    id: 'm4',
    title: 'Salami Pizza',
    imageUrl:
        'https://www.foodiesfeed.com/wp-content/uploads/2023/05/pizza-salami.jpg.webp',
    categories: ['c1'],
    ingredients: ['1 Pizza Base', '1 Beef Patty', 'Lettuce'],
    steps: [
      'Grill the beef patty to your desired doneness.',
      'Toast the pizza base on the grill.',
      'Assemble the pizza with salami, tomato, onion, and cheese.',
    ],
    duration: 30,
    complexity: Complexity.simple,
    affordability: Affordability.affordable,
    isGlutenFree: false,
    isLactoseFree: false,
    isVegan: false,
    isVegetarian: false,
  ),
  Meal(
    id: 'm5',
    title: 'Lemon Cheese Cake',
    imageUrl:
        'https://www.foodiesfeed.com/wp-content/uploads/ff-images/2024/12/refreshing-lemon-cheesecake-slice-with-mint-garnish.jpg.webp',
    categories: ['c2', 'c5', 'c7'],
    ingredients: ['1 Pizza Base', '1 Beef Patty', 'Lettuce'],
    steps: [
      'Grill the beef patty to your desired doneness.',
      'Toast the pizza base on the grill.',
      'Assemble the pizza with salami, tomato, onion, and cheese.',
    ],
    duration: 30,
    complexity: Complexity.simple,
    affordability: Affordability.affordable,
    isGlutenFree: false,
    isLactoseFree: false,
    isVegan: false,
    isVegetarian: false,
  ),
  Meal(
    id: 'm6',
    title: 'Blueberry pancakes',
    imageUrl:
        'https://www.foodiesfeed.com/wp-content/uploads/2023/06/pouring-honey-on-pancakes.jpg.webp',
    categories: ['c2', 'c5', 'c7'],
    ingredients: ['1 Cup Flour', '1 Cup Milk', '1 Egg'],
    steps: [
      'In a bowl, mix flour, milk, and egg until smooth.',
      'Fold in blueberries.',
      'Pour batter onto a hot griddle and cook until bubbles form.',
    ],
    duration: 30,
    complexity: Complexity.simple,
    affordability: Affordability.affordable,
    isGlutenFree: false,
    isLactoseFree: false,
    isVegan: false,
    isVegetarian: false,
  ),
].where((meal) => meal.categories.contains(category.id)).toList();
