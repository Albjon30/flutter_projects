import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prototype/api/api_repository.dart';
import 'package:prototype/bloc/app_bloc.dart';
import 'package:prototype/bloc/app_state.dart';
import 'package:prototype/bloc/app_events.dart';
import 'package:prototype/bloc/bottom_bloc.dart';
import 'package:prototype/bloc/top_bloc.dart';
import 'dart:developer' as devtools show log;
import 'package:prototype/dialogs/generic_dialog.dart';
import 'package:prototype/dialogs/loading_screen.dart';
import 'package:prototype/models/current_weather.dart';
import 'package:prototype/models/hourly_weather.dart';
import 'package:prototype/ui/views/bottom_bloc_view.dart';
import 'package:prototype/ui/views/top_bloc_views.dart';
import 'package:prototype/ui/views/widgets/top_container.dart';
import 'package:prototype/ui/views/widgets/bottom_view.dart';

extension Log on Object {
  void log() => devtools.log(toString());
}

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

// class _FirstPageState extends State<FirstPage> {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Colors.black,
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             children: [
//               const AnimatedContainerApp(),
//               Container(
//                 padding: const EdgeInsets.fromLTRB(18, 15, 10, 5),
//                 child: Row(
//                   children: const [
//                     Text("4 Day",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                         )),
//                   ],
//                 ),
//               ),
//               const BottomView(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

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
                  waitBeforeLoading: Duration(seconds: 3),
                ),
              ),
              BlocProvider<BottomBloc>(
                create: (_) => BottomBloc(
                  waitBeforeLoading: Duration(seconds: 3),
                ),
              ),
            ],
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
