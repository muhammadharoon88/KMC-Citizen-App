// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:kmcapp/res/assets/images_assets.dart';
// import 'package:kmcapp/res/color/appcolors.dart';
// import 'package:kmcapp/res/routes/routesname.dart';
// // ignore: depend_on_referenced_packages
// import 'package:get/get.dart';

// class EnterOTPForResetPasswordView extends StatefulWidget {
//   const EnterOTPForResetPasswordView({super.key});

//   @override
//   State<EnterOTPForResetPasswordView> createState() =>
//       _EnterOTPForResetPasswordViewState();
// }

// class _EnterOTPForResetPasswordViewState
//     extends State<EnterOTPForResetPasswordView> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         body: SingleChildScrollView(
//           child: Center(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Image(
//                   image: AssetImage(ImageAssets.splashScreenLogoImage),
//                   height: 180,
//                 ),
//                 const Text(
//                   "KARACHI METROPOLITAN CORPORATION",
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w900,
//                     color: AppColors.greenColor,
//                     letterSpacing: -1.0,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     decoration: BoxDecoration(
//                         gradient: const LinearGradient(
//                           begin: Alignment.bottomCenter,
//                           end: Alignment.topCenter,
//                           colors: [
//                             AppColors.greyColor,
//                             AppColors.whiteColor
//                           ], // Add your desired colors here
//                         ),
//                         border: Border.all(color: AppColors.greyColor),
//                         borderRadius: BorderRadius.circular(10.0)),
//                     height: 260,
//                     child: Column(
//                       children: [
//                         const SizedBox(
//                           height: 05,
//                         ),
//                         const Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             SizedBox(
//                               width: 15.0,
//                             ),
//                             Text(
//                               "OTP",
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w900,
//                                 color: AppColors.greenColor,
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),

//                         const Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 8.0),
//                           child: Text(
//                             "Please type the verification code sent to your mobile or email.",
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               color: AppColors.greyDarksTextColor,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 10.0,
//                         ),

//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               oTPtextfield(context),
//                               oTPtextfield(context),
//                               oTPtextfield(context),
//                               oTPtextfield(context),
//                               oTPtextfield(context),
//                               oTPtextfield(context),
//                             ],
//                           ),
//                         ),

//                         const SizedBox(
//                           height: 05,
//                         ),
//                         TextButton(
//                           onPressed: () {},
//                           child: const Text(
//                             "RESEND CODE",
//                             style: TextStyle(
//                               fontWeight: FontWeight.w800,
//                               color: AppColors.greenColor,
//                             ),
//                           ),
//                         ),

//                         const SizedBox(
//                           height: 05,
//                         ),

//                         // Elevated button for Next
//                         SizedBox(
//                           height: 50,
//                           width: MediaQuery.of(context).size.width * 0.8,
//                           child: ElevatedButton(
//                             onPressed: () {
//                               Get.toNamed(RouteName.resetPasswordView);
//                             },
//                             style: ButtonStyle(
//                                 backgroundColor:
//                                     MaterialStateProperty.all<Color>(
//                                         AppColors.greyDarksTextColor)),
//                             child: const Text(
//                               "CONTINUE",
//                               style: TextStyle(color: AppColors.whiteColor),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   SizedBox oTPtextfield(BuildContext context) {
//     return SizedBox(
//         height: 50,
//         width: 58,
//         child: TextField(
//           onChanged: (value) {
//             if (value.length == 1) {
//               FocusScope.of(context).nextFocus();
//             }
//           },
//           cursorColor: AppColors.redColor,
//           style: Theme.of(context).textTheme.headlineMedium,
//           keyboardType: TextInputType.number,
//           textAlign: TextAlign.center,
//           inputFormatters: [
//             LengthLimitingTextInputFormatter(1),
//             FilteringTextInputFormatter.digitsOnly,
//           ],
//           decoration: const InputDecoration(
//             focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: AppColors.blueColor),
//                 borderRadius: BorderRadius.all(Radius.circular(8.0))),
//             enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: AppColors.whiteColor),
//                 borderRadius: BorderRadius.all(Radius.circular(8.0))),
//             contentPadding: EdgeInsets.symmetric(vertical: 8),
//             filled: true,
//             fillColor: AppColors.whiteColor,
//             border: OutlineInputBorder(),
//           ),
//         ));
//   }
// }
// ################################################
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:kmcapp/res/assets/images_assets.dart';
import 'package:kmcapp/res/color/appcolors.dart';
import 'package:kmcapp/res/routes/routesname.dart';

class EnterOTPForResetPasswordView extends StatefulWidget {
  final String verificationId;
  const EnterOTPForResetPasswordView({super.key, required this.verificationId});

  @override
  State<EnterOTPForResetPasswordView> createState() =>
      _EnterOTPForResetPasswordViewState();
}

class _EnterOTPForResetPasswordViewState
    extends State<EnterOTPForResetPasswordView> {
  final List<TextEditingController> _otpControllers =
      List.generate(6, (index) => TextEditingController());
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage(ImageAssets.loginPageTopLogoImage),
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
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            AppColors.greyColor,
                            AppColors.whiteColor,
                          ],
                        ),
                        border: Border.all(color: AppColors.greyColor),
                        borderRadius: BorderRadius.circular(10.0)),
                    height: 260,
                    child: Column(
                      children: [
                        const SizedBox(height: 5),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 15.0),
                            Text(
                              "OTP",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                                color: AppColors
                                    .greenColor, // Update with your color
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "Please type the verification code sent to your mobile number.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.greyColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(6, (index) {
                              return oTPtextfield(
                                  context, _otpControllers[index]);
                            }),
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextButton(
                          onPressed: _resendOTP,
                          child: const Text(
                            "RESEND CODE",
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: AppColors
                                  .greenColor, // Update with your color
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: ElevatedButton(
                            onPressed: _verifyOTP,
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(AppColors
                                        .greyDarksTextColor)), // Update with your color
                            child: const Text(
                              "CONTINUE",
                              style: TextStyle(
                                  color:
                                      Colors.white), // Update with your color
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

  SizedBox oTPtextfield(
      BuildContext context, TextEditingController controller) {
    return SizedBox(
        height: 50,
        width: 58,
        child: TextField(
          controller: controller,
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
          cursorColor: AppColors.redColor,
          style: Theme.of(context).textTheme.headlineMedium,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly,
          ],
          decoration: const InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.blueColor),
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.whiteColor),
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            contentPadding: EdgeInsets.symmetric(vertical: 8),
            filled: true,
            fillColor: AppColors.whiteColor,
            border: OutlineInputBorder(),
          ),
        ));
  }

  Future<void> _verifyOTP() async {
    final otp = _otpControllers.map((controller) => controller.text).join();
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: otp,
      );
      await _auth.signInWithCredential(credential);
      Fluttertoast.showToast(
        msg: "Login Successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: AppColors.greenColor,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      Get.toNamed(RouteName.homeView);
    } catch (e) {
      Fluttertoast.showToast(
        msg: "entered wrong OTP",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: AppColors.redColor,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  void _resendOTP() async {
    // Implement OTP resend logic here
  }
}
