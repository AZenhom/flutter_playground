import 'package:flutter/material.dart';
import 'package:flutter_playground/expenses_screen.dart';

final colorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

void main() {
  runApp( MaterialApp(
    theme: ThemeData().copyWith(
      colorScheme: colorScheme,
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: colorScheme.onPrimaryContainer,
        foregroundColor: colorScheme.primaryContainer,
      ),
    ),
    home: const ExpensesScreen(),
  ));
}
