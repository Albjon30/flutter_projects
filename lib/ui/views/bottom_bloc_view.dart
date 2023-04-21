import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prototype/bloc/app_bloc.dart';
import 'package:prototype/bloc/app_events.dart';
import 'package:prototype/bloc/app_state.dart';
import 'package:prototype/extensions/stream/start_with.dart';
import 'package:prototype/ui/views/widgets/bottom_view.dart';

class BottomBlocView<T extends AppBloc> extends StatelessWidget {
  const BottomBlocView({Key? key}) : super(key: key);

  void startUpdatingBloc(BuildContext context) {
    Stream.periodic(
      const Duration(minutes: 10),
      (_) => const LoadHourlyWeatherEvent(),
    ).startWith(const LoadHourlyWeatherEvent()).forEach((event) {
      context.read<T>().add(
            event,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    startUpdatingBloc(context);
    return Container(
      width: MediaQuery.of(context).size.width * 1.0,
      height: MediaQuery.of(context).size.height * 0.18,
      child: BlocBuilder<T, AppState>(
        builder: ((context, appState) {
          if (appState is AppError) {
            return Text('An Error Occurred. Try Again');
          } else if (appState is AppHourlyWeatherLoaded) {
            return bottomCard(context, appState.hourlyWeather);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
    );
  }
}
