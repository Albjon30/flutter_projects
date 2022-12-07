import 'package:prototype/service/weather_service.dart';
import 'package:prototype/models/current_weather.dart';
import 'package:prototype/models/hourly_weather.dart';

abstract class ApiProtocol {
  const ApiProtocol();
}

class ApiRepository implements ApiProtocol {
  final _provider = ApiProvider();

   Future<CurrentWeather> fetchCurrentList() {
    return _provider.getCurrentWeather();
  } 
  
  Future<HourlyWeather> fetchHourlyList() {
    return _provider.getHourlyWeather();
  }

// Future<List> fetchList() {
//     return _provider.fetchData();
//   }
}
