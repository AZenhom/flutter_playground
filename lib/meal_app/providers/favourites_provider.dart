import 'package:flutter_playground/meal_app/model/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavouritesNotifier extends Notifier<List<Meal>> {
  @override
  List<Meal> build() {
    return [];
  }

  void toggleMealFavouriteStatus(Meal meal) {
    state = state.contains(meal)
        ? state.where((m) => m.id != meal.id).toList()
        : [...state, meal];
  }

  bool isMealFavourite(Meal meal) {
    return state.contains(meal);
  }
}

final favouritesProvider = NotifierProvider<FavouritesNotifier, List<Meal>>(() {
  return FavouritesNotifier();
});
