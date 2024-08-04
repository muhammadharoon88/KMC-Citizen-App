import 'package:flutter/material.dart';
import 'package:kmcapp/res/assets/images_assets.dart';
import 'package:kmcapp/res/color/appcolors.dart';
import 'package:kmcapp/modules/authentication/services/splash_view_service.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashServices splashservices = SplashServices();

  @override
  void initState() {
    super.initState();
    // Schedule the navigation check after the first frame is rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      splashservices.isLogin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: AppColors.whiteColor,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image(image: AssetImage(ImageAssets.splashScreenLogoImage)),
              Image(image: AssetImage(ImageAssets.splashScreenBottomImage)),
            ],
          ),
        ),
      ),
    );
  }
}
