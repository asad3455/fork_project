import 'package:asad_crew/screens/authenticate/register.dart';
import 'package:asad_crew/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  //Boolean value of whether sign in is active or not
  // if true show sign in widget
  bool showSignIn = true;

  // Function to toggle showSignIn
  void toggleView() {
    // !showSignIn will reverse the current value stored in showSignIn
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}
