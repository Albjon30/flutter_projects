import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:prototype/bloc/app_state.dart';
import 'package:prototype/bloc/app_events.dart';
import 'package:prototype/api/api_repository.dart';

import 'package:prototype/location/location.dart';

enum LoginErrors { invalidHandle }

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
          // final currentData = await apiRepository.fetchList();
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
