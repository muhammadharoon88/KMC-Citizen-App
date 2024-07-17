import 'package:flutter/material.dart';
import 'package:kmcapp/modules/authentication/services/service_custom_textfield.dart';
import 'package:kmcapp/res/assets/images_assets.dart';
import 'package:kmcapp/res/color/appcolors.dart';
// ignore: depend_on_referenced_packages

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final passwordController = TextEditingController();
  final reEnterPaswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage(ImageAssets.splashScreenLogoImage),
                height: 100,
              ),
              const Text(
                "KARACHI METROPOLITAN CORPORATION",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w900,
                  color: AppColors.greenColor,
                  letterSpacing: -1.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
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
                      borderRadius: BorderRadius.circular(10.0)),
                  height: 300,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 05,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 15.0,
                          ),
                          Text(
                            "RESET PASSWORD !!!",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              color: AppColors.greenColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "Reset you new password from here.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.greyDarksTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),

                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              "New Password",
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: CustomTextField(
                          prefixIcon: Icons.account_circle,
                          hintText: "Enter password",
                          controller: passwordController,
                          fillColor: AppColors.whiteColor,
                        ),
                      ),
                      const SizedBox(
                        height: 05,
                      ),

                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Confirm Password",
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: CustomTextField(
                          prefixIcon: Icons.account_circle,
                          hintText: "Re-enter password",
                          controller: reEnterPaswordController,
                          fillColor: AppColors.whiteColor,
                        ),
                      ),
                      // TextField Code Here
                      const SizedBox(
                        height: 15,
                      ),

                      // Elevated button for Next
                      SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppColors.greyDarksTextColor)),
                          child: const Text(
                            "CONTINUE",
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
    );
  }
}
