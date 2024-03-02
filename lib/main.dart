import 'package:flutter/material.dart';
import 'package:kmcapp/res/routes/routes.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  runApp(const KMCAPP());
}

class KMCAPP extends StatelessWidget {
  const KMCAPP({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor:
          Colors.red, // Change this color to your desired status bar color
    ));

    return GetMaterialApp(
      getPages: AppRoutes.appRoutes(),
      debugShowCheckedModeBanner: false,
    );
  }
}
