import 'package:flutter/material.dart';
import 'package:kmcapp/res/color/appcolors.dart';
import 'package:kmcapp/res/routes/routes.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const KMCAPP());
}

class KMCAPP extends StatelessWidget {
  const KMCAPP({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColors
          .greenDarkColor, // Change this color to your desired status bar color
    ));

    return GetMaterialApp(
      getPages: AppRoutes.appRoutes(),
      debugShowCheckedModeBanner: false,
    );
  }
}
