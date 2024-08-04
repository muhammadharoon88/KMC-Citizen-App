import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kmcapp/res/color/appcolors.dart';
import 'package:kmcapp/res/routes/routesname.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Get User name Function
  User? currentUser;

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

  Future<void> logout() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn();
      bool isGoogleSignedIn = await googleSignIn.isSignedIn();

      if (isGoogleSignedIn) {
        // Sign out from Google account
        await googleSignIn.signOut();
        await googleSignIn.disconnect();
      }

      // Sign out from Firebase
      await FirebaseAuth.instance.signOut();

      // Show logout success message
      Fluttertoast.showToast(msg: "Logout successful");

      // Navigate to login view
      Get.offAllNamed(RouteName.loginView);
    } catch (e) {
      // Show error message
      Fluttertoast.showToast(
        msg: "Error: ${e.toString()}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: AppColors.redColor,
        textColor: AppColors.whiteColor,
        fontSize: 16.0,
      );
    }
  }
}
