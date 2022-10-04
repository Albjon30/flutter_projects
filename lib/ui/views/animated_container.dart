import 'package:flutter/material.dart';
import 'package:prototype/ui/views/widgets/top_view.dart';
import 'package:prototype/ui/views/widgets/top_view_collapsed.dart';
import 'package:intl/intl.dart';
import 'package:prototype/data/service/currentWeather_service.dart';
import 'package:prototype/models/current_weather.dart';
import 'package:prototype/ui/views/widgets/top_view_header.dart';
import 'package:prototype/utils/icon_selection.dart';

class AnimatedContainerApp extends StatefulWidget {
  const AnimatedContainerApp({super.key});

  @override
  State<AnimatedContainerApp> createState() => _AnimatedContainerAppState();
}

class _AnimatedContainerAppState extends State<AnimatedContainerApp> {
  bool selected = false;
  CurrentWeather? weather;
  var isLoaded = false;
  var date = DateTime.now();


  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    weather = await getWeather();
    if (weather != null) {
      setState(() {
        isLoaded == true;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: AnimatedContainer(
        height: selected
            ? MediaQuery.of(context).size.height * 0.40
            : MediaQuery.of(context).size.height * 0.70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          //color: const Color.fromRGBO(82, 79, 76, 0.32941176470588235),
          gradient: const LinearGradient(
            colors: [
              Color.fromRGBO(15, 105, 245, 1),
              Color.fromRGBO(22, 193, 245, 1),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),

          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(7, 62, 142, 1),
              offset: Offset(0, 3),
              blurRadius: 4.0,
              spreadRadius: 0.8,
            )
          ],
        ),
        curve: Curves.ease,
        duration: const Duration(seconds: 20),
        child: selected
            ? Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        header(weather?.name ?? ''),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      child: topViewCollapsed(
                        getWeatherIcon('${weather?.weather![0].icon}'),
                      ),
                    )
                  ],
                ),
              )
            : Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        header(weather?.name ?? ''),
                      ],
                    ),
                    Container(
                      child: topView(
                        weather?.main!.temp.toStringAsFixed(1) ?? '',
                        weather?.weather![0].description.toString() ?? '',
                        DateFormat('EEEE, d MMM').format(date),
                        weather?.wind!.speed.toStringAsFixed(1) ?? '',
                        weather?.main!.humidity.toString() ?? '',
                        getWeatherIcon('${weather?.weather![0].icon}') ?? '',
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
