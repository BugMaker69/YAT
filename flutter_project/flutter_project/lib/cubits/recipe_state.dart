import 'package:flutter/material.dart';
import 'package:flutter_project/models/recipe_model.dart';

@immutable
abstract class RecipeState {}

class RecipeInitial extends RecipeState {}

class RecipeLoading extends RecipeState {}

class RecipeLoaded extends RecipeState {
  final List<Recipe> recipes;

  RecipeLoaded({required this.recipes});
}

class RecipeError extends RecipeState {
  final String message;

  RecipeError({required this.message});
}
