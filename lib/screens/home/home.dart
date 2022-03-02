import 'package:asad_crew/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return Scaffold(
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
    );
  }
}
