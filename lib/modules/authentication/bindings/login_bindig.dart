// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:kmcapp/modules/authentication/viewModels/login_view_model.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginViewModel());
  }
}
