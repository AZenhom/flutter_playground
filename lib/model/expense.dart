import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

enum Category { food, travel, leisure, work, other }

const categoryIcons = {
  Category.food: Icons.restaurant,
  Category.travel: Icons.airplanemode_active,
  Category.leisure: Icons.videogame_asset,
  Category.work: Icons.work,
  Category.other: Icons.shopping_basket,
};

class ExpenseModel {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  ExpenseModel({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = const Uuid().v4();
}
