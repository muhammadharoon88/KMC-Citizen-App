// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:kmcapp/modules/home/service/weather_service.dart';
import 'package:kmcapp/modules/home/viewModels/home_view_model.dart';
import '../providers/weather_provider.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WeatherService>(() => WeatherService());
    Get.lazyPut<WeatherProvider>(
        () => WeatherProvider(weatherService: Get.find()));
    Get.lazyPut<HomeViewModel>(
        () => HomeViewModel(weatherProvider: Get.find()));
  }
}
