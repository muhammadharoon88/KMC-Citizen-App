// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:kmcapp/modules/authentication/viewModels/login_view_model.dart';
import 'package:kmcapp/modules/authentication/views/enter_otp_view.dart';
import 'package:kmcapp/modules/authentication/views/enter_username_forgotpassword_view.dart';
import 'package:kmcapp/modules/authentication/views/login_view.dart';
import 'package:kmcapp/modules/authentication/views/register_view.dart';
import 'package:kmcapp/modules/authentication/views/reset_password_view.dart';
import 'package:kmcapp/modules/authentication/views/select_sms_email_for_get_otp_view.dart';
import 'package:kmcapp/modules/connect_with/views/connect_with.dart';
import 'package:kmcapp/modules/connect_with/views/sub_views/facebook_view.dart';
import 'package:kmcapp/modules/connect_with/views/sub_views/instagram_view.dart';
import 'package:kmcapp/modules/connect_with/views/sub_views/twitter_view.dart';
import 'package:kmcapp/modules/connect_with/views/sub_views/write_feedback_departmentwise_view.dart';
import 'package:kmcapp/modules/home/views/faq_view.dart';
import 'package:kmcapp/modules/home/views/home_view.dart';
import 'package:kmcapp/modules/home/views/update_profile_initial_view.dart';
import 'package:kmcapp/modules/kmc/views/kmc_view.dart';
import 'package:kmcapp/modules/kmc/views/sub_views/kmc_about_view.dart';
import 'package:kmcapp/modules/kmc/views/sub_views/kmc_history_view.dart';
import 'package:kmcapp/modules/kmc/views/sub_views/kmc_news_today_view.dart';
import 'package:kmcapp/modules/kmc/views/sub_views/kmc_website_view.dart';

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
          name: RouteName.updateProfileView,
          page: () {
            final userId = Get.arguments as String?;
            return UpdateProfileView(
              userId: userId ?? "",
            );
          },
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
        ),

        // Home Screen Modules k Rutes
        GetPage(
          name: RouteName.kMCView,
          page: () => const KMCView(),
          transition: Transition.leftToRightWithFade,
        ),

        // ===>> SUB MODULES HAN
        //

        GetPage(
          name: RouteName.kMCAboutView,
          page: () => const KMCAboutView(),
          transition: Transition.leftToRightWithFade,
        ),

        GetPage(
          name: RouteName.kMCHistoryView,
          page: () => const KMCHistoryView(),
          transition: Transition.leftToRightWithFade,
        ),

        GetPage(
          name: RouteName.kMCWebsiteView,
          page: () => const KMCWebsiteView(),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.kMCNewsTodayView,
          page: () => const KMCNewsTodayView(),
          transition: Transition.leftToRightWithFade,
        ),

        // Connect With KMC Screen Modules k Rutes
        GetPage(
          name: RouteName.connectWithView,
          page: () => const ConnectWithView(),
          transition: Transition.leftToRightWithFade,
        ),

        // ===>> SUB MODULES HAN
        //Facebook

        GetPage(
          name: RouteName.facebookView,
          page: () => const FacebookView(),
          transition: Transition.leftToRightWithFade,
        ),

        //Instagram

        GetPage(
          name: RouteName.instagramView,
          page: () => const InstagramView(),
          transition: Transition.leftToRightWithFade,
        ),

        //Twitter / X

        GetPage(
          name: RouteName.twitterView,
          page: () => const TwitterView(),
          transition: Transition.leftToRightWithFade,
        ),

        //Write Feedback

        GetPage(
          name: RouteName.writeFeedbackView,
          page: () => const WriteFeedbackDepartmentwiseView(),
          transition: Transition.leftToRightWithFade,
        ),
      ];
}
