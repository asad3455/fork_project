import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:asad_crew/models/crew.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});
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

  //Get crew stream
  //Gets a snapshot of the current state of the database when document changes
  Stream<List<Crew>?> get crews {
    return asadCrewCollection.snapshots().map(_crewListFromSnapshot);
  }
}
