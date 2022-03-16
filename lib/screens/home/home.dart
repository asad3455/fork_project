import 'package:asad_crew/models/crew.dart';
import 'package:asad_crew/screens/home/crew_list.dart';
import 'package:asad_crew/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:asad_crew/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    //Setting up stream
    //Value of the stream is the crew provider
    return StreamProvider<List<Crew>?>.value(
      //No UID required because crews does not need it
      //We want this stream to be used to wrap the rest of the widget tree
      value: DatabaseService(uid: "").crews,
      initialData: null,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 78, 78, 78),
        appBar: AppBar(
          title: Text("Asad crew"),
          backgroundColor: Colors.grey[400],
          elevation: 0.0,
          //Appear in the top right of the app bar
          actions: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.person),
              onPressed: () async {
                await _auth.signOut();
              },
              label: Text("Log out"),
            )
          ],
        ),
        body: CrewList(),
      ),
    );
  }
}
