import 'package:asad_crew/services/auth.dart';
import 'package:asad_crew/util/constants.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  // const SignIn({Key? key}) : super(key: key);
  final Function toggleView;
  SignIn({required this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  //Define service instance for Auth
  final AuthService _authService = AuthService();
  //This key is used to ID the form
  //Associate our form with this global (form state) key
  final _formKey = GlobalKey<FormState>();

  // Text field state
  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    //To be able to add app bar at the top
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.grey[400],
          //Removes drop shadow
          elevation: 0.0,
          title: Text('Sign in to Asad Crew'),
          // Shows buttons on the top right of the app bar
          actions: <Widget>[
            TextButton.icon(
                onPressed: () {
                  // this refers to state so we want to refer to widget
                  widget.toggleView();
                },
                icon: Icon(Icons.person),
                label: Text("Register"))
          ],
        ),
        //Body of the screen - what is shown to the user
        body: Container(
            //Padding for the container - symmetric is top and bottom are the same, left and right are the same
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0),
                  TextFormField(
                    //Decorate the text form with hints and focus styling
                    decoration: textInputDecoration.copyWith(hintText: 'Email'),
                    validator: (value) =>
                        value!.isEmpty ? "Enter an email" : null,
                    onChanged: (value) => {
                      setState(
                        () => email = value,
                      )
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    //Decorate the text form with hints and focus styling
                    decoration: textInputDecoration.copyWith(
                        hintText: 'Password'), //password so will not show
                    obscureText: true,
                    validator: (value) => value!.length < 6
                        ? "Enter a password with length of more than 6 "
                        : null,
                    onChanged: (value) => {
                      setState(
                        () => password = value,
                      )
                    },
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                      onPressed: () async {
                        //Only if validate returns null from validators in form will this be valid
                        if (_formKey.currentState!.validate()) {
                          //not sure if null or user so dynamic
                          dynamic result = await _authService.signInWithCred(
                              email, password);
                          if (result == null) {
                            setState(() => error = "invalid user credentials");
                          }
                        }
                      },
                      style:
                          ElevatedButton.styleFrom(primary: Colors.pink[400]),
                      child: Text(
                        'Sign in',
                        style: TextStyle(color: Colors.white),
                      )),
                  SizedBox(
                    height: 12.0,
                  ),
                  Text(error,
                      style: TextStyle(color: Colors.red[400], fontSize: 14.0))
                ],
              ),
            )));
  }
}
