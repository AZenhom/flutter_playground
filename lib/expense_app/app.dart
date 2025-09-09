import 'package:flutter/material.dart';
import 'package:flutter_playground/expense_app/presentation/expenses_screen.dart';

final expenseLightColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

final expenseDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

void runExpenseApp() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: expenseLightColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: expenseLightColorScheme.onPrimaryContainer,
          foregroundColor: expenseLightColorScheme.primaryContainer,
        ),
        cardTheme: CardThemeData(
          color: expenseLightColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: expenseDarkColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: expenseDarkColorScheme.onPrimaryContainer,
          foregroundColor: expenseDarkColorScheme.primaryContainer,
        ),
        cardTheme: CardThemeData(
          color: expenseDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
      ),
      home: const ExpensesScreen(),
    ),
  );
}