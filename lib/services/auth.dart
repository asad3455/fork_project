import 'package:asad_crew/models/user.dart';
import 'package:asad_crew/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //Will not change - FirebaseAuth object type
  //Underscore means auth is a private var
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj based on firebase user
  MyUser? _userFromFB(User? user) {
    return user != null ? MyUser(uid: user.uid) : null;
  }

  // auth change user stream
  // everytime user signs in or out we get a response down the stream
  Stream<MyUser?> get user {
    //same as .map((User? user) => _userFromFB(user)
    return _auth.authStateChanges().map(_userFromFB);
  }

  //sign in anon
  Future signInAnon() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      User user = userCredential.user!;
      return _userFromFB(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with email/pass
  Future signInWithCred(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = userCredential.user!;
      return _userFromFB(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register with email/pass
  Future registerWithCred(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      User user = userCredential.user!;
      //Create a new document from the UID
      await DatabaseService(uid: user.uid).updateUserData('0', 'new user', 100);
      return _userFromFB(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
