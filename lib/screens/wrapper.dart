import 'package:asad_crew/models/user.dart';
import 'package:asad_crew/screens/authenticate/authenticate.dart';
import 'package:asad_crew/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // accessing user data from the provider
    // everytime we get a new value we access user data
    // either null if user logs out or value if user logs in
    final user = Provider.of<MyUser?>(context);
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
