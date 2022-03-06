import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});
  //Reference to collection from the database
  //Can use this to add new documents
  final CollectionReference asadCrewCollection =
      FirebaseFirestore.instance.collection("crews");

  Future updateUserData(String sugars, String name, int strength) async {
    //If this document is not found firestore will create it for us
    //When user signs up and uid of the user is passed in that document is tied to that user
    return await asadCrewCollection.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }
}
