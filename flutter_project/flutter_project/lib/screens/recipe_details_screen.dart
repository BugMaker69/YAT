import 'package:flutter/material.dart';
import 'package:flutter_project/models/recipe_model.dart';

class RecipeDetailsScteen extends StatelessWidget {
  const RecipeDetailsScteen({super.key, required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFE23E3E),
                Color(0xFFFF6B6B),
                Color(0xFFFFB3B3),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
        ),
        title: Text(
          "Recipe App",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Image.network(recipe.image),
          SizedBox(height: 20),
          Text(
            recipe.name,
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
