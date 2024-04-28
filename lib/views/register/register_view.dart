import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kmcapp/res/assets/images_assets.dart';
import 'package:kmcapp/res/color/appcolors.dart';
import 'package:kmcapp/view_model/RegisterViewDialogueButton.dart';
import 'package:kmcapp/view_model/services/register_view_dropDown.dart';
import 'package:kmcapp/view_model/services/register_view_textfield_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kmcapp/views/login/loginView.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  // GenderController genderController = Get.put(GenderController());
  final GenderController genderController = Get.put(GenderController());

  final _formkey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _createPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _genderController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance; // Cloud Firestore instance

  @override
  void dispose() {
    // -TODO: implement dispose
    super.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _createPasswordController.dispose();
    _confirmPasswordController.dispose();
    _genderController.dispose();
  }

  void _register() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.none)) {
      // No internet connection
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No internet connection!'),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.red,
        ),
      );
      return; // Exit the function
    }

    try {
      UserCredential usercredential =
          await _auth.createUserWithEmailAndPassword(
              email: _emailController.text,
              password: _confirmPasswordController.text);

      // Store additional user data in Firebase Realtime Database
      await _firestore
          .collection("UserAccDetails")
          .doc(usercredential.user!.uid)
          .set(
        {
          "firstName": _firstNameController.text,
          "lastName": _lastNameController.text,
          "email": _emailController.text,
          "createPassword": _createPasswordController.text,
          "confirmPassword": _confirmPasswordController.text,
          "gender": genderController.selectedGender.value,
        },
      );
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(
      //     content: Text('Register Succesfully'),
      //     duration: Duration(seconds: 2),
      //     backgroundColor: AppColors.greenColor,
      //   ),
      // );

      // const Dialog(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text("Please Hold"),
      //       SpinKitCircle(
      //         color: AppColors.greenDarkColor,
      //         size: 50,
      //       )
      //     ],
      //   ),
      // );

      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        barrierDismissible:
            false, // Dialog cannot be dismissed by tapping outside
        builder: (BuildContext context) {
          return const AlertDialog(
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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

      // Delay for 2 seconds
      await Future.delayed(Duration(seconds: 2));

      // Navigate to login screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const LoginView()), // Replace LoginScreen with your actual login screen widget
      );
    } catch (e) {
      // print("Error: $e");
      // Handle registration errors and display appropriate error message to the user
      String errorMessage = "An error occurred during registration.";
      if (e is FirebaseAuthException) {
        if (e.code == 'email-already-in-use') {
          errorMessage =
              'Your account is already registered! Please make login';
        }
        // Handle other FirebaseAuthException error codes as needed
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            duration: const Duration(seconds: 2),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xffffffff),
            ),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      //building image ha
                      ImageAssets.loginPageKMCBuildingImgae,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      //////KMC ka logo ha
                      ImageAssets.loginPageTopLogoImage,
                      width: double.infinity,
                      height: 120,
                    ),
                    const Positioned(
                      top: 150,
                      child: Text(
                        "KARACHI METROPOLITAN CORPORATION",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                          color: AppColors.greenColor,
                          letterSpacing: -1.0,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(top: 25),
                  child: Column(
                    children: [
                      const Text(
                        "REGISTER HERE",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.greenColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontFamily: "FontMain",
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 25),
                        width: 350,
                        child: Form(
                          key: _formkey,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomTextField(
                                      prefixIcon: Icons.account_circle,
                                      hintText: "First Name",
                                      controller: _firstNameController,
                                    ),
                                  ),
                                  Container(width: 8),
                                  Expanded(
                                    child: CustomTextField(
                                      prefixIcon: Icons.account_circle,
                                      hintText: "Last Name",
                                      controller: _lastNameController,
                                    ),
                                  ),
                                ],
                              ),
                              Container(height: 8),
                              CustomTextField(
                                prefixIcon: Icons.email_rounded,
                                hintText: "Username(E-mail or Mobile No.)",
                                controller: _emailController,
                              ),
                              Container(height: 8),
                              CustomTextField(
                                prefixIcon: Icons.key_rounded,
                                hintText: "Create New Password",
                                obscureText: true,
                                controller: _createPasswordController,
                              ),
                              Container(height: 8),
                              CustomTextField(
                                prefixIcon: Icons.key_rounded,
                                hintText: "Confirm New Password",
                                obscureText: true,
                                controller: _confirmPasswordController,
                              ),
                              Container(height: 8),
                              registerViewGendarDropDown(
                                  genderController.selectedGender.value),
                              // RegisterViewGendarDropDown(),
                              const SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  bool isValidEmail = RegExp(
                                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                      .hasMatch(_emailController.text);
                                  final password =
                                      _createPasswordController.text;

                                  // Validation for First Name

                                  if (_firstNameController.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text('Please enter First Name !'),
                                        duration: Duration(seconds: 2),
                                        backgroundColor: AppColors.redColor,
                                      ),
                                    );

                                    // Validation for Last Name
                                  } else if (_lastNameController.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text('Please enter Last Name !'),
                                        duration: Duration(seconds: 2),
                                        backgroundColor: AppColors.redColor,
                                      ),
                                    );
                                  }
                                  // Validation for Empty or Null Email
                                  else if (_emailController.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Please enter Email !'),
                                        duration: Duration(seconds: 2),
                                        backgroundColor: AppColors.redColor,
                                      ),
                                    );
                                  }

                                  // Verification of Email Format

                                  else if (!isValidEmail) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Please Valid Email !'),
                                        duration: Duration(seconds: 2),
                                        backgroundColor: AppColors.redColor,
                                      ),
                                    );
                                  }
                                  // Verification of Password
                                  else if (_createPasswordController
                                      .text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text('Please enter Password !'),
                                        duration: Duration(seconds: 2),
                                        backgroundColor: AppColors.redColor,
                                      ),
                                    );

                                    // Verification of Password Length
                                  } else if (password.length < 8 ||
                                      password.length > 20) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Password must have 8-20 characters !'),
                                        duration: Duration(seconds: 2),
                                        backgroundColor: AppColors.redColor,
                                      ),
                                    );

                                    // Verification of Password Comparision
                                  } else if (_createPasswordController.text !=
                                      _confirmPasswordController.text) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Password not matched !'),
                                        duration: Duration(seconds: 2),
                                        backgroundColor: AppColors.redColor,
                                      ),
                                    );
                                  } else {
                                    _register();
                                  }
                                },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  minimumSize: MaterialStateProperty.all<Size>(
                                    const Size(double.infinity, 40),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    AppColors.greenDarkColor,
                                  ),
                                  elevation:
                                      MaterialStateProperty.all<double>(4),
                                ),
                                child: const Text(
                                  "REGISTER",
                                  style: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontFamily: "FontMain",
                                    fontWeight: FontWeight.bold,
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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                Image.asset(
                  ImageAssets.registerScreenBottomImage,
                  height: 100,
                ),
              ],
            ),
          )),
    );
  }
}
