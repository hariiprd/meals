import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/meals_provider.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FilterNotifier extends StateNotifier<Map<Filter, bool>> {
  FilterNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegetarian: false,
          Filter.vegan: false,
        });

  void setFilter(Filter filter, bool active) {
    state = {...state, filter: active};
  }

  void setFilters(Map<Filter, bool> filters) {
    state = filters;
  }
}

final filterProvider = StateNotifierProvider<FilterNotifier, Map<Filter, bool>>(
    (ref) => FilterNotifier());

final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final filters = ref.watch(filterProvider);
  return meals.where((element) {
    if (filters[Filter.glutenFree]! && !element.isGlutenFree) {
      return false;
    }
    if (filters[Filter.lactoseFree]! && !element.isLactoseFree) {
      return false;
    }
    if (filters[Filter.vegetarian]! && !element.isVegetarian) {
      return false;
    }
    if (filters[Filter.vegan]! && !element.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
