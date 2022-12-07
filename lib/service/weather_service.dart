import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:prototype/location/location.dart';
import 'package:prototype/models/current_weather.dart';
import 'package:prototype/models/weather.dart';
import 'package:prototype/utils/weatherUtils.dart';
import 'package:prototype/models/hourly_weather.dart';

Position position = Position();

class ApiProvider {
  final pos = position.getUserLocation();
  Future<CurrentWeather> getCurrentWeather() async {
    try {
      await pos;
      var client = http.Client();
      var uri =
          Uri.parse(prepareWeatherUrl(position.longitude!, position.latitude!));
      var response =
          await client.get(uri, headers: {'Content-Type': 'application/json'});

      var json = response.body;
      return weatherFromJson(json);
    } catch (e) {
      print("Exception occured: $e");
    }
    throw Exception("Failed to load load 1");
  }

  Future<HourlyWeather> getHourlyWeather() async {
    // await Future.delayed(const Duration(seconds: 2));
    try {
      await pos;
      var client = http.Client();
      var uri = Uri.parse(
          prepareHourlyWeather(position.longitude!, position.latitude!));
      var response =
          await client.get(uri, headers: {'Content-Type': 'application/json'});

      var json = response.body;
      return hourlyWeatherFromJson(json);
    } catch (e) {
      print("Exception occured: $e");
    }
    throw Exception("Failed to load load  2");
  }

  Future<List<dynamic>> fetchData() async {
    try {
      await pos;
      var uri1 =
          Uri.parse(prepareWeatherUrl(position.longitude!, position.latitude!));
      var uri2 = Uri.parse(
          prepareHourlyWeather(position.longitude!, position.latitude!));
      var responses = await Future.wait([
        http.get(uri1, headers: {'Content-Type': 'application/json'}),
        http.get(uri2, headers: {'Content-Type': 'application/json'}),
      ]);
      return <dynamic>[
        ..._getCurrentWeatherResponse(responses[0]),
        ..._getHourlyWeatherResponse(responses[1]),
      ];
    } catch (e) {
      throw 'Error';
    }
  }

  List<CurrentWeather> _getCurrentWeatherResponse(http.Response response) {
    return [
      if (response.statusCode == 200)
        for (var i in json.decode(response.body))
          CurrentWeather.fromJson(json.decode(i)),
    ];
  }

  List<HourlyWeather> _getHourlyWeatherResponse(http.Response response) {
    return [
      if (response.statusCode == 200)
        for (var i in json.decode(response.body))
          HourlyWeather.fromJson(json.decode(i)),
    ];
  }
}
