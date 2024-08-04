// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import '../providers/weather_provider.dart';

class HomeViewModel extends GetxController {
  final WeatherProvider weatherProvider;

  HomeViewModel({required this.weatherProvider});

  @override
  void onInit() {
    weatherProvider.fetchWeather();
    super.onInit();
  }
}
