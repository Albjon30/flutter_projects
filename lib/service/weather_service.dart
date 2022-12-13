import 'dart:convert';
import 'dart:developer' as devtools show log;
import 'package:http/http.dart' as http;
import 'package:prototype/api/location_repository.dart';

extension Log on Object {
  void log() => devtools.log(toString());
}

class ApiProvider {
  final LocationRepository locationRepository = LocationRepository();
  Future<dynamic> get(String category) async {
    var responseJson;
    try {
      final currentPos = await locationRepository.fetchPositionList();
      const String baseUrl = "https://api.openweathermap.org/data/2.5/";
      final String endUrl =
          '?lat=${currentPos.latitude}&lon=19.6&appid=911ffaf80a9fa826a472acd5ceddbadc&units=metric';
      var client = http.Client();
      var url = '$baseUrl$category$endUrl';
      var uri = Uri.parse(url);
      final response = await client.get(uri);
      responseJson = _response(response);
    } catch (e) {
      throw e;
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        // print(responseJson);
        return responseJson;
    }
  }
}
