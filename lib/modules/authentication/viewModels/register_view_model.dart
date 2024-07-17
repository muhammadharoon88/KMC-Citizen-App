// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:kmcapp/modules/authentication/models/user_model_register.dart';
import 'package:kmcapp/modules/authentication/services/auth_services.dart';
import 'package:kmcapp/res/color/appcolors.dart';
import 'package:kmcapp/res/routes/routesname.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kmcapp/modules/authentication/services/register_view_dialogue_button.dart';

class RegisterViewModel extends GetxController {
  final AuthService _authService = AuthService(); // Your authentication service
  final RxBool isLoading = false.obs; // Observable for loading state

  final GenderController genderController = Get.put(GenderController());

  void register(String firstName, String lastName, String email,
      String createPassword, String confirmPassword) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.none)) {
      // No internet connection
      Get.snackbar(
        "Internet Error",
        "No internet connection!",
        backgroundColor: AppColors.redColor,
        duration: const Duration(seconds: 2),
      );
      return; // Exit the function
    }

    try {
      isLoading.value = true; // Set loading state to true

      UserCredential userCredential =
          await _authService.createUserWithEmailAndPassword(
              email: email, password: confirmPassword);

      UserModelRegister userModelRegister = UserModelRegister(
        firstName: firstName,
        lastName: lastName,
        email: email,
        createPassword: createPassword,
        confirmPassword: confirmPassword,
        gender: genderController.selectedGender.value,
      );

      await FirebaseFirestore.instance
          .collection("UserAccDetails")
          .doc(userCredential.user!.uid)
          .set(userModelRegister.toMap());

      Get.back(); // Close the Dialog
      Get.offAllNamed(RouteName.loginView);

      Get.snackbar(
        'Registration Successful',
        'You can now login with your credentials',
        backgroundColor: AppColors.greenColor,
        colorText: AppColors.whiteColor,
        duration: const Duration(seconds: 2),
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.back(); // Close the Dialog
      Get.snackbar(
        'Registration Error',
        e.toString(),
        backgroundColor: AppColors.redColor,
        duration: const Duration(seconds: 2),
      );
    } finally {
      isLoading.value = false; // Set loading state to false
    }
  }
}
