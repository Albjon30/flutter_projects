import 'package:flutter/foundation.dart';

// define a bloc in one
@immutable
abstract class AppEvent {
  const AppEvent();
}

@immutable
class LoadCurrentWeatherEvent implements AppEvent {
  const LoadCurrentWeatherEvent();
}


@immutable
class LoadHourlyWeatherEvent implements AppEvent {
  const LoadHourlyWeatherEvent();
}
