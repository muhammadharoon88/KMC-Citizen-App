import 'dart:async';
import 'package:get/get.dart';
import 'package:kmcapp/res/routes/routesname.dart';

class SplashServices {
  void islogin() {
    Timer(const Duration(seconds: 3), () {
      Get.toNamed(RouteName.loginView);
    });
  }
}
