import 'package:flutter/material.dart';
import 'package:kmcapp/res/assets/images_assets.dart';
import 'package:kmcapp/res/color/appcolors.dart';
import 'package:kmcapp/view_model/services/splashScreenServices.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  SplashServices splashservices = SplashServices();

  @override
  void initState() {
    super.initState();
    splashservices.islogin();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: AppColors.whiteColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: const Image(
                    image: AssetImage(ImageAssets.splashScreenLogoImage)),
              ),
              Container(
                child: const Image(
                    image: AssetImage(ImageAssets.splashScreenBottomImage)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
