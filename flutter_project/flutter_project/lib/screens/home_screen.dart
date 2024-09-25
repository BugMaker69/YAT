import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/cubits/recipe_cubit.dart';
import 'package:flutter_project/models/recipe_model.dart';
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
      body: BlocBuilder<RecipeCubit, List<Recipe>>(
        builder: (context, state) => ListView.builder(
          itemCount: state.length,
          itemBuilder: (context, index) => RecipeWidget(
            recipe: state[index],
            onTap: () {},
          ),
        ),
      ),
    );
  }
}
