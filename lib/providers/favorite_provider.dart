import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal_model.dart';

class FavoriteMealsNotifier extends StateNotifier<List<MealModel>> {
  FavoriteMealsNotifier() : super([]);

  String favoriteClick(MealModel mealModel) {
    final mealIsFavorite = state.contains(mealModel);
    if (mealIsFavorite) {
      state = state.where((element) => element.id != mealModel.id).toList();
      return "Meal Removed";
    } else {
      state = [...state, mealModel];
      return "Meal added as a favorite";
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<MealModel>>(
        (ref) => FavoriteMealsNotifier());
