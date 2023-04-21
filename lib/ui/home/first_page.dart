import 'package:flutter/material.dart';
import 'package:prototype/ui/views/animated_container.dart';
import 'package:prototype/ui/views/bottom_view.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final TextEditingController _nameCtrl = TextEditingController();

  @override
  void dispose() {
    _nameCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: const [
              AnimatedContainerApp(),
              BottomView(),
            ],
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
