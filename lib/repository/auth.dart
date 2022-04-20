import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthRepo {
  final FirebaseAuth _firebaseAuth;
  AuthRepo(
    this._firebaseAuth,
  );

  Stream<User?> get authStateChanges => _firebaseAuth.idTokenChanges();

  Future<String> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      return e.message!;
    }
  }

  Future<String> signUp({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Signed up";
    } on FirebaseAuthException catch (e) {
      return e.message!;
    }
  }
}
