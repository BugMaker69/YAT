import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/cubits/recipe_cubit.dart';
import 'package:flutter_project/cubits/recipe_state.dart';
import 'package:flutter_project/models/recipe_model.dart';
import 'package:flutter_project/screens/recipe_details_screen.dart';
import 'package:flutter_project/widgets/recipe_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
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
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocBuilder<RecipeCubit, RecipeState>(
        builder: (context, state) {
          if (state is RecipeLoading) {
            return Center(
                child: CircularProgressIndicator(
              color: Color(0xFFE23E3E),
            ));
          } else if (state is RecipeError) {
            return Text(state.message);
          } else if (state is RecipeLoaded) {
            return ListView.builder(
              itemCount: state.recipes.length,
              itemBuilder: (context, index) => RecipeWidget(
                recipe: state.recipes[index],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          RecipeDetailsScteen(recipe: state.recipes[index]),
                    ),
                  );
                },
              ),
            );
          } else {
            return Center(child: Text("No Recipes"));
          }
        },
      ),
    );
  }
}
