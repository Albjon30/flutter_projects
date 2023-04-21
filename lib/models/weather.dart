import 'package:prototype/models/current_weather.dart';
import 'package:prototype/models/hourly_weather.dart';

class WeatherData {
  final CurrentWeather currentWeather;
  final HourlyWeather hourlyWeather;

  WeatherData({
    required this.currentWeather,
    required this.hourlyWeather,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      currentWeather:  CurrentWeather.fromJson(json),
      hourlyWeather:  HourlyWeather.fromJson(json),
    );
  }
}
