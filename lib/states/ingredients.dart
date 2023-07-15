import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../types.dart';

class IngredientNotifier extends StateNotifier<List<Ingredient>> {
  IngredientNotifier() : super([]);

  void add(Ingredient ingredient) {
    state = [...state, ingredient];
  }

  void remove(String name) {
    state = [
      for (final ingredient in state)
        if (ingredient.name != name) ingredient,
    ];
  }
}
