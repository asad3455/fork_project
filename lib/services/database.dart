import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  //Reference to collection from the database
  //Can use this to add new documents
  final CollectionReference asadCrewCollection =
      FirebaseFirestore.instance.collection("crews");
}
