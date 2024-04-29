import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kmcapp/home/homevIew.dart';
import 'package:kmcapp/res/assets/images_assets.dart';
import 'package:kmcapp/res/color/appcolors.dart';
import 'package:get/get.dart';
import 'package:kmcapp/res/routes/routesname.dart';
import 'package:kmcapp/view_model/services/register_view_textfield_service.dart';
import 'package:flutter/services.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  void login() async {
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
      await _auth
          .signInWithEmailAndPassword(
        email: _emailController.text.toString(),
        password: _passwordController.text.toString(),
      )
          .then((value) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login Succesfully'),
            duration: Duration(seconds: 2),
            backgroundColor: AppColors.redColor,
          ),
        );
      }).onError((error, stackTrace) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Invalid Email or Password'),
            duration: Duration(seconds: 2),
            backgroundColor: AppColors.redColor,
          ),
        );
      });
      // Navigate to next screen after successful login
    } catch (e) {
      // Handle login failure
      debugPrint('Login failed: $e');
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(
      //     content: Text("EEEEEE"),
      //     duration: Duration(seconds: 2),
      //     backgroundColor: AppColors.redColor,
      //   ),
      // );
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  var textColor = AppColors.blackColor.obs;

  void changeTextColor() {
    textColor.value = AppColors.redColor;
  }

  // fuction for GoogleSignin

  handleGoogleSignin() {
    signInWithGoogle().then((user) {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const HomeView()));
    });
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        SystemNavigator.pop();
      },
      // onPopInvoked: (didPop) =>  ,
      child: SafeArea(
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
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          "LOGIN OR REGISTER",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.greenColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            fontFamily: "FontMain",
                          ),
                        ),
                        const SizedBox(
                            height:
                                25), // Adding space between text and text fields
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: CustomTextField(
                            prefixIcon: Icons.email_rounded,
                            hintText: "Username(E-mail or Mobile No.)",
                            controller: _emailController,
                          ),
                        ),
                        const SizedBox(
                            height: 8), // Adjusting space between text fields
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: CustomTextField(
                            prefixIcon: Icons.key_rounded,
                            hintText: "Password",
                            obscureText: true,
                            controller: _passwordController,
                          ),
                        ),

                        // const SizedBox(
                        //     height:
                        //         2), // Adjusting space between text field and buttons

                        Align(
                          alignment: Alignment.centerRight,
                          child: Obx(
                            () => TextButton(
                              onPressed: () {
                                changeTextColor(); // Call function to change text color
                                Get.toNamed(RouteName.forgotView);
                              },
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  color: textColor.value,
                                ),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    login();
                                  },
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    minimumSize:
                                        MaterialStateProperty.all<Size>(
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
                                    "LOGIN",
                                    style: TextStyle(
                                      color: AppColors.whiteColor,
                                      fontFamily: "FontMain",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Get.toNamed(RouteName.registerView);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    minimumSize:
                                        const Size(double.infinity, 40),
                                    elevation: 4,
                                    backgroundColor: AppColors.greenColor,
                                  ),
                                  child: const Text(
                                    "REGISTER NOW",
                                    style: TextStyle(
                                      color: AppColors.whiteColor,
                                      fontFamily: "FontMain",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(
                          height: 70,
                        ),

                        const Text(
                          "OR CONNECT VIA",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                      minimumSize:
                                          MaterialStateProperty.all<Size>(
                                        const Size(double.infinity, 40),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                        AppColors.facebookColor,
                                      ),
                                      elevation:
                                          MaterialStateProperty.all<double>(4),
                                    ),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              ImageAssets.facebookIcon),
                                          height: 25,
                                        ),
                                        Text(
                                          "FACEBOOK",
                                          style: TextStyle(
                                            color: AppColors.whiteColor,
                                            fontFamily: "FontMain",
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: ElevatedButton(
                                    onPressed: () {
                                      handleGoogleSignin();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      minimumSize:
                                          const Size(double.infinity, 40),
                                      elevation: 4,
                                      backgroundColor: AppColors.googleColor,
                                    ),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              ImageAssets.googleIcon),
                                          height: 25,
                                        ),
                                        Text(
                                          "GOOGLE",
                                          style: TextStyle(
                                            color: AppColors.blackColor,
                                            fontFamily: "FontMain",
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.09,
                        ),
                        Image.asset(
                          ImageAssets.registerScreenBottomImage,
                          height: 100,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
