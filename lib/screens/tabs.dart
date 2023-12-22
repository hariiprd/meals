import 'package:flutter/material.dart';
import 'package:meals/models/meal_model.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/meals.dart';

class TabsScreen extends StatefulWidget {
  @override
  State<TabsScreen> createState() {
    return _TabSScreenState();
  }
}

class _TabSScreenState extends State<TabsScreen> {
  int _selectedPage = 0;
  final List<MealModel> _favoriteMeals = [];

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _onFavoriteClick(MealModel mealModel) {
    if (_favoriteMeals.contains(mealModel)) {
      setState(() {
        _favoriteMeals.remove(mealModel);
        _showInfoMessage("Meal is no longer favorite");
      });
    } else {
      setState(() {
        _favoriteMeals.add(mealModel);
        _showInfoMessage("Marked as favorite");
      });
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
      onFavoriteClick: _onFavoriteClick,
    );
    String activeTitle = "Categories";

    if (_selectedPage == 1) {
      activePage = MealsScreen(
        meals: _favoriteMeals,
        onFavoriteClick: _onFavoriteClick,
      );
      activeTitle = "Your Favorite";
    }
    return Scaffold(
      appBar: AppBar(title: Text(activeTitle),),
      drawer: Drawer,
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
