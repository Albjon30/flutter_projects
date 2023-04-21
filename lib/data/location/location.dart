import 'package:location/location.dart';

class PositionRepository {
  /// {@macro location_repository}
   String? latitude;
  String? longitude;

  Future<void> getUserLocation() async {
    late bool serviceEnabled;
    late PermissionStatus permissionGranted;
    Location location = Location();

    // Check if location service is enable
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return ;
      }
    }

    // Check if permission is granted
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return ;
      }
    }

    final locationData = await location.getLocation();
     latitude = locationData.latitude?.toStringAsFixed(1);
     longitude = locationData.longitude?.toStringAsFixed(1);
  }
}
