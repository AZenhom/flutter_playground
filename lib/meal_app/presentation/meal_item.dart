import 'package:flutter/material.dart';
import 'package:flutter_playground/meal_app/model/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  const MealItem({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FadeInImage(
          placeholder: MemoryImage(kTransparentImage),
          image: NetworkImage(meal.imageUrl),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(8),
            color: Colors.black54,
            child: Text(
              meal.title,
              softWrap: true,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
