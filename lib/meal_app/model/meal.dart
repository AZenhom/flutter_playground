import 'dart:math';

import 'package:flutter_playground/meal_app/model/meal_category.dart';

enum Complexity { simple, challenging, hard }

enum Affordability { affordable, pricey, luxurious }

class Meal {
  final String id;
  final String title;
  final String imageUrl;
  final List<String> categories;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.categories,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
  });
}

List<Meal> getFakeMeals(MealCategory category) => [
   Meal(
    id: 'm1',
    title: 'Spaghetti with Tomato Sauce',
    imageUrl:
        'https://picsum.photos/1600/900?random=${Random().nextInt(1000)}',
    categories: ['c1', 'c2'],
    ingredients: [
      '4 Tomatoes',
      '1 Tablespoon of Olive Oil',
      '1 Onion',
      '250g Spaghetti',
      'Spices',
      'Cheese (optional)',
    ],
    steps: [
      'Cut the tomatoes and the onion into small pieces.',
      'Boil some water - add salt to it once it boils.',
      'Put the spaghetti into the boiling water - they should be done in about 10 to 12 minutes.',
      'In the meantime, heaten up some olive oil and add the cut onion.',
      'After 2 minutes, add the tomato pieces, salt, pepper and your other spices.',
      'The sauce will be done once the spaghetti are.',
      'Feel free to add some cheese on top of the finished dish.',
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
        'https://picsum.photos/1600/900?random=${Random().nextInt(1000)}',
    categories: ['c2'],
    ingredients: [
      '1 Slice White Bread',
      '1 Slice Ham',
      '1 Slice Pineapple',
      '1-2 Slices of Cheese',
      'Butter',
    ],
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
        'https://picsum.photos/1600/900?random=${Random().nextInt(1000)}',
    categories: ['c3'],
    ingredients: [
      '1 Hamburger Bun',
      '1 Beef Patty',
      'Lettuce',
      'Tomato',
      'Onion',
      'Cheese',
      'Ketchup',
      'Mustard',
    ],
    steps: [
      'Grill the beef patty to your desired doneness.',
      'Toast the hamburger bun on the grill.',
      'Assemble the burger with lettuce, tomato, onion, and cheese.',
      'Add ketchup and mustard to taste.',
    ],
    duration: 30,
    complexity: Complexity.simple,
    affordability: Affordability.affordable,
    isGlutenFree: false,
    isLactoseFree: false,
    isVegan: false,
    isVegetarian: false,
  ),
];
