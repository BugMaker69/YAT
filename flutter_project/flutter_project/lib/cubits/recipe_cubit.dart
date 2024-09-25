import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/models/recipe_model.dart';
import 'package:flutter_project/services/recipe_service.dart';

class RecipeCubit extends Cubit<List<Recipe>> {
  RecipeCubit() : super([]) {
    getRecipes();
  }

  final _service = RecipeService();

  void getRecipes() async {
    try {
      final result = await _service.getRecipes();
      emit(result);
    } catch (e) {}
  }
}
