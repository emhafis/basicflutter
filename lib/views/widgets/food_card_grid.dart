import 'package:flutter/material.dart';
import 'package:mexican_recipe/models/recipe.dart';
import 'package:mexican_recipe/views/screen/detail.dart';

class FoodCardGrid extends StatelessWidget {
  final int gridCount;
  final List<Recipe> recipes;
  const FoodCardGrid({Key? key, required this.recipes, required this.gridCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: gridCount, // Jumlah item per baris
        crossAxisSpacing: 15.0, // Jarak antar item secara horizontal
        mainAxisSpacing: 15.0, // Jarak antar item secara vertikal
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      RecipeDetailPage(recipe: recipes[index]),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                elevation: 4.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                        child: Stack(
                          children: [
                            Image.asset(
                              'assets/img/${recipes[index].image}',
                              height: 200.0,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              top: 5.0,
                              right: 5.0,
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 18,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      recipes[index].difficulty ?? '',
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          recipes[index].title?.toUpperCase() ?? '',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          recipes[index].description ?? '',
                          style: const TextStyle(fontSize: 14.0),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        childCount: recipes.length,
      ),
    );
  }
}
