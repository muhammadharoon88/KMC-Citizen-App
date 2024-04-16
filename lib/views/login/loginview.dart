import 'package:flutter/material.dart';
import 'package:kmcapp/res/assets/images_assets.dart';
import 'package:kmcapp/res/color/appcolors.dart';
import 'package:kmcapp/view_model/services/RegisterViewDropDown.dart';
import 'package:kmcapp/view_model/services/RegisterViewTextFieldService.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _firstNmaecontroller = TextEditingController();
  final _lastNmaecontroller = TextEditingController();
  final _emailController = TextEditingController();
  final _createPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _genderController = TextEditingController();

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
                    Positioned(
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
                        "LOGIN",
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
                        child: Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: CustomTextField(
                                  prefixIcon: Icons.email_rounded,
                                  hintText: "Username(E-mail or Mobile No.)",
                                  controller: _emailController,
                                ),
                              ),
                              Container(height: 8),
                              Expanded(
                                child: CustomTextField(
                                  prefixIcon: Icons.key_rounded,
                                  hintText: "Password",
                                  obscureText: true,
                                  controller: _createPasswordController,
                                ),
                              ),
                              Container(height: 8),
                              Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text(
                                      "REGISTER",
                                      style: TextStyle(
                                        color: AppColors.whiteColor,
                                        fontFamily: "FontMain",
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
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
                                        Size(double.infinity, 40),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                        AppColors.greenDarkColor,
                                      ),
                                      elevation:
                                          MaterialStateProperty.all<double>(4),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text(
                                      "REGISTER",
                                      style: TextStyle(
                                        color: AppColors.whiteColor,
                                        fontFamily: "FontMain",
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(05),
                                      ),
                                      minimumSize: Size(double.infinity, 40),
                                      // primary: AppColors.greenDarkColor,
                                      elevation: 4,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
