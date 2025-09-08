import 'package:flutter/material.dart';
import 'package:flutter_playground/expenses_screen.dart';

final lightColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

final darkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: lightColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: lightColorScheme.onPrimaryContainer,
          foregroundColor: lightColorScheme.primaryContainer,
        ),
        cardTheme: CardThemeData(
          color: lightColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: darkColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: darkColorScheme.onPrimaryContainer,
          foregroundColor: darkColorScheme.primaryContainer,
        ),
        cardTheme: CardThemeData(
          color: darkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
      home: const ExpensesScreen(),
    ),
  );
}
