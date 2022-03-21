import 'package:asad_crew/models/recipe.dart';
import 'package:asad_crew/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:asad_crew/models/crew.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});
  //Reference to collection from the database
  //Can use this to add new documents
  final CollectionReference asadCrewCollection =
      FirebaseFirestore.instance.collection("crews");
  final CollectionReference recipeCollection =
      FirebaseFirestore.instance.collection("recipes");

  Future updateUserData(String sugars, String name, int strength) async {
    //If this document is not found firestore will create it for us
    //When user signs up and uid of the user is passed in that document is tied to that user
    return await asadCrewCollection.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  //Update recipe data
  Future addRecipe(String name, int difficulty, int servings,
      String ingredients, String instructions) async {
    //If this document is not found firestore will create it for us
    //When user signs up and uid of the user is passed in that document is tied to that user
    return await recipeCollection.add({
      'name': name,
      'difficulty': difficulty,
      'servings': servings,
      'ingredients': ingredients,
      'instructions': instructions,
    });
  }

  //Crew from snapshot
  List<Crew> _crewListFromSnapshot(QuerySnapshot? snapshot) {
    try {
      return snapshot!.docs.map((doc) {
        return Crew(
            name: doc.get('name') ?? "",
            sugars: doc.get('sugars') ?? "0",
            strength: doc.get('strength') ?? 0);
      }).toList();
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  //Crew from snapshot
  List<Recipe> _recipeListFromSnapshot(QuerySnapshot? snapshot) {
    try {
      return snapshot!.docs.map((doc) {
        return Recipe(
          uid: doc.id,
          name: doc.get('name') ?? "",
          servings: doc.get('servings') ?? 0,
          difficulty: doc.get('difficulty') ?? 0,
          instructions: doc.get('instructions') ?? "",
          ingredients: doc.get('ingredients') ?? "",
        );
      }).toList();
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  //UserData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot? snapshot) {
    return UserData(
        uid: uid,
        name: snapshot!['name'],
        sugars: snapshot['sugars'],
        strength: snapshot['strength']);
  }

  //Get crew stream
  //Gets a snapshot of the current state of the database when document changes
  Stream<List<Crew>?> get crews {
    return asadCrewCollection.snapshots().map(_crewListFromSnapshot);
  }

  //Get crew stream
  //Gets a snapshot of the current state of the database when document changes
  Stream<List<Recipe>?> get recipes {
    return recipeCollection.snapshots().map(_recipeListFromSnapshot);
  }

  //get user doc stream
  Stream<UserData> get userData {
    return asadCrewCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
