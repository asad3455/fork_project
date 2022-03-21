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

  Recipe(
      {this.uid,
      required this.name,
      required this.difficulty,
      required this.servings,
      required this.ingredients,
      required this.instructions});
}
