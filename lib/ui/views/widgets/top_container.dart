import 'package:flutter/material.dart';
import 'package:prototype/ui/views/widgets/top_view.dart';
import 'package:prototype/ui/views/widgets/top_view_collapsed.dart';
import 'package:intl/intl.dart';
import 'package:prototype/models/current_weather.dart';
import 'package:prototype/ui/views/widgets/top_view_header.dart';
import 'package:prototype/utils/icon_selection.dart';

Widget topCard(BuildContext context, CurrentWeather cWeather) {
  var selected = false;
  var date = DateTime.now();
  var _didFinishAnimating = false;

  return GestureDetector(
    onTap: () {
      selected = !selected;
    },
    child: AnimatedContainer(
      onEnd: () {
        _didFinishAnimating = !_didFinishAnimating;
      },
      height: selected
          ? MediaQuery.of(context).size.height * 0.40
          : MediaQuery.of(context).size.height * 0.70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
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
      child: !selected
          ? _didFinishAnimating
              ? Container(
                  padding: const EdgeInsets.all(11),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          header(cWeather.name ?? ''),
                        ],
                      ),
                    ],
                  ),
                )
              : Container(
                  padding: const EdgeInsets.all(11),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          header(cWeather.name ?? ''),
                        ],
                      ),
                      SizedBox(
                        height: selected
                            ? MediaQuery.of(context).size.height * 0.40
                            : MediaQuery.of(context).size.height * 0.59,
                        child: topView(
                          cWeather.main!.temp.toStringAsFixed(1),
                          cWeather.weather![0].description.toString(),
                          DateFormat('EEEE, d MMM').format(date),
                          cWeather.wind!.speed.toStringAsFixed(1),
                          cWeather.main!.humidity.toString(),
                          getWeatherIcon(cWeather.weather![0].icon),
                        ),
                      ),
                    ],
                  ),
                )
          : Container(
              padding: const EdgeInsets.all(11),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      header(cWeather.name ?? ''),
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          const SizedBox(
                            height: 35,
                          ),
                          topViewCollapsed(cWeather.weather![0].icon),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
    ),
  );
}
