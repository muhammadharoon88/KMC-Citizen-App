import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:kmcapp/modules/authentication/viewModels/register_view_model.dart';
import 'package:kmcapp/res/assets/images_assets.dart';
import 'package:kmcapp/res/color/appcolors.dart';
import 'package:kmcapp/modules/authentication/services/register_view_dialogue_button.dart';
import 'package:kmcapp/modules/authentication/services/service_custom_textfield.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final RegisterViewModel _viewModel = Get.put(RegisterViewModel());

  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _createPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _createPasswordController.dispose();
    _confirmPasswordController.dispose();
  }

  void _register() {
    if (_formKey.currentState!.validate()) {
      _viewModel.register(
        _firstNameController.text.trim(),
        _lastNameController.text.trim(),
        _emailController.text.trim(),
        _createPasswordController.text.trim(),
        _confirmPasswordController.text.trim(),
      );
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
                        key: _formKey,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: CustomTextField(
                                    prefixIcon: Icons.account_circle,
                                    hintText: "First Name",
                                    controller: _firstNameController,
                                    fillColor: AppColors.greenColor,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: CustomTextField(
                                    prefixIcon: Icons.account_circle,
                                    hintText: "Last Name",
                                    controller: _lastNameController,
                                    fillColor: AppColors.greenColor,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            CustomTextField(
                              prefixIcon: Icons.email_rounded,
                              hintText: "Username(E-mail or Mobile No.)",
                              controller: _emailController,
                              fillColor: AppColors.greenColor,
                            ),
                            const SizedBox(height: 8),
                            CustomTextField(
                              prefixIcon: Icons.key_rounded,
                              hintText: "Create New Password",
                              obscureText: true,
                              controller: _createPasswordController,
                              fillColor: AppColors.greenColor,
                            ),
                            const SizedBox(height: 8),
                            CustomTextField(
                              prefixIcon: Icons.key_rounded,
                              hintText: "Confirm New Password",
                              obscureText: true,
                              controller: _confirmPasswordController,
                              fillColor: AppColors.greenColor,
                            ),
                            const SizedBox(height: 8),
                            registerViewGendarDropDown(_viewModel
                                .genderController.selectedGender.value),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: _register,
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
                                elevation: MaterialStateProperty.all<double>(4),
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
        ),
      ),
    );
  }
}
