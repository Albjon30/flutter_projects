import 'package:http/http.dart' as http;
import 'package:prototype/data/location/location.dart';
import 'package:prototype/models/current_weather.dart';
import 'package:prototype/utils/weatherUtils.dart';


  Future<CurrentWeather> getWeather() async {
    Position position = Position();
    await position.getUserLocation();
    var client = http.Client();

    var uri = Uri.parse(prepareWeatherUrl(position.longitude!, position.latitude!));
    var response =
        await client.get(uri, headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      var json = response.body;
      return weatherFromJson(json);
    }

    var json = response.body;
    return weatherFromJson(json);
  }




