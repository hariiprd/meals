import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/providers/favorite_provider.dart';
import 'package:meals/providers/filter_provider.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/main_drawer.dart';

Map<Filter, bool> kFilter = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<TabsScreen> createState() {
    return _TabSScreenState();
  }
}

class _TabSScreenState extends ConsumerState<TabsScreen> {
  int _selectedPage = 0;

  void _onSelectScreen(String identifier) async {
    Navigator.pop(context);
    if (identifier == "Filters") {
      await Navigator.push<Map<Filter, bool>>(
        context,
        MaterialPageRoute(
          builder: (ctx) => FilterScreen(),
        ),
      );
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filteredMealsProvider);

    Widget activePage = CategoriesScreen(
      availableMeals: availableMeals,
    );
    String activeTitle = "Categories";

    if (_selectedPage == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(
        meals: favoriteMeals,
      );
      activeTitle = "Your Favorite";
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activeTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _onSelectScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _selectPage(index);
        },
        currentIndex: _selectedPage,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "favorites")
        ],
      ),
    );
  }
}
