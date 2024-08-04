import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class WeatherService {
  Future<Map<String, dynamic>> getWeather() async {
    var url = Uri.https("api.weatherapi.com", "/v1/current.json",
        {'key': '0066aba3b2e7445bb79105922241301', 'q': 'karachi'});
    var response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
