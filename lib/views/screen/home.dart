// ignore_for_file: library_prefixes, use_key_in_widget_constructors

import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;
import 'package:mexican_recipe/models/recipe.dart';
import 'package:flutter/material.dart';
import 'package:mexican_recipe/views/widgets/food_card.dart';
import 'package:mexican_recipe/views/widgets/food_card_grid.dart';
import 'package:mexican_recipe/views/widgets/home_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _loadRecipes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              List<Recipe> recipes = snapshot.data as List<Recipe>;
              return LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth <= 670) {
                    return CustomScrollView(
                      slivers: [
                        const HomeAppbar(),
                        FoodCard(recipes: recipes, gridCount: 0),
                      ],
                    );
                  } else if (constraints.maxWidth <= 1070) {
                    return CustomScrollView(
                      slivers: [
                        const HomeAppbar(),
                        FoodCardGrid(recipes: recipes, gridCount: 2),
                      ],
                    );
                  } else if (constraints.maxWidth <= 1450) {
                    return CustomScrollView(
                      slivers: [
                        const HomeAppbar(),
                        FoodCardGrid(recipes: recipes, gridCount: 3),
                      ],
                    );
                  } else {
                    return CustomScrollView(
                      slivers: [
                        const HomeAppbar(),
                        FoodCardGrid(recipes: recipes, gridCount: 4),
                      ],
                    );
                  }
                },
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<List<Recipe>> _loadRecipes() async {
    final jsonData =
        await rootBundle.rootBundle.loadString('assets/data/recipe.json');
    List<Map<String, dynamic>> recipesData =
        (json.decode(jsonData) as List).cast<Map<String, dynamic>>();
    List<Recipe> recipes =
        recipesData.map((json) => Recipe.fromJson(json)).toList();
    return recipes;
  }
}
