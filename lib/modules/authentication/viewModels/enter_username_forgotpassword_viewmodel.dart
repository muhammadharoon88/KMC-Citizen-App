// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordViewModel extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> isEmailRegistered(String email) async {
    try {
      await _auth.fetchSignInMethodsForEmail(email);
      return true; // Email is registered
    } catch (e) {
      return false; // Email is not registered
    }
  }
}
