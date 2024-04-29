import 'package:get/get.dart';
import 'package:kmcapp/res/routes/routesname.dart';
import 'package:kmcapp/views/Forgot/forgot_password.dart';
import 'package:kmcapp/views/login/loginview.dart';
import 'package:kmcapp/views/register/register_view.dart';
import 'package:kmcapp/views/splashscreen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RouteName.splashScreen,
          page: () => const Splashscreen(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.loginView,
          page: () => const LoginView(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.registerView,
          page: () => const RegisterView(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.forgotView,
          page: () => const ForgotView(),
          transition: Transition.leftToRightWithFade,
        )
      ];
}
