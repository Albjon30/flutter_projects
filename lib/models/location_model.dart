
class CurrentUserLocation {
  final String? latitude;
  final String? longitude;

  const CurrentUserLocation({
    this.latitude,
    this.longitude,
  });

  static const empty = CurrentUserLocation(latitude: '', longitude: '');
}
