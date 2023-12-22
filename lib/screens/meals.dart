import 'package:flutter/material.dart';
import 'package:meals/models/meal_model.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  MealsScreen({super.key, required this.meals, this.title, required this.onFavoriteClick});

  String? title;
  final List<MealModel> meals;
  final void Function(MealModel mealModel) onFavoriteClick;

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Nothing here !",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground)),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Tri selecting different category",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          )
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, idx) => MealItem(mealModel: meals[idx], onFavoriteClick: onFavoriteClick,),
      );
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(
            title!,
          ),
        ),
        body: content);
  }
}
