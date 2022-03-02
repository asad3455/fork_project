import 'package:asad_crew/models/user.dart';
import 'package:asad_crew/screens/wrapper.dart';
import 'package:asad_crew/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  //Have to intialise firebase instance before using it
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Stream provider - actively listens and expects a MyUser object to be returned
    return StreamProvider<MyUser?>.value(
      // required in new stream provider version
      initialData: null,
      // which stream we want to listen to - in AuthService
      value: AuthService().user,
      // Stream provider is wrapping the wrapper - so can be used within
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
