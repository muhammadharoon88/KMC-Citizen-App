import 'package:get/get.dart';
import 'package:kmcapp/res/routes/routesname.dart';
import 'package:kmcapp/views/login/loginview.dart';
import 'package:kmcapp/views/splashscreen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RouteName.splashScreen,
          page: () => Splashscreen(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.loginView,
          page: () => LoginView(),
          transition: Transition.leftToRightWithFade,
        )
      ];
}
