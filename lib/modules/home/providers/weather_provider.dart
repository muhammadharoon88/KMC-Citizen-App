// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:kmcapp/modules/home/model/weather_model.dart';
import 'package:kmcapp/modules/home/service/weather_service.dart';

class WeatherProvider extends GetxController {
  final WeatherService weatherService;
  var weatherModel =
      WeatherModel(location: '', temperature: 0.0, condition: '').obs;

  WeatherProvider({required this.weatherService});

  Future<void> fetchWeather() async {
    try {
      var data = await weatherService.getWeather();
      weatherModel.value = WeatherModel.fromJson(data);
    } catch (e) {
      print('Error fetching weather: $e');
    }
  }
}
