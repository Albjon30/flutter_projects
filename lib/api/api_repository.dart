import 'package:prototype/models/weather.dart';
import 'package:prototype/service/weather_service.dart';
import 'package:prototype/models/current_weather.dart';
import 'package:prototype/models/hourly_weather.dart';
import 'package:prototype/location/location.dart';

abstract class ApiProtocol {
  const ApiProtocol();
}

class ApiRepository implements ApiProtocol {
  // https://api.openweathermap.org/data/2.5/weather?lat=41.73&lon=19.64&appid=911ffaf80a9fa826a472acd5ceddbadc';s
  //?lat=41.73&lon=19.64&appid=
  Position position = Position();
  final String _apiKey = '911ffaf80a9fa826a472acd5ceddbadc';
  final _provider = ApiProvider();

  Future<CurrentWeather> fetchCurrentList() async {
    final response = await _provider.get('weather?lat=41.73&lon=19.64&appid=911ffaf80a9fa826a472acd5ceddbadc&units=metric');
    return CurrentWeather.fromJson(response);
  }

  Future<HourlyWeather> fetchHourlyList() async {
    final response = await _provider.get('forecast?lat=41.73&lon=19.64&appid=911ffaf80a9fa826a472acd5ceddbadc&units=metric');
    return HourlyWeather.fromJson(response);
  }
}
