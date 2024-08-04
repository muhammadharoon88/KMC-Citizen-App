import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:kmcapp/res/routes/routesname.dart';

class SplashServices {
  void isLogin() {
    // Show the splash screen for 3 seconds
    Timer(const Duration(seconds: 3), () {
      final auth = FirebaseAuth.instance;
      final user = auth.currentUser;

      if (user != null) {
        // Navigate to home view if user is logged in
        Get.offAllNamed(RouteName.homeView);
      } else {
        // Navigate to login view if user is not logged in
        Get.offAllNamed(RouteName.loginView);
      }
    });
  }
}
