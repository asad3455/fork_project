class MyRecipe {
  final String? uid;

  MyRecipe({this.uid});
}

class Recipe {
  final String? uid;
  final String name;
  final int difficulty;
  final int servings;
  final String ingredients;
  final String instructions;

  Recipe(this.uid, this.name, this.difficulty, this.servings, this.ingredients,
      this.instructions);
}
