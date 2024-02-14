import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer' as dev;

class FirebaseAuthServices {
  FirebaseAuth auth = FirebaseAuth.instance;
//User registration
  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      dev.log("$e");
    }
  }
//User Login
  Future<User?> loginWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      dev.log("$e");
    }
  }
}
