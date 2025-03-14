import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUp(String email, String password) async {
    try {
      final UserCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return UserCredential.user;
    } catch (e) {
      throw Exception("Sign-Up Failed $e");
    }
  }

  Future<User?> signIn(String email, String password) async {
    try {
      final UserCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return UserCredential.user;
    } catch (e) {
      throw Exception("Sign-In Failed $e");
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
