import 'package:flutter/cupertino.dart';
import 'package:prototype/service/weather_service.dart';
import 'package:prototype/models/current_weather.dart';
import 'package:prototype/models/hourly_weather.dart';

@immutable
abstract class ApiProtocol {
  const ApiProtocol();
}

@immutable
class ApiRepository implements ApiProtocol {
  // https://api.openweathermap.org/data/2.5/weather?lat=98.73&lon=19.64&appid=911ffaf80a9fa826a472acd5ceddbadc';

  // void waitApi() async {
  //   var value = await Future.wait([fetchCurrentList(), fetchHourlyList(),]);
  // }

  final _provider = ApiProvider();

  Future<CurrentWeather> fetchCurrentList() async {
    const String weatherUrl = 'weather';
    final response = await _provider.get(weatherUrl);
    return CurrentWeather.fromJson(response);
  }

  Future<HourlyWeather> fetchHourlyList() async {
    await Future<void>.delayed(const Duration(seconds: 2));
    const String forecastUrl = 'forecast';
    final response = await _provider.get(forecastUrl);
    return HourlyWeather.fromJson(response);
  }
}
