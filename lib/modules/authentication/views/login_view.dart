import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:kmcapp/modules/authentication/models/user_model_login.dart';
import 'package:kmcapp/modules/authentication/viewModels/login_view_model.dart';
import 'package:kmcapp/res/assets/images_assets.dart';
import 'package:kmcapp/res/color/appcolors.dart';
import 'package:kmcapp/res/routes/routesname.dart';
import 'package:kmcapp/modules/authentication/services/service_custom_textfield.dart';
import 'package:flutter/services.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final LoginViewModel _viewModel = Get.find();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        SystemNavigator.pop();
      },
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xffffffff),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        ImageAssets.loginPageKMCBuildingImgae,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
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
                          "LOGIN OR REGISTER",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.greenColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            fontFamily: "FontMain",
                          ),
                        ),
                        const SizedBox(height: 25),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: CustomTextField(
                            prefixIcon: Icons.email_rounded,
                            hintText: "Username (E-mail or Mobile No.)",
                            fillColor: AppColors.greenColor,
                            controller: _emailController,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: CustomTextField(
                            prefixIcon: Icons.key_rounded,
                            hintText: "Password",
                            obscureText: true,
                            controller: _passwordController,
                            fillColor: AppColors.greenColor,
                          ),
                        ),

                        // FORGOT PASSWORD TEXT BUTTON || FORGOT PASSWORD TEXT BUTTON
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Get.toNamed(
                                  RouteName.enterUsernameForgotPasswordView);
                            },
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(color: AppColors.redColor),
                            ),
                          ),
                        ),

                        // LOGIN BUTTON || LOGIN BUTTON
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    _viewModel.login(
                                      UserModelLogin(
                                        email: _emailController.text.trim(),
                                        password:
                                            _passwordController.text.trim(),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    minimumSize:
                                        const Size(double.infinity, 40),
                                    backgroundColor: AppColors.greenDarkColor,
                                    elevation: 4,
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

                              // REGISTER NOW BUTTON || REGISTER NOW BUTTON
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
                                    backgroundColor: AppColors.greenColor,
                                    elevation: 4,
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
                        const SizedBox(height: 70),

                        // OR CONNECT VIA    || OR CONNECT VIA

                        const Text(
                          "OR CONNECT VIA",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              // FACEBOOK BUTTON   ||    FACEBOOK BUTTON
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    minimumSize:
                                        const Size(double.infinity, 40),
                                    backgroundColor: AppColors.facebookColor,
                                    elevation: 4,
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
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),

                              // GOOGLE BUTTON   ||    GOOGLE BUTTON
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    _viewModel.handleGoogleSignin();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    minimumSize:
                                        const Size(double.infinity, 40),
                                    backgroundColor: AppColors.googleColor,
                                    elevation: 4,
                                  ),
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image(
                                        image:
                                            AssetImage(ImageAssets.googleIcon),
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
                                  ),
                                ),
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
            ),
          ),
        ),
      ),
    );
  }
}
