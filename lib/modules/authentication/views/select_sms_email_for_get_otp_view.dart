// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// // ignore: depend_on_referenced_packages
// import 'package:get/get.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:kmcapp/res/assets/images_assets.dart';
// import 'package:kmcapp/res/color/appcolors.dart';
// import 'package:kmcapp/res/routes/routesname.dart';
// import 'package:kmcapp/views/Forgot/Forgot_Model/textfield_model.dart';

// class SelectSMSEmailForGetOTP extends StatefulWidget {
//   const SelectSMSEmailForGetOTP({super.key});

//   @override
//   State<SelectSMSEmailForGetOTP> createState() =>
//       _SelectSMSEmailForGetOTPState();
// }

// class _SelectSMSEmailForGetOTPState extends State<SelectSMSEmailForGetOTP> {
//   final contactController = TextEditingController();
//   late RxString selectedValue = "via SMS".obs;

//   @override
//   void initState() {
//     super.initState();
//     selectedValue = "via SMS".obs;
//   }

//   Future<void> _sendPasswordResetEmail() async {
//     try {
//       // Check if the email is registered in Firestore
//       final snapshot = await FirebaseFirestore.instance
//           .collection('UserAccDetails')
//           .where('email', isEqualTo: contactController.text)
//           .get();

//       if (snapshot.docs.isNotEmpty) {
//         await FirebaseAuth.instance
//             .sendPasswordResetEmail(email: contactController.text);
//         debugPrint("Email has been Sent");

//         Fluttertoast.showToast(
//           msg: "Password Reset Email Sent! Please check your Email",
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.BOTTOM,
//           timeInSecForIosWeb: 2,
//           backgroundColor: AppColors.greenColor,
//           textColor: Colors.white,
//           fontSize: 16.0,
//         );

//         // Dismiss the dialog and navigate to login screen
//         Navigator.of(context).pop();
//         Get.toNamed(RouteName.loginView);
//       } else {
//         Fluttertoast.showToast(
//           msg: "Email not registered",
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.BOTTOM,
//           timeInSecForIosWeb: 2,
//           backgroundColor: Colors.red,
//           textColor: Colors.white,
//           fontSize: 16.0,
//         );
//         Navigator.of(context).pop(); // Dismiss the dialog
//       }
//     } catch (e) {
//       debugPrint("ERROR FOR SENDING PASSWORD RESET EMAIL $e");
//       // ignore: use_build_context_synchronously
//       Navigator.of(context).pop(); // Dismiss the dialog in case of error
//     }
//   }

//   Future<void> _sendOTPviaSMS() async {
//     await FirebaseAuth.instance.verifyPhoneNumber(
//       phoneNumber: contactController.text,
//       verificationCompleted: (PhoneAuthCredential credential) async {
//         await FirebaseAuth.instance.signInWithCredential(credential);
//         debugPrint(
//             "Phone number automatically verified and user signed in: $credential");
//       },
//       verificationFailed: (FirebaseAuthException e) {
//         debugPrint("Phone number verification failed: ${e.message}");
//       },
//       codeSent: (String verificationId, int? resendToken) {
//         debugPrint("OTP sent to ${contactController.text}");
//         Navigator.of(context).pop(); // Dismiss the dialog
//         Get.toNamed(RouteName.enterOTPView, arguments: {
//           "verificationId": verificationId,
//         });
//       },
//       codeAutoRetrievalTimeout: (String verificationId) {
//         debugPrint("verificationId: $verificationId");
//       },
//     );
//   }

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
//                           colors: [AppColors.greyColor, AppColors.whiteColor],
//                         ),
//                         border: Border.all(color: AppColors.greyColor),
//                         borderRadius: BorderRadius.circular(10.0)),
//                     height: 380,
//                     child: Column(
//                       children: [
//                         const SizedBox(height: 5),
//                         const Row(
//                           children: [
//                             SizedBox(width: 8.0),
//                             Text(
//                               "WHERE DO YOU WANT THE OTP?",
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w900,
//                                 color: AppColors.greenColor,
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 10),
//                         const Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 8.0),
//                           child: Text(
//                             "If you want the OTP through SMS, then choose SMS, or through email, then choose email and enter field accordingly.",
//                             style: TextStyle(
//                               color: AppColors.greyDarksTextColor,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 5.0),
//                         Obx(() => Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 ListTileTheme(
//                                   contentPadding: const EdgeInsets.all(0),
//                                   child: RadioListTile(
//                                     groupValue: selectedValue.value,
//                                     title: const Text(
//                                       "via SMS",
//                                       style: TextStyle(
//                                         fontFamily: "FontMain",
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     value: "via SMS",
//                                     onChanged: (value) {
//                                       selectedValue.value = value.toString();
//                                     },
//                                     activeColor: AppColors.redColor,
//                                     contentPadding: const EdgeInsets.all(0),
//                                   ),
//                                 ),
//                                 ListTileTheme(
//                                   contentPadding: const EdgeInsets.symmetric(
//                                       horizontal: 0, vertical: 4),
//                                   child: RadioListTile(
//                                     groupValue: selectedValue.value,
//                                     title: const Text(
//                                       "via EMAIL",
//                                       style: TextStyle(
//                                         fontFamily: "FontMain",
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     value: "via EMAIL",
//                                     onChanged: (value) {
//                                       selectedValue.value = value.toString();
//                                     },
//                                     activeColor:
//                                         selectedValue.value == "via EMAIL"
//                                             ? Colors.red
//                                             : Colors.grey,
//                                   ),
//                                 ),
//                               ],
//                             )),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 8.0),
//                               child: Obx(() => Text(
//                                     selectedValue.value == "via SMS"
//                                         ? "Mobile Number"
//                                         : "Email Id",
//                                     textAlign: TextAlign.left,
//                                     style: const TextStyle(
//                                       color: AppColors.greyDarksTextColor,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   )),
//                             ),
//                           ],
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Container(
//                             height: 50,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20)),
//                             child: Expanded(
//                               child: Obx(
//                                 () => CustomTextField(
//                                   controller: contactController,
//                                   prefixIcon: selectedValue.value == "via SMS"
//                                       ? Icons.mobile_screen_share_rounded
//                                       : Icons.email,
//                                   isSMS: selectedValue.value == "via SMS",
//                                   cursorColor: Colors.red,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 5.0),
//                         SizedBox(
//                           height: 50,
//                           width: MediaQuery.of(context).size.width * 0.8,
//                           child: ElevatedButton(
//                             onPressed: () async {
//                               showDialog(
//                                 context: context,
//                                 barrierDismissible: false,
//                                 builder: (BuildContext context) {
//                                   return const AlertDialog(
//                                     content: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       mainAxisSize: MainAxisSize.min,
//                                       children: [
//                                         Text("Please Hold"),
//                                         SizedBox(height: 20),
//                                         SpinKitCircle(
//                                           color: AppColors.greenDarkColor,
//                                           size: 50,
//                                         ),
//                                       ],
//                                     ),
//                                   );
//                                 },
//                               );
//                               await Future.delayed(const Duration(seconds: 2));

//                               if (selectedValue.value == "via EMAIL") {
//                                 await _sendPasswordResetEmail();
//                               } else {
//                                 await _sendOTPviaSMS();
//                                 Fluttertoast.showToast(
//                                   msg: "OTP Generated! Please check your SMS",
//                                   toastLength: Toast.LENGTH_SHORT,
//                                   gravity: ToastGravity.BOTTOM,
//                                   timeInSecForIosWeb: 2,
//                                   backgroundColor: AppColors.greenColor,
//                                   textColor: Colors.white,
//                                   fontSize: 16.0,
//                                 );
//                                 // ignore: use_build_context_synchronously
//                                 Navigator.of(context)
//                                     .pop(); // Dismiss the dialog
//                               }
//                             },
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: AppColors.greyDarksTextColor,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(50),
//                               ),
//                             ),
//                             child: const Text(
//                               "NEXT",
//                               style: TextStyle(
//                                 color: AppColors.whiteColor,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16,
//                                 letterSpacing: 0.5,
//                               ),
//                             ),
//                           ),
//                         ),
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
// }

// ################################################################

// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// // ignore: depend_on_referenced_packages
// import 'package:get/get.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:kmcapp/res/assets/images_assets.dart';
// import 'package:kmcapp/res/color/appcolors.dart';
// import 'package:kmcapp/res/routes/routesname.dart';
// import 'package:kmcapp/views/Forgot/Forgot_Model/textfield_model.dart';

// class SelectSMSEmailForGetOTP extends StatefulWidget {
//   const SelectSMSEmailForGetOTP({super.key});

//   @override
//   State<SelectSMSEmailForGetOTP> createState() =>
//       _SelectSMSEmailForGetOTPState();
// }

// class _SelectSMSEmailForGetOTPState extends State<SelectSMSEmailForGetOTP> {
//   final contactController = TextEditingController();
//   late RxString selectedValue = "via SMS".obs;

//   @override
//   void initState() {
//     super.initState();
//     selectedValue = "via SMS".obs;
//   }

//   Future<void> _sendPasswordResetEmail() async {
//     try {
//       // Check if the email is registered in Firestore
//       final snapshot = await FirebaseFirestore.instance
//           .collection('UserAccDetails')
//           .where('email', isEqualTo: contactController.text)
//           .get();

//       if (snapshot.docs.isNotEmpty) {
//         await FirebaseAuth.instance
//             .sendPasswordResetEmail(email: contactController.text);
//         debugPrint("Email has been Sent");

//         Fluttertoast.showToast(
//           msg: "Password Reset Email Sent! Please check your Email",
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.BOTTOM,
//           timeInSecForIosWeb: 2,
//           backgroundColor: AppColors.greenColor,
//           textColor: Colors.white,
//           fontSize: 16.0,
//         );

//         // Dismiss the dialog and navigate to login screen
//         Navigator.of(context).pop();
//         Get.toNamed(RouteName.loginView);
//       } else {
//         Fluttertoast.showToast(
//           msg: "Email not registered",
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.BOTTOM,
//           timeInSecForIosWeb: 2,
//           backgroundColor: Colors.red,
//           textColor: Colors.white,
//           fontSize: 16.0,
//         );
//         Navigator.of(context).pop(); // Dismiss the dialog
//       }
//     } catch (e) {
//       debugPrint("ERROR FOR SENDING PASSWORD RESET EMAIL $e");
//       // ignore: use_build_context_synchronously
//       Navigator.of(context).pop(); // Dismiss the dialog in case of error
//     }
//   }

//   Future<void> _sendOTPviaSMS() async {
//     await FirebaseAuth.instance.verifyPhoneNumber(
//       phoneNumber: contactController.text,
//       verificationCompleted: (PhoneAuthCredential credential) async {
//         await FirebaseAuth.instance.signInWithCredential(credential);
//         debugPrint(
//             "Phone number automatically verified and user signed in: $credential");
//       },
//       verificationFailed: (FirebaseAuthException e) {
//         debugPrint("Phone number verification failed: ${e.message}");
//       },
//       codeSent: (String verificationId, int? resendToken) {
//         debugPrint("OTP sent to ${contactController.text}");
//         Navigator.of(context).pop(); // Dismiss the dialog
//         Get.toNamed(RouteName.enterOTPView, arguments: {
//           "verificationId": verificationId,
//         });
//       },
//       codeAutoRetrievalTimeout: (String verificationId) {
//         debugPrint("verificationId: $verificationId");
//       },
//     );
//   }

//   bool _isValidEmail(String email) {
//     final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
//     return emailRegex.hasMatch(email);
//   }

//   bool _isValidPhoneNumber(String phoneNumber) {
//     final phoneRegex = RegExp(r'^\+?[0-9]{10,}$');
//     return phoneRegex.hasMatch(phoneNumber);
//   }

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
//                           colors: [AppColors.greyColor, AppColors.whiteColor],
//                         ),
//                         border: Border.all(color: AppColors.greyColor),
//                         borderRadius: BorderRadius.circular(10.0)),
//                     height: 380,
//                     child: Column(
//                       children: [
//                         const SizedBox(height: 5),
//                         const Row(
//                           children: [
//                             SizedBox(width: 8.0),
//                             Text(
//                               "WHERE DO YOU WANT THE OTP?",
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w900,
//                                 color: AppColors.greenColor,
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 10),
//                         const Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 8.0),
//                           child: Text(
//                             "If you want the OTP through SMS, then choose SMS, or want Password reset email, then choose email and enter field accordingly.",
//                             style: TextStyle(
//                               color: AppColors.greyDarksTextColor,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 5.0),
//                         Obx(() => Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 ListTileTheme(
//                                   contentPadding: const EdgeInsets.all(0),
//                                   child: RadioListTile(
//                                     groupValue: selectedValue.value,
//                                     title: const Text(
//                                       "via SMS",
//                                       style: TextStyle(
//                                         fontFamily: "FontMain",
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     value: "via SMS",
//                                     onChanged: (value) {
//                                       selectedValue.value = value.toString();
//                                     },
//                                     activeColor: AppColors.redColor,
//                                     contentPadding: const EdgeInsets.all(0),
//                                   ),
//                                 ),
//                                 ListTileTheme(
//                                   contentPadding: const EdgeInsets.symmetric(
//                                       horizontal: 0, vertical: 4),
//                                   child: RadioListTile(
//                                     groupValue: selectedValue.value,
//                                     title: const Text(
//                                       "via EMAIL",
//                                       style: TextStyle(
//                                         fontFamily: "FontMain",
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     value: "via EMAIL",
//                                     onChanged: (value) {
//                                       selectedValue.value = value.toString();
//                                     },
//                                     activeColor:
//                                         selectedValue.value == "via EMAIL"
//                                             ? Colors.red
//                                             : Colors.grey,
//                                   ),
//                                 ),
//                               ],
//                             )),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 8.0),
//                               child: Obx(() => Text(
//                                     selectedValue.value == "via SMS"
//                                         ? "Mobile Number"
//                                         : "Email Id",
//                                     textAlign: TextAlign.left,
//                                     style: const TextStyle(
//                                       color: AppColors.greyDarksTextColor,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   )),
//                             ),
//                           ],
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Container(
//                             height: 60,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20)),
//                             child: Expanded(
//                               child: Obx(
//                                 () => CustomTextField(
//                                   controller: contactController,
//                                   prefixIcon: selectedValue.value == "via SMS"
//                                       ? Icons.mobile_screen_share_rounded
//                                       : Icons.email,
//                                   isSMS: selectedValue.value == "via SMS",
//                                   cursorColor: Colors.red,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 5.0),
//                         SizedBox(
//                           height: 50,
//                           width: MediaQuery.of(context).size.width * 0.8,
//                           child: ElevatedButton(
//                             onPressed: () async {
//                               if (selectedValue.value == "via EMAIL" &&
//                                   !_isValidEmail(contactController.text)) {
//                                 Fluttertoast.showToast(
//                                   msg: "Please enter a valid email address",
//                                   toastLength: Toast.LENGTH_SHORT,
//                                   gravity: ToastGravity.BOTTOM,
//                                   timeInSecForIosWeb: 2,
//                                   backgroundColor: Colors.red,
//                                   textColor: Colors.white,
//                                   fontSize: 16.0,
//                                 );
//                                 return;
//                               } else if (selectedValue.value == "via SMS" &&
//                                   !_isValidPhoneNumber(
//                                       contactController.text)) {
//                                 Fluttertoast.showToast(
//                                   msg: "Please enter a valid phone number",
//                                   toastLength: Toast.LENGTH_SHORT,
//                                   gravity: ToastGravity.BOTTOM,
//                                   timeInSecForIosWeb: 2,
//                                   backgroundColor: Colors.red,
//                                   textColor: Colors.white,
//                                   fontSize: 16.0,
//                                 );
//                                 return;
//                               }

//                               showDialog(
//                                 context: context,
//                                 barrierDismissible: false,
//                                 builder: (BuildContext context) {
//                                   return const AlertDialog(
//                                     content: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       mainAxisSize: MainAxisSize.min,
//                                       children: [
//                                         Text("Please Hold"),
//                                         SizedBox(height: 20),
//                                         SpinKitCircle(
//                                           color: AppColors.greenDarkColor,
//                                           size: 50,
//                                         ),
//                                       ],
//                                     ),
//                                   );
//                                 },
//                               );
//                               await Future.delayed(const Duration(seconds: 2));

//                               if (selectedValue.value == "via EMAIL") {
//                                 await _sendPasswordResetEmail();
//                               } else {
//                                 await _sendOTPviaSMS();
//                                 Fluttertoast.showToast(
//                                   msg: "OTP Generated! Please check your SMS",
//                                   toastLength: Toast.LENGTH_SHORT,
//                                   gravity: ToastGravity.BOTTOM,
//                                   timeInSecForIosWeb: 2,
//                                   backgroundColor: AppColors.greenColor,
//                                   textColor: Colors.white,
//                                   fontSize: 16.0,
//                                 );
//                                 // ignore: use_build_context_synchronously
//                                 Navigator.of(context)
//                                     .pop(); // Dismiss the dialog
//                               }
//                             },
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: AppColors.greyDarksTextColor,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(50),
//                               ),
//                             ),
//                             child: const Text(
//                               "NEXT",
//                               style: TextStyle(
//                                 color: AppColors.whiteColor,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16,
//                                 letterSpacing: 0.5,
//                               ),
//                             ),
//                           ),
//                         ),
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
// }

// ###################################################################
// ###################################################################

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kmcapp/res/assets/images_assets.dart';
import 'package:kmcapp/res/color/appcolors.dart';
import 'package:kmcapp/res/routes/routesname.dart';
import 'package:kmcapp/views/Forgot/Forgot_Model/textfield_model.dart';

class SelectSMSEmailForGetOTP extends StatefulWidget {
  const SelectSMSEmailForGetOTP({super.key});

  @override
  State<SelectSMSEmailForGetOTP> createState() =>
      _SelectSMSEmailForGetOTPState();
}

class _SelectSMSEmailForGetOTPState extends State<SelectSMSEmailForGetOTP> {
  final contactController = TextEditingController();
  late RxString selectedValue = "via SMS".obs;

  @override
  void initState() {
    super.initState();
    selectedValue = "via SMS".obs;
  }

  Future<void> _sendPasswordResetEmail() async {
    try {
      // Check if the email is registered in Firestore
      final snapshot = await FirebaseFirestore.instance
          .collection('UserAccDetails')
          .where('email', isEqualTo: contactController.text)
          .get();

      if (snapshot.docs.isNotEmpty) {
        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: contactController.text);
        debugPrint("Email has been Sent");

        Fluttertoast.showToast(
          msg: "Password Reset Email Sent! Please check your Email",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: AppColors.greenColor,
          textColor: Colors.white,
          fontSize: 16.0,
        );

        // Dismiss the dialog and navigate to login screen
        // ignore: use_build_context_synchronously
        Navigator.of(context).pop();
        Get.toNamed(RouteName.loginView);
      } else {
        Fluttertoast.showToast(
          msg: "Email not registered",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        // ignore: use_build_context_synchronously
        Navigator.of(context).pop(); // Dismiss the dialog
      }
    } catch (e) {
      debugPrint("ERROR FOR SENDING PASSWORD RESET EMAIL $e");
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop(); // Dismiss the dialog in case of error
    }
  }

  Future<void> _sendOTPviaSMS() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: contactController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential);
        debugPrint(
            "Phone number automatically verified and user signed in: $credential");
      },
      verificationFailed: (FirebaseAuthException e) {
        debugPrint("Phone number verification failed: ${e.message}");
        Fluttertoast.showToast(
          msg: "Phone number verification failed: ${e.message}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        Navigator.of(context).pop(); // Dismiss the dialog
      },
      codeSent: (String verificationId, int? resendToken) {
        if (verificationId.isNotEmpty) {
          debugPrint("OTP sent to ${contactController.text}");
          Navigator.of(context).pop(); // Dismiss the dialog
          Get.toNamed(RouteName.enterOTPView, arguments: {
            "verificationId": verificationId,
          });
          bool checkId = verificationId.isEmail;
          debugPrint("Verification ID  $verificationId");
          debugPrint("Verification ID TYPE  $checkId");
        } else {
          debugPrint("Received empty verificationId");
          Fluttertoast.showToast(
            msg: "Failed to generate OTP, please try again",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
          Navigator.of(context).pop(); // Dismiss the dialog
        }
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        debugPrint("Verification timeout: $verificationId");
      },
    );
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(email);
  }

  bool _isValidPhoneNumber(String phoneNumber) {
    final phoneRegex = RegExp(r'^\+?[0-9]{10,}$');
    return phoneRegex.hasMatch(phoneNumber);
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
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [AppColors.greyColor, AppColors.whiteColor],
                        ),
                        border: Border.all(color: AppColors.greyColor),
                        borderRadius: BorderRadius.circular(10.0)),
                    height: 380,
                    child: Column(
                      children: [
                        const SizedBox(height: 5),
                        const Row(
                          children: [
                            SizedBox(width: 8.0),
                            Text(
                              "WHERE DO YOU WANT THE OTP?",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w900,
                                color: AppColors.greenColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "If you want the OTP through SMS, then choose SMS, or through email, then choose email and enter field accordingly.",
                            style: TextStyle(
                              color: AppColors.greyDarksTextColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        Obx(() => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTileTheme(
                                  contentPadding: const EdgeInsets.all(0),
                                  child: RadioListTile(
                                    groupValue: selectedValue.value,
                                    title: const Text(
                                      "via SMS",
                                      style: TextStyle(
                                        fontFamily: "FontMain",
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    value: "via SMS",
                                    onChanged: (value) {
                                      selectedValue.value = value.toString();
                                    },
                                    activeColor: AppColors.redColor,
                                    contentPadding: const EdgeInsets.all(0),
                                  ),
                                ),
                                ListTileTheme(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 4),
                                  child: RadioListTile(
                                    groupValue: selectedValue.value,
                                    title: const Text(
                                      "via EMAIL",
                                      style: TextStyle(
                                        fontFamily: "FontMain",
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    value: "via EMAIL",
                                    onChanged: (value) {
                                      selectedValue.value = value.toString();
                                    },
                                    activeColor:
                                        selectedValue.value == "via EMAIL"
                                            ? Colors.red
                                            : Colors.grey,
                                  ),
                                ),
                              ],
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Obx(() => Text(
                                    selectedValue.value == "via SMS"
                                        ? "Mobile Number"
                                        : "Email Id",
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      color: AppColors.greyDarksTextColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: Expanded(
                              child: Obx(
                                () => CustomTextField(
                                  controller: contactController,
                                  prefixIcon: selectedValue.value == "via SMS"
                                      ? Icons.mobile_screen_share_rounded
                                      : Icons.email,
                                  isSMS: selectedValue.value == "via SMS",
                                  cursorColor: Colors.red,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (selectedValue.value == "via EMAIL" &&
                                  !_isValidEmail(contactController.text)) {
                                Fluttertoast.showToast(
                                  msg: "Please enter a valid email address",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 2,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                );
                                return;
                              } else if (selectedValue.value == "via SMS" &&
                                  !_isValidPhoneNumber(
                                      contactController.text)) {
                                Fluttertoast.showToast(
                                  msg: "Please enter a valid phone number",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 2,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                );
                                return;
                              }

                              showDialog(
                                context: context,
                                barrierDismissible: false,
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
                              await Future.delayed(const Duration(seconds: 2));

                              if (selectedValue.value == "via EMAIL") {
                                await _sendPasswordResetEmail();
                              } else {
                                await _sendOTPviaSMS();
                                Fluttertoast.showToast(
                                  msg: "OTP Generated! Please check your SMS",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 2,
                                  backgroundColor: AppColors.greenColor,
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                );
                                // ignore: use_build_context_synchronously
                                Navigator.of(context)
                                    .pop(); // Dismiss the dialog
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.greyDarksTextColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            child: const Text(
                              "NEXT",
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                letterSpacing: 0.5,
                              ),
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
        ),
      ),
    );
  }
}
