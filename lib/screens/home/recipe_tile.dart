import 'package:asad_crew/models/recipe.dart';
import 'package:flutter/material.dart';
import 'package:asad_crew/models/crew.dart';

class RecipeTile extends StatelessWidget {
  // const CrewTile({Key? key}) : super(key: key);
  const RecipeTile({required this.recipe});
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          //image on left
          leading: CircleAvatar(
              radius: 25.0, backgroundColor: Colors.grey[recipe.difficulty]),
          title: Text(recipe.name),
          subtitle: Text('Serves ${recipe.servings} people(s)'),
        ),
      ),
    );
  }
}
