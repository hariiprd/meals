import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal_model.dart';
import 'package:meals/providers/favorite_provider.dart';

class MealDetailScreen extends ConsumerWidget {
  const MealDetailScreen({super.key, required this.mealModel});

  final MealModel mealModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);
    Icon icon = Icon(Icons.star_border);
    if (favoriteMeals.contains(mealModel)) {
      icon = Icon(Icons.star);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(mealModel.title),
        actions: [
          IconButton(
            onPressed: () {
              var result = ref
                  .read(favoriteMealsProvider.notifier)
                  .favoriteClick(mealModel);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(result),
                ),
              );
            },
            icon: icon,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(
              image: NetworkImage(mealModel.imageUrl),
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 14,
            ),
            Text(
              "Ingredients",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(
              height: 14,
            ),
            for (final ing in mealModel.ingredients)
              Text(
                ing,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            SizedBox(
              height: 24,
            ),
            Text(
              "Steps",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(
              height: 14,
            ),
            for (final step in mealModel.steps)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: Text(
                  step,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
