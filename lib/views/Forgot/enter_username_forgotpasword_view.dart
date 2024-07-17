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

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Function to check if the email is registered with Firebase
  Future<bool> isEmailRegistered(String email) async {
    try {
      await _auth.fetchSignInMethodsForEmail(email);
      return true; // Email is registered
    } catch (e) {
      return false; // Email is not registered
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // resizeToAvoidBottomInset: true,
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
                          colors: [
                            AppColors.greyColor,
                            AppColors.whiteColor
                          ], // Add your desired colors here
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
                              const SizedBox(
                                width: 10.0,
                              ),
                              Image.asset(
                                ImageAssets.keyIcon,
                                height: 20,
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
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
                        const SizedBox(
                          width: 15.0,
                        ),
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
                              bool isValidEmail =
                                  RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                      .hasMatch(emailController.text);

                              showDialog(
                                // ignore: use_build_context_synchronously
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

                              await Future.delayed(const Duration(
                                  seconds: 2)); // Simulate some delay

                              if (emailController.text.isEmpty) {
                                // ignore: use_build_context_synchronously
                                Navigator.pop(context);

                                Fluttertoast.showToast(
                                    msg: "Please enter Usernane",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 2,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              } else if (!isValidEmail) {
                                Navigator.pop(context);
                                Fluttertoast.showToast(
                                    msg:
                                        "Your account is disabled ! Please contact to Administrator",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 2,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              } else {
                                Navigator.pop(context);
                                Get.toNamed(RouteName.selectSMSEMAILForOTPView);
                                Fluttertoast.showToast(
                                    msg: "Account verified",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 2,
                                    backgroundColor: AppColors.greenColor,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              }
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        AppColors.greyDarksTextColor)),
                            child: const Text(
                              "NEXT",
                              style: TextStyle(color: AppColors.whiteColor),
                            ),
                          ),
                        )
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
