import 'package:flutter/material.dart';
import 'package:kmcapp/res/assets/images_assets.dart';
import 'package:kmcapp/res/color/appcolors.dart';
import 'package:kmcapp/view_model/services/RegisterViewDropDown.dart';
import 'package:kmcapp/view_model/services/register_view_textfield_service.dart';
import 'package:get/get.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formkey = GlobalKey<FormState>();
  final _firstNmaecontroller = TextEditingController();
  final _lastNmaecontroller = TextEditingController();
  final _emailController = TextEditingController();
  final _createPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _genderController = TextEditingController();

  // String selectedGender = ''; // Add a variable to hold the selected gender

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
                              RegisterViewGendarDropDown(
                                  // onGenderSelected: (gender) {
                                  //   setState(() {
                                  //     selectedGender =
                                  //         gender; // Update the selected gender
                                  //   });
                                  // },
                                  ),
                              // RegisterViewGendarDropDown(),
                              const SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                onPressed: () {},
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
                  height: 120,
                ),
              ],
            ),
          )),
    );
  }
}
