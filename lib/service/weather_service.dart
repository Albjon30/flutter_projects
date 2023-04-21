import 'dart:convert';
import 'dart:developer' as devtools show log;
import 'package:http/http.dart' as http;
import 'package:prototype/location/location.dart';

Position position = Position();

extension Log on Object {
  void log() => devtools.log(toString());
}

class ApiProvider {
  // final pos = position.getUserLocation();
  final String _baseUrl = "https://api.openweathermap.org/data/2.5/";

  Future<dynamic> get(String category) async {
    var responseJson;

    try {
      var client = http.Client();
      var url_assembler = '$_baseUrl$category';
      var uri = Uri.parse(url_assembler);
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
        print(responseJson);
        return responseJson;
    }
  }
}