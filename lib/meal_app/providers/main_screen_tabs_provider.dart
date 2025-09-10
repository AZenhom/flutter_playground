import 'package:flutter_riverpod/flutter_riverpod.dart';

enum MainScreenTab { categories, favorites }

class MainScreenCurrentTab {
  final MainScreenTab selectedTab;
  final String title;

  MainScreenCurrentTab({required this.selectedTab, required this.title});
}

class MainScreenCurrentTabNotifier extends Notifier<MainScreenCurrentTab> {
  @override
  MainScreenCurrentTab build() {
    return MainScreenCurrentTab(
      selectedTab: MainScreenTab.categories,
      title: 'Categories',
    );
  }

  void selectTab(MainScreenTab tab) {
    state = MainScreenCurrentTab(
      selectedTab: tab,
      title: tab == MainScreenTab.categories ? 'Categories' : 'Favorites',
    );
  }
}

final mainScreenCurrentTabProvider =
    NotifierProvider<MainScreenCurrentTabNotifier, MainScreenCurrentTab>(
      MainScreenCurrentTabNotifier.new,
    );
