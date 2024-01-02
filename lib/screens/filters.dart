import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filter_provider.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(filterProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Your Filter')),
      body: Column(
        children: [
          SwitchListTile(
            value: filters[Filter.glutenFree]!,
            onChanged: (checked) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.glutenFree, checked);
            },
            title: Text(
              "Gluten-free",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              "Only include gluten-free meals",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: filters[Filter.lactoseFree]!,
            onChanged: (checked) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.lactoseFree, checked);
            },
            title: Text(
              "Lactose-free",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              "Only include lactose-free meals",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: filters[Filter.vegetarian]!,
            onChanged: (checked) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.vegetarian, checked);
            },
            title: Text(
              "Vegetarian",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              "Only include vegetarian meals",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: filters[Filter.vegan]!,
            onChanged: (checked) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.vegan, checked);
            },
            title: Text(
              "Vegan",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              "Only include vegan meals",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34, right: 22),
          )
        ],
      ),
    );
  }
}
