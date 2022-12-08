import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prototype/bloc/app_bloc.dart';
import 'package:prototype/bloc/app_events.dart';
import 'package:prototype/bloc/bottom_bloc.dart';
import 'package:prototype/bloc/top_bloc.dart';
import 'dart:developer' as devtools show log;

import 'package:prototype/ui/views/bottom_bloc_view.dart';
import 'package:prototype/ui/views/top_bloc_views.dart';

extension Log on Object {
  void log() => devtools.log(toString());
}

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}


class _FirstPageState extends State<FirstPage> {
  final AppBloc _appBloc = AppBloc();

  @override
  void initState() {
    _appBloc.add(const LoadCurrentWeatherEvent(),);
    _appBloc.add(const LoadHourlyWeatherEvent(),);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark,
          child: MultiBlocProvider(
            providers: [
              BlocProvider<TopBloc>(
                create: (_) => TopBloc(
                  waitBeforeLoading:const Duration(seconds: 2),
                ),
              ),
              BlocProvider<BottomBloc>(
                create: (_) => BottomBloc(
                  waitBeforeLoading:const Duration(seconds: 2),
                ),
              ),
            ],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: const [
                  TopBlocView<TopBloc>(),
                  BottomBlocView<BottomBloc>(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    // BlocProvider(
    //   create: (_) => _appBloc,
    //   child: Scaffold(
    //     body: Column(
    //       children: [
    //         BlocListener<AppBloc, AppState>(
    //           listener: (context, appState) {

    //             if (appState is AppError) {
    //               showGenericDialog(
    //                 context: context,
    //                 title: 'Error',
    //                 content: "Noo data",
    //                 optionBuilder: () => {
    //                   "Ok": true,
    //                 },
    //               );
    //             }
    //           },
    //           child: BlocBuilder<AppBloc, AppState>(
    //             builder: ((context, state) {
    //                if (state is AppLoading) {
    //               // LoadingScreen.instance().show(
    //               //   context: context,
    //               //   text: 'Please Wait...',
    //               // );
    //               CircularProgressIndicator();
    //             } else {
    //               Container();
    //             }
    //               if (state is AppLoaded) {
    //                 // return _buildCard(context, state.hourlyModel);
    //                return TopCard(context, state.currentWeather);
    //                  BottomCard(context, state.hourlyWeather);
    //               }
    //               return Container();
    //             }),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
