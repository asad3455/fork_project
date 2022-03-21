//Widget to cycle through crews
import 'package:asad_crew/models/crew.dart';
import 'package:asad_crew/models/recipe.dart';
import 'package:asad_crew/screens/home/recipe_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecipeList extends StatefulWidget {
  const RecipeList({Key? key}) : super(key: key);

  @override
  State<RecipeList> createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  @override
  Widget build(BuildContext context) {
    //Access data from the stream
    final recipes = Provider.of<List<Recipe>?>(context);
    if (recipes != null) {
      return ListView.builder(
        itemCount: recipes.length,
        //0 index
        itemBuilder: (context, index) {
          return RecipeTile(recipe: recipes[index]);
        },
      );
    } else {
      return CircularProgressIndicator();
    }
  }
}
