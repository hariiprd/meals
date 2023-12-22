import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category_model.dart';
import 'package:meals/models/meal_model.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.onFavoriteClick});

  final void Function(MealModel mealModel) onFavoriteClick;

  void _selectCategory(BuildContext context, CategoryModel categoryModel) {
    var filteredMeals = dummyMeals
        .where((element) => element.categories.contains(categoryModel.id))
        .toList();

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => MealsScreen(
                  title: categoryModel.title,
                  meals: filteredMeals,
                  onFavoriteClick: onFavoriteClick,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(24),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            categoryModel: category,
            selectCategory: _selectCategory,
          )
      ],
    );
  }
}
