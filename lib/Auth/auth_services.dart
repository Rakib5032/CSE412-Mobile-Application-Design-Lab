import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

ValueNotifier<AuthService> authServices = ValueNotifier(AuthService());

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();

  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    return await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<UserCredential> createAccount({
    required String email,
    required String password,
  }) async {
    return await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signOut() async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      throw Exception('Failed to sign out: ${e.toString()}');
    }
  }

//   Future<void> updateEmail({
//     required String newEmail,
// }) async {
//     try{
//       await firebaseAuth.currentUser?.updateEmail.(newEmail);
//     }
//     catch (e) {
//       throw Exception('Failed To update email');
//     }
//   }
}
