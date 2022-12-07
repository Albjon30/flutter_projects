import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prototype/bloc/app_bloc.dart';
import 'package:prototype/bloc/app_events.dart';
import 'package:prototype/bloc/app_state.dart';
import 'package:prototype/extensions/stream/start_with.dart';
import 'package:prototype/ui/views/widgets/top_container.dart';

class TopBlocView<T extends AppBloc> extends StatelessWidget {
  const TopBlocView({Key? key}) : super(key: key);

  void startUpdatingBloc(BuildContext context) {
    Stream.periodic(
      const Duration(seconds: 1),
      (_) => const LoadCurrentWeatherEvent(),
    ).startWith(const LoadCurrentWeatherEvent()).forEach((event) {
      context.read<T>().add(
            event,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    startUpdatingBloc(context);
    return Expanded(
      child: BlocBuilder<T, AppState>(
        builder: ((context, appState) {
          if (appState is AppError) {
            return Text('An Error Occurred. Try Again');
          } else if (appState is AppCurrentWeatherLoaded) {
            return topCard(context, appState.currentWeather);
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
