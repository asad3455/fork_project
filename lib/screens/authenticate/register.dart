import 'package:asad_crew/services/auth.dart';
import 'package:asad_crew/util/constants.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  // const Register({Key? key}) : super(key: key);
  final Function toggleView;
  Register({required this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
          title: const Text('Sign up to Asad Crew'),
          // Shows buttons on the top right of the app bar
          actions: <Widget>[
            TextButton.icon(
                onPressed: () {
                  // this refers to state so we want to refer to widget
                  widget.toggleView();
                },
                icon: const Icon(Icons.person),
                label: const Text("Sign in"))
          ],
        ),
        //Body of the screen - what is shown to the user
        body: Container(
            //Padding for the container - symmetric is top and bottom are the same, left and right are the same
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
              //Assigning key to the form - keeps track of the state of our form
              key: _formKey,
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 20.0),
                  TextFormField(
                    //Decorate the text form with hints
                    decoration: textInputDecoration,
                    validator: (value) =>
                        value!.isEmpty ? "Enter an email" : null,
                    onChanged: (value) => {
                      setState(
                        () => email = value,
                      )
                    },
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    decoration: textInputDecoration,
                    //password so will not show
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
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                      onPressed: () async {
                        //Only if validate returns null from validators in form will this be valid
                        if (_formKey.currentState!.validate()) {
                          //not sure if null or user so dynamic
                          dynamic result = await _authService.registerWithCred(
                              email, password);
                          if (result == null) {
                            setState(() => error = "invalid user");
                          }
                        }
                      },
                      style:
                          ElevatedButton.styleFrom(primary: Colors.pink[400]),
                      child: const Text(
                        'Register',
                        style: TextStyle(color: Colors.white),
                      )),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Text(error,
                      style: TextStyle(color: Colors.red[400], fontSize: 14.0))
                ],
              ),
            )));
  }
}
