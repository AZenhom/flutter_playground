import 'package:flutter/material.dart';
import 'package:flutter_playground/meal_app/presentation/meal_item.dart';
import 'package:flutter_playground/meal_app/providers/favourites_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavouritesScreen extends ConsumerWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favourites = ref.watch(favouritesProvider);
    if (favourites.isEmpty)
      return const Center(
        child: Text('You have no favourites yet - start adding some!'),
      );
    else
      return ListView.builder(
        itemCount: favourites.length,
        itemBuilder: (context, index) {
          return MealItem(
            key: ValueKey(favourites[index].id),
            meal: favourites[index],
          );
        },
      );
  }
}
