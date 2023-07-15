import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../main.dart';
import '../types.dart';

class RecipePage extends ConsumerWidget {
  const RecipePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<Recipe> recipe = ref.watch(recipeProvider);

    return recipe.when(
        error: (err, stack) => Text('Error: $err'),
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (recipe) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const RecipeHeader(),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: recipe.steps.length,
                  itemBuilder: (_, i) => StepView(
                    description: recipe.steps[i],
                    stepNumber: i + 1,
                  ),
                ),
              ),
            ],
          );
        });
  }
}

class RecipeHeader extends ConsumerWidget {
  const RecipeHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<Recipe> recipe = ref.watch(recipeProvider);

    return recipe.whenOrNull(data: (recipe) {
          return Card(
            color: Colors.white,
            elevation: 1,
            child: ExpansionTile(
              title: Text(recipe.name),
              shape: const Border(),
              initiallyExpanded: true,
              childrenPadding:
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              expandedAlignment: Alignment.topLeft,
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              children: [...recipe.ingredients.map((i) => Text('- ${i.name}'))],
            ),
          );
        }) ??
        Text('data');
  }
}

class StepView extends StatelessWidget {
  StepView({required this.description, required this.stepNumber})
      : super(key: ObjectKey(description));
  final String description;
  final int stepNumber;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('Step: ${stepNumber}'),
        subtitle: Text(description),
      ),
    );
  }
}
