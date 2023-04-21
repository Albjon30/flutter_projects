import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:prototype/data/location/location.dart';
import 'package:prototype/models/current_weather.dart';
import 'package:prototype/utils/weatherUtils.dart';
import 'package:prototype/models/hourly_weather.dart';

Position position = Position();

Future<CurrentWeather> getWeather() async {
  await position.getUserLocation();
  print('1--');
  var client = http.Client();

  var uri = Uri.parse(prepareWeatherUrl(position.longitude!, position.latitude!));
  var response = await client.get(uri, headers: {'Content-Type': 'application/json'});

  var json = response.body;
  return weatherFromJson(json);
}

Future<HourlyWeather> getHourlyWeather() async {
  await position.getUserLocation();
  print('2--');
  var client = http.Client();
  var uri =
      Uri.parse(prepareHourlyWeather(position.longitude!, position.latitude!));
  var response =
      await client.get(uri, headers: {'Content-Type': 'application/json'});

  var json = response.body;
  return hourlyWeatherFromJson(json);
}


// Future getDoubleData() async {
//   await position.getUserLocation();
//   var results =  await Future.wait([
//     http.get(Uri.parse(prepareWeatherUrl(position.longitude!, position.latitude!)), headers: {'Content-Type': 'application/json'}),
//     // http.get(Uri.parse(prepareHourlyWeather(position.longitude!, position.latitude!))),
//   ]);
//
//   setState((){
//     hourly =  hourlyWeatherFromJson(results[1].body);
//     current = weatherFromJson(results[0].body);
//   });
//
// }