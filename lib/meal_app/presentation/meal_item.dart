import 'package:flutter/material.dart';
import 'package:flutter_playground/meal_app/model/meal.dart';
import 'package:flutter_playground/meal_app/providers/favourites_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends ConsumerWidget {
  final Meal meal;
  const MealItem({super.key, required this.meal});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(favouritesProvider);
    final isFavourite = list.contains(meal);
    return Card(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          ref.read(favouritesProvider.notifier).toggleMealFavouriteStatus(meal);
        },
        child: Stack(
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover,
              ),
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
            Positioned(
              child: Center(
                child: AnimatedCrossFade(
                  duration: const Duration(milliseconds: 300),
                  firstChild: Icon(
                    Icons.star,
                    color: Colors.white,
                    size: 48,
                  ),
                  secondChild: Icon(
                    Icons.star_border,
                    color: Colors.white,
                    size: 48,
                  ),
                  crossFadeState: isFavourite
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                ),
              ),
              top: 0,
              right: 0,
              bottom: 0,
              left: 0,
            ),
          ],
        ),
      ),
    );
  }
}