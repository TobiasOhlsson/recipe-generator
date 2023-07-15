import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rexipe_generator/states/RecipeRequest.dart';
import 'package:rexipe_generator/types.dart';
import 'package:rexipe_generator/ui/IngredientsPage.dart';
import 'package:rexipe_generator/ui/RecipePage.dart';

import 'states/ingredients.dart';

final ingredientProvider =
    StateNotifierProvider<IngredientNotifier, List<Ingredient>>((ref) {
  return IngredientNotifier();
});

final recipeProvider =
    StateNotifierProvider<RecipeNotifier, AsyncValue<Recipe>>((ref) {
  return RecipeNotifier();
});

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: RecipeGenerator()));
}

class RecipeGenerator extends ConsumerWidget {
  const RecipeGenerator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Recipe Generator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainLayout(),
    );
  }
}

class MainLayout extends ConsumerStatefulWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  MainLayoutState createState() => MainLayoutState();
}

class MainLayoutState extends ConsumerState<MainLayout> {
  int _pageIndex = 0;

  static const List<Widget> pages = [
    IngredientsPage(),
    RecipePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Recipe Generator'),
        ),
        body: pages.elementAt(_pageIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            const BottomNavigationBarItem(
                icon: Icon(Icons.list), label: 'Ingredients'),
            BottomNavigationBarItem(
                icon: Icon(ref.watch(recipeProvider).isLoading
                    ? Icons.fastfood_outlined
                    : Icons.fastfood_rounded),
                activeIcon: Icon(Icons.fastfood_rounded),
                label: 'Recipe'),
          ],
          currentIndex: _pageIndex,
          onTap: (int index) {
            if (index == 1 && ref.read(recipeProvider).isLoading) {
              return;
            }
            setState(() {
              _pageIndex = index;
            });
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ref.read(recipeProvider.notifier).generateRecipe();
            setState(() {
              _pageIndex = 1;
            });
          },
          backgroundColor: Colors.purple,
          child: const Icon(Icons.search),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
