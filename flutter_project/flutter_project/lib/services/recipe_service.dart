import 'package:dio/dio.dart';
import 'package:flutter_project/models/recipe_model.dart';

class RecipeService {
  final _dio = Dio();

  Future<List<Recipe>> getRecipes() async {
    final response = await _dio.get("https://dummyjson.com/recipes");

    Map<String, dynamic> jsonData = response.data;

    List<dynamic> recipesJson = jsonData['recipes'];

    List<Recipe> recipes = recipesJson
        .map((json) => Recipe.fromJson(json as Map<String, dynamic>))
        .toList();

    return recipes;
  }
}
