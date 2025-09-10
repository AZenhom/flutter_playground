import 'package:flutter/material.dart';
import 'package:flutter_playground/meal_app/presentation/categories_screen.dart';
import 'package:flutter_playground/meal_app/presentation/favourites_screen.dart';
import 'package:flutter_playground/meal_app/providers/main_screen_tabs_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainTabsScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTab = ref.watch(mainScreenCurrentTabProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(currentTab.title),
      ),
      body: currentTab.selectedTab == MainScreenTab.categories
          ? CategoriesScreen()
          : FavouritesScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTab.selectedTab.index,
        onTap: (index) {
          ref.read(mainScreenCurrentTabProvider.notifier).selectTab(
                MainScreenTab.values[index],
              );
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
