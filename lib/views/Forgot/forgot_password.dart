import 'package:flutter/material.dart';
import 'package:kmcapp/res/assets/images_assets.dart';
import 'package:kmcapp/res/color/appcolors.dart';

class ForgotView extends StatelessWidget {
  const ForgotView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
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
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.greyColor,
                      border: Border.all(color: AppColors.greyColor),
                      borderRadius: BorderRadius.circular(20.0)),
                  height: 260,
                  child: const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              "FORGOT PASSWORD?",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w900,
                                color: AppColors.greenColor,
                              ),
                            ),
                          ],
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
    );
  }
}
