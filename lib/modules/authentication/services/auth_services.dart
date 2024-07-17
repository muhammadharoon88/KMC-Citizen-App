// import 'package:firebase_auth/firebase_auth.dart';

// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   Future<UserCredential> signInWithEmailAndPassword(
//       {required String email, required String password}) async {
//     return await _auth.signInWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//   }

//   // Add more authentication methods as needed (e.g., signOut, signUp)
// }

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Method for login
  Future<UserCredential> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    return await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // Method for registration
  Future<UserCredential> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    return await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // Add more authentication methods as needed (e.g., signOut, signUp)
}
