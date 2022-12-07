import 'dart:convert';

import 'package:prototype/models/current_weather.dart';
import 'package:prototype/models/hourly_weather.dart';


class WeatherData {
  final CurrentWeather currentWeather;
  final HourlyWeather hourlyWeather;

  WeatherData({
    required this.currentWeather,
    required this.hourlyWeather,
  });
}
