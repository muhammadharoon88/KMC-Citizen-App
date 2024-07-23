import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kmcapp/modules/authentication/services/service_custom_textfield.dart';
import 'package:kmcapp/res/assets/images_assets.dart';
import 'package:kmcapp/res/color/appcolors.dart';
import 'package:kmcapp/res/routes/routesname.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EnterUsernameForgotPassword extends StatefulWidget {
  const EnterUsernameForgotPassword({super.key});

  @override
  State<EnterUsernameForgotPassword> createState() =>
      _EnterUsernameForgotPasswordState();
}

class _EnterUsernameForgotPasswordState
    extends State<EnterUsernameForgotPassword> {
  final emailController = TextEditingController();
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  // Function to check if the email is registered with Firebase
  Future<bool> isEmailRegistered(String email) async {
    try {
      final firestore = FirebaseFirestore.instance;
      final querySnapshot = await firestore
          .collection('UserAccDetails')
          .where('email', isEqualTo: email)
          .get();

      // print("Query snapshot docs length: ${querySnapshot.docs.length}");

      return querySnapshot.docs.isNotEmpty;
    } catch (e) {
      // debugPrint("Error checking if email is registered: $e");
      return false;
    }
  }

  void checkUserAuthentication() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // print("User is signed in: ${user.email}");
    } else {
      // print("User is not signed in");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage(ImageAssets.splashScreenLogoImage),
                  height: 180,
                ),
                const Text(
                  "KARACHI METROPOLITAN CORPORATION",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    color: AppColors.greenColor,
                    letterSpacing: -1.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [AppColors.greyColor, AppColors.whiteColor],
                        ),
                        border: Border.all(color: AppColors.greyColor),
                        borderRadius: BorderRadius.circular(20.0)),
                    height: 260,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const SizedBox(width: 10.0),
                              Image.asset(
                                ImageAssets.keyIcon,
                                height: 20,
                              ),
                              const SizedBox(width: 10.0),
                              const Text(
                                "FORGOT PASSWORD?",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w900,
                                  color: AppColors.greenColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          child: Text(
                            "To reset your account password, enter username then click on next for next process.",
                            style: TextStyle(
                              color: AppColors.greyDarksTextColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 15.0),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 10.0),
                                child: Text(
                                  "Username",
                                  style: TextStyle(
                                    color: AppColors.greyDarksTextColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: CustomTextField(
                              prefixIcon: Icons.account_circle,
                              hintText: "Enter your username",
                              controller: emailController,
                              fillColor: AppColors.whiteColor,
                            ),
                          ),
                        ),
                        // Elevated button for Next
                        SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: ElevatedButton(
                            onPressed: () async {
                              final email = emailController.text.trim();
                              bool isValidEmail =
                                  RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                      .hasMatch(email);

                              // Check if the email is empty
                              if (email.isEmpty) {
                                Fluttertoast.showToast(
                                  msg: "Please enter Username",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 2,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                );
                                return;
                              }

                              // Check if the email format is valid
                              if (!isValidEmail) {
                                Fluttertoast.showToast(
                                  msg: "Invalid email format",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 2,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                );
                                return;
                              }

                              checkUserAuthentication();

                              // Show loading dialog
                              showDialog(
                                context: context,
                                barrierDismissible:
                                    false, // Dialog cannot be dismissed by tapping outside
                                builder: (BuildContext context) {
                                  return const AlertDialog(
                                    content: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text("Please Hold"),
                                        SizedBox(height: 20),
                                        SpinKitCircle(
                                          color: AppColors.greenDarkColor,
                                          size: 50,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );

                              // Check if the email is registered
                              bool isRegistered =
                                  await isEmailRegistered(email);

                              // Close the loading dialog
                              // ignore: use_build_context_synchronously
                              Navigator.pop(context);

                              if (!isRegistered) {
                                Fluttertoast.showToast(
                                  msg: "Email is not registered",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 2,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                );
                                return;
                              }

                              // Navigate to the next screen
                              Get.toNamed(RouteName.selectSMSEMAILForOTPView);

                              // Show success toast
                              Fluttertoast.showToast(
                                msg: "Account verified",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 2,
                                backgroundColor: AppColors.greenColor,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.greyDarksTextColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            child: const Text(
                              "NEXT",
                              style: TextStyle(color: AppColors.whiteColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
