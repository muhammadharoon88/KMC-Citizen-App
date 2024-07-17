import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kmcapp/res/assets/images_assets.dart';
import 'package:kmcapp/res/color/appcolors.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:kmcapp/res/routes/routesname.dart';
import 'package:kmcapp/views/Forgot/Forgot_Model/textfield_model.dart';

class SelectSMSEmailForGetOTP extends StatefulWidget {
  const SelectSMSEmailForGetOTP({super.key});

  @override
  State<SelectSMSEmailForGetOTP> createState() =>
      _SelectSMSEmailForGetOTPState();
}

class _SelectSMSEmailForGetOTPState extends State<SelectSMSEmailForGetOTP> {
  final emailController = TextEditingController();

  late RxString selectedValue = "viaSMS".obs;

// Send Password Reset Email

  void _sendPasswordResetEmail() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text);
      print("Email has been Sent");
    } catch (e) {
      print("ERROR FOR SENDING PASSSWORD RESET EMAIL $e");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    selectedValue = "via SMS".obs;
    super.initState();
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
                          colors: [
                            AppColors.greyColor,
                            AppColors.whiteColor
                          ], // Add your desired colors here
                        ),
                        border: Border.all(color: AppColors.greyColor),
                        borderRadius: BorderRadius.circular(10.0)),
                    height: 380,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 05,
                        ),
                        const Row(
                          children: [
                            SizedBox(
                              width: 8.0,
                            ),
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
                        const SizedBox(
                          height: 10,
                        ),

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
                        const SizedBox(
                          height: 5.0,
                        ),

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
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: Expanded(
                              child: Obx(
                                () => CustomTextField(
                                  controller: emailController,
                                  prefixIcon: Icons.mobile_screen_share_rounded,
                                  isSMS: selectedValue.value == "via SMS",
                                  cursorColor: Colors
                                      .red, // Change to your preferred color
                                ),
                                // TextFormField(
                                //   controller: emailController,
                                //   cursorColor: AppColors.redColor,
                                //   decoration: InputDecoration(
                                //     hintText: selectedValue.value == "via SMS"
                                //         ? "Please enter your mobile number"
                                //         : "Please enter your email",
                                //     hintStyle: const TextStyle(
                                //       fontFamily: "FontMain",
                                //       color: AppColors.greyColor,
                                //     ),
                                //     focusedBorder: const OutlineInputBorder(
                                //       borderSide: BorderSide(
                                //           color: AppColors.blueColor),
                                //     ),
                                //     enabledBorder: const OutlineInputBorder(
                                //       borderSide: BorderSide(
                                //           color: AppColors.blueColor),
                                //     ),
                                //     prefixIcon: const Icon(
                                //         Icons.mobile_screen_share_rounded),
                                //     filled: true,
                                //     fillColor: AppColors.whiteColor,
                                //   ),
                                // ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 5.0,
                        ),
                        // Elevated button for Next
                        SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: ElevatedButton(
                            onPressed: () async {
                              showDialog(
                                // ignore: use_build_context_synchronously
                                context: context,
                                barrierDismissible:
                                    false, // Dialog cannot be dismissed by tapping outside
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

                              _sendPasswordResetEmail();
                              Navigator.pop(context);

                              Fluttertoast.showToast(
                                  msg: "OTP Generated! Please check your Email",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 2,
                                  backgroundColor: AppColors.greenColor,
                                  textColor: Colors.white,
                                  fontSize: 16.0);

                              Get.toNamed(RouteName.enterOTPView);
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        AppColors.greyDarksTextColor)),
                            child: const Text(
                              "NEXT",
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
      ),
    );
  }
}
