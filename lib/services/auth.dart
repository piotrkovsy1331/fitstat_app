import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitstat_app/models/appUser.dart';
import 'database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //function creating user object based on User
  AppUser _userFromUser(User user) {
    return user != null ? AppUser(uid: user.uid) : null;
  }

//authentication change user stream
  Stream<AppUser> get user {
    return _auth.authStateChanges().map(_userFromUser);
    // .map((User user) => _userFromUser(user));
  }

  //anonymous sign
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  //sign in with an email

  Future signedInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // register with an email
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      // create a new document for the user with the uid
      await DatabaseService(uid: user.uid)
          .updateUserData("User", "sex", 0, 0, 0, "photo");

      await DatabaseService(uid: user.uid)
          .createProductData("foodName", "calories", 1, 1, 1, "imageUrl");

      return _userFromUser(user);
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
