import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kmcapp/modules/authentication/models/user_model_login.dart';
import 'package:kmcapp/modules/authentication/services/auth_services.dart';
import 'package:kmcapp/res/color/appcolors.dart';
import 'package:kmcapp/res/routes/routesname.dart';

class LoginViewModel extends GetxController {
  final AuthService _authService = AuthService(); // Your authentication service
  final RxBool isLoading = false.obs; // Observable for loading state

  void login(UserModelLogin user) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.none)) {
      // No internet connection
      // ignore: use_build_context_synchronously

      Get.snackbar(
        "Internet Error",
        "No internet connection!",
        backgroundColor: AppColors.redColor,
        duration: const Duration(seconds: 2),
      );

      return; // Exit the function
    }
    Get.dialog(
      const AlertDialog(
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Please Wait"),
            SizedBox(height: 20),
            SpinKitCircle(
              color: AppColors.greenDarkColor,
              size: 50,
            ),
          ],
        ),
      ),
      barrierDismissible: false,
    );

    try {
      isLoading.value = true; // Set loading state to true

      UserCredential userCredential =
          await _authService.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      debugPrint('User ID: ${userCredential.user!.uid}');
      Get.back(); // Close the Dialoguw Box

      // Navigate to home view on successful login
      Get.offAllNamed(RouteName.homeView);
    } catch (e) {
      // Handle login failure
      debugPrint('Login error: $e');
      Get.back(); // Close the Dia;ogue Box
      Get.snackbar(
        'Sorry',
        'Invalid Email or Password',
        backgroundColor: AppColors.redColor,
        duration: const Duration(seconds: 2),
        colorText: AppColors.whiteColor,
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false; // Set loading state to false
    }
  }

  // Method to handle Google sign-in
  void handleGoogleSignin() async {
    try {
      isLoading.value = true; // Set loading state to true

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // Navigate to home view on successful login
      Get.offAllNamed(RouteName.homeView);

      // Show success message
      Get.snackbar(
        'Login Successful',
        'Welcome ${userCredential.user!.displayName}',
        backgroundColor: AppColors.greenColor,
        colorText: AppColors.whiteColor,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      // Handle login failure
      debugPrint('Google sign-in error: $e');
      Get.snackbar(
        'Google Sign-in Error',
        'Failed to sign in with Google',
        backgroundColor: AppColors.redColor,
      );
    } finally {
      isLoading.value = false; // Set loading state to false
    }
  }
}
