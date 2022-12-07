import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:prototype/models/current_weather.dart';
import 'package:prototype/models/hourly_weather.dart';

// @immutable
// abstract class AppState {
//   const AppState();
// }

// @immutable
// class AppStateLoaded extends AppState {
//   final bool isLoading;
//   final Object? error;
//   final HourlyWeather? hourlyWeather;

//   const AppStateLoaded({
//     required this.isLoading,
//     required this.hourlyWeather,
//     required this.error,
//   });

//   const AppStateLoaded.empty()
//       : isLoading = false,
//         hourlyWeather = null,
//         error = null;
// }

@immutable
abstract class AppState {
  const AppState();

  @override
  List<Object?> get props => [];
}

@immutable
class AppInitial extends AppState {}

@immutable
class AppLoading extends AppState {
  final bool isLoading;
  const AppLoading({required this.isLoading});
}

@immutable
class AppCurrentWeatherLoaded extends AppState {
  final CurrentWeather currentWeather;
  const AppCurrentWeatherLoaded({
    required this.currentWeather,
  });
}

@immutable
class AppHourlyWeatherLoaded extends AppState {
  final HourlyWeather hourlyWeather;
  const AppHourlyWeatherLoaded({
    required this.hourlyWeather,
  });
}

@immutable
class AppError extends AppState {
  final Object? messageError;
  const AppError({required this.messageError});
}
