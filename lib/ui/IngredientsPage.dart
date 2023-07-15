import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../main.dart';
import '../types.dart';

class IngredientsPage extends ConsumerWidget {
  const IngredientsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ingredients = ref.watch(ingredientProvider);
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      children: [
        ...ingredients.map((i) => IngredientItem(ingredient: i)),
        const IngredientInput()
      ],
    );
  }
}

class IngredientInput extends ConsumerWidget {
  const IngredientInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      onSubmitted: (String name) {
        ref.read(ingredientProvider.notifier).add(Ingredient(name: name));
      },
    );
  }
}

class IngredientItem extends ConsumerWidget {
  IngredientItem({required this.ingredient})
      : super(key: ObjectKey(ingredient));
  final Ingredient ingredient;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      onTap: () {},
      title: Row(children: <Widget>[
        Expanded(
          child: Text(ingredient.name),
        ),
        IconButton(
          iconSize: 20,
          icon: const Icon(
            Icons.remove_circle,
          ),
          alignment: Alignment.centerRight,
          onPressed: () =>
              ref.read(ingredientProvider.notifier).remove(ingredient.name),
        ),
      ]),
    );
  }
}
