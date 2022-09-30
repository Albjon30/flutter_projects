import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:prototype/models/hourly_weather.dart';
import 'package:prototype/models/current_weather.dart';
import 'package:prototype/utils/weatherUtils.dart';

  Future<CurrentWeather> getWeather() async {
    Location location = Location();

    LocationData locationData;
    locationData = await location.getLocation();
    var long = locationData.longitude!.toStringAsFixed(1);
    var lat = locationData.latitude!.toStringAsFixed(1);

    var client = http.Client();

    var uri = Uri.parse(prepareWeatherUrl(long, lat));
    var response =
        await client.get(uri, headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      var json = response.body;
      return weatherFromJson(json);
    }

    var json = response.body;
    return weatherFromJson(json);
  }

