class WeatherModel {
  final String location;
  final double temperature;
  final String condition;

  WeatherModel(
      {required this.location,
      required this.temperature,
      required this.condition});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      location: json['location']['name'],
      temperature: json['current']['temp_c'],
      condition: json['current']['condition']['text'],
    );
  }
}
