import 'package:flutter/material.dart';
import 'package:mexican_recipe/models/recipe.dart';
import 'package:mexican_recipe/views/widgets/bt_like.dart';

class DetailMobilePage extends StatelessWidget {
  final Recipe recipe;
  const DetailMobilePage({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          'assets/img/${recipe.image}',
          height: 350.0,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              recipe.title?.toUpperCase() ?? '',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.restaurant,
                      color: Colors.amber,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      recipe.portion ?? '',
                      style: const TextStyle(fontSize: 14.0),
                    ),
                  ],
                ),
              ),
            ),
            const FavoriteButton(),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Icon(
                Icons.alarm,
                color: Colors.amber,
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Text(
                  recipe.time ?? '',
                  style: const TextStyle(fontSize: 14.0),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            recipe.description ?? '',
            style: const TextStyle(fontSize: 14.0),
            textAlign: TextAlign.justify,
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Ingredients:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
        ),
        for (String ingredient in recipe.ingredients ?? [])
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '- $ingredient',
              style: const TextStyle(fontSize: 14.0),
            ),
          ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Method:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
        ),
        for (Map<String, String> step in recipe.method ?? [])
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (String key in step.keys)
                  Text(
                    '$key: ${step[key]}',
                    style: const TextStyle(fontSize: 14.0),
                    textAlign: TextAlign.justify,
                  ),
              ],
            ),
          ),
      ],
    );
  }
}
