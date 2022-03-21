import 'package:asad_crew/models/recipe.dart';
import 'package:asad_crew/models/user.dart';
import 'package:asad_crew/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RecipeService {
  //Will not change - FirebaseAuth object type
  //Underscore means auth is a private var
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //create user obj based on firebase recipe
  MyRecipe? _recipeFromFB(Recipe? recipe) {
    return recipe != null ? MyRecipe(uid: recipe.uid) : null;
  }

  //register with email/pass
  Future addRecipe(Recipe recipe) async {
    try {
      //Create a new document from the UID
      await DatabaseService().addRecipe(recipe.name, recipe.difficulty,
          recipe.servings, recipe.ingredients, recipe.instructions);
      return _recipeFromFB(recipe);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
