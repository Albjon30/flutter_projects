import 'package:flutter/foundation.dart';
import 'package:prototype/location/location.dart';
import 'package:prototype/models/location_model.dart';

@immutable
abstract class LocationApiProtocol {
  const LocationApiProtocol();
}

@immutable
class LocationRepository implements LocationApiProtocol {
  final PositionRepository position = PositionRepository();

  Future<CurrentUserLocation> fetchPositionList() async {
    await position.getUserLocation();
    return CurrentUserLocation(
      latitude: position.latitude,
      longitude: position.longitude,
    );
  }
}
