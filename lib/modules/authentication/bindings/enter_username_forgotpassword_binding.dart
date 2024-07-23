import 'package:get/get.dart';
import 'package:kmcapp/modules/authentication/viewModels/enter_username_forgotpassword_viewmodel.dart';

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordViewModel>(() => ForgotPasswordViewModel());
  }
}
