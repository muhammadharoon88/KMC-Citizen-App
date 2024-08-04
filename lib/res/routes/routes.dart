// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:kmcapp/modules/authentication/viewModels/login_view_model.dart';
import 'package:kmcapp/modules/authentication/views/enter_otp_view.dart';
import 'package:kmcapp/modules/authentication/views/enter_username_forgotpassword_view.dart';
import 'package:kmcapp/modules/authentication/views/login_view.dart';
import 'package:kmcapp/modules/authentication/views/register_view.dart';
import 'package:kmcapp/modules/authentication/views/reset_password_view.dart';
import 'package:kmcapp/modules/authentication/views/select_sms_email_for_get_otp_view.dart';
import 'package:kmcapp/modules/home/views/faq_view.dart';
import 'package:kmcapp/modules/home/views/home_view.dart';

import 'package:kmcapp/res/routes/routesname.dart';
import 'package:kmcapp/modules/authentication/views/splash_view.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RouteName.splashScreen,
          page: () => const SplashView(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.loginView,
          page: () => LoginView(),
          binding: BindingsBuilder(() {
            Get.lazyPut(() => LoginViewModel());
          }),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.registerView,
          page: () => const RegisterView(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.enterUsernameForgotPasswordView,
          page: () => const EnterUsernameForgotPassword(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.selectSMSEMAILForOTPView,
          page: () => const SelectSMSEmailForGetOTP(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.enterOTPView,
          page: () => EnterOTPForResetPasswordView(
            verificationId: Get.arguments["verificationId"],
          ),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.resetPasswordView,
          page: () => const ResetPasswordView(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.homeView,
          page: () => HomeView(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.profileView,
          page: () => const ResetPasswordView(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.frequentlyAskQuestView,
          page: () => const FAQView(),
          transition: Transition.downToUp,
        ),
        GetPage(
          name: RouteName.feedbackView,
          page: () => const ResetPasswordView(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.logoutView,
          page: () => const ResetPasswordView(),
          transition: Transition.leftToRightWithFade,
        )
      ];
}
