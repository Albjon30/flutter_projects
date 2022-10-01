import 'package:prototype/data/location/location.dart';
import 'package:http/http.dart' as http;
import 'package:prototype/models/hourly_weather.dart';
import 'package:prototype/utils/weatherUtils.dart';

Future<HourlyWeather> getHourlyWeather() async {
  Position position = Position();
  await position.getUserLocation();
  var client = http.Client();

  var uri = Uri.parse(prepareHourlyWeather(position.longitude!, position.latitude!));
  var response =
  await client.get(uri, headers: {'Content-Type': 'application/json'});

  if (response.statusCode == 200) {
    var json = response.body;
    return hourlyWeatherFromJson(json);
  }

  var json = response.body;
  return hourlyWeatherFromJson(json);
}