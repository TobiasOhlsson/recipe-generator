import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_functions/cloud_functions.dart';

import '../types.dart';

class RecipeNotifier extends StateNotifier<AsyncValue<Recipe>> {
  RecipeNotifier() : super(const AsyncLoading());

  Future<void> generateRecipe() async {
    state = const AsyncLoading();
    HttpsCallable callable = FirebaseFunctions.instance.httpsCallable('generateRecipe');
    final results = await callable();
    state = AsyncData(Recipe.fromJson(results.data));
  }
}
