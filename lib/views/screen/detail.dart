import 'package:flutter/material.dart';
import 'package:mexican_recipe/models/recipe.dart';
import 'package:mexican_recipe/views/widgets/detail_mobilepage.dart';
import 'package:mexican_recipe/views/widgets/detail_webpage.dart';

class RecipeDetailPage extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailPage({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title ?? ''),
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 1000) {
          return SingleChildScrollView(child: DetailWebPage(recipe: recipe));
        } else {
          return SingleChildScrollView(child: DetailMobilePage(recipe: recipe));
        }
      }),
    );
  }
}
