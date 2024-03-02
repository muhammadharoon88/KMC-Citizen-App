import 'package:flutter/material.dart';
import 'package:kmcapp/res/color/appcolors.dart';
import 'package:kmcapp/view_model/services/LoginViewDropDown.dart';
import 'package:kmcapp/view_model/services/loginviewTextFieldService.dart';
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
                  "assets/images/1.png",
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  //////KMC ka logo ha nichay name k sath
                  "assets/images/kmc_with_name.png",
                  width: double.infinity,
                  height: 180,
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(top: 25),
              child: Column(
                children: [
                  const Text(
                    "REGISTER HERE NOW",
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
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                prefixIcon: Icons.account_circle,
                                hintText: "First Name",
                                controller: _firstNmaecontroller,
                              ),
                            ),
                            Container(width: 8),
                            Expanded(
                              child: CustomTextField(
                                prefixIcon: Icons.account_circle,
                                hintText: "Last Name",
                                controller: _lastNmaecontroller,
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
                        LoginViewGendarDropDown(),
                        ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "REGISTER",
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontFamily: "FontMain",
                                fontWeight: FontWeight.bold,
                              ),
                            ))
                      ],
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
