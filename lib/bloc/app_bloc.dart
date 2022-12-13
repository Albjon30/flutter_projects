import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prototype/bloc/app_state.dart';
import 'package:prototype/bloc/app_events.dart';
import 'package:prototype/api/api_repository.dart';
import 'dart:developer' as devtools show log;

enum LoginErrors { invalidHandle }

extension Log on Object {
  void log() => devtools.log(toString());
}

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({Duration? waitBeforeLoading}) : super(AppInitial()) {
    final ApiRepository apiRepository = ApiRepository();
    on<LoadCurrentWeatherEvent>(
      (event, emit) async {
        //start loading
        emit(
          const AppLoading(
            isLoading: true,
          ),
        );
        try {
          final currentData = await apiRepository.fetchCurrentList();
          emit(
            AppCurrentWeatherLoaded(
              currentWeather: currentData,
            ),
          );
        } catch (e) {
          emit(
            AppError(
              messageError: e,
            ),
          );
        }
      },
    );
    on<LoadHourlyWeatherEvent>(
      (event, emit) async {
        //start loading
        emit(
          const AppLoading(
            isLoading: true,
          ),
        );
        try {
          final hourlyData = await apiRepository.fetchHourlyList();
          emit(
            AppHourlyWeatherLoaded(
              hourlyWeather: hourlyData,
            ),
          );
        } catch (e) {
          emit(
            AppError(
              messageError: e,
            ),
          );
        }
      },
    );
  }
}
