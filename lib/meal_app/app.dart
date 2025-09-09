import 'package:flutter/material.dart';
import 'package:flutter_playground/meal_app/presentation/categories_screen.dart';
import 'package:google_fonts/google_fonts.dart';

final mealColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 131, 57, 0),
);

void runMealApp() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: mealColorScheme,
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      home: const CategoriesScreen(),
    ),
  );
}