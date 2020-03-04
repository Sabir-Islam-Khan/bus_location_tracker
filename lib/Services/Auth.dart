import 'package:firebase_auth/firebase_auth.dart';

import '../Models/User.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future registerWithMail(String mail, String password) async {

    try {

      AuthResult result = await _auth.createUserWithEmailAndPassword(email: mail, password: password);

      FirebaseUser user = result.user;

      return _userFromFirebaseUser(user);

    } catch(e){

      print(e.toString());

      return null;

    }
  }

  User _userFromFirebaseUser( FirebaseUser user ) {

    return user != null ? User( uid : user.uid) : null ; 
  }

   Stream<User> get user {
    return _auth.onAuthStateChanged
      //.map((FirebaseUser user) => _userFromFirebaseUser(user));
      .map(_userFromFirebaseUser);
  }

}