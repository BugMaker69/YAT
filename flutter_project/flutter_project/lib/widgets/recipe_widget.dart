import 'package:flutter/material.dart';
import 'package:flutter_project/models/recipe_model.dart';

class RecipeWidget extends StatelessWidget {
  const RecipeWidget({required this.recipe, required this.onTap});
  // const RecipeWidget({super.key});

  final Recipe recipe;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              recipe.image,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.7),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Positioned(
            top: 15,
            left: 15,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(.6),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 18,
                  ),
                  SizedBox(width: 4),
                  Text(
                    "${recipe.rating}",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 15,
            bottom: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${recipe.name}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "${recipe.ingredients.length} Ingredients",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 15,
            bottom: 15,
            child: Text(
              "${recipe.caloriesPerServing} Kcal",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Positioned(
            top: 15,
            right: 15,
            child: Icon(
              Icons.more_vert,
              color: Colors.white,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
