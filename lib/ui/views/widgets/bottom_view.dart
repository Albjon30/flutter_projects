import 'package:flutter/material.dart';
import 'package:prototype/models/hourly_weather.dart';
import 'package:prototype/utils/icon_selection.dart';

Widget bottomCard(BuildContext context, HourlyWeather hourlyWeather) {
  return Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 5,
    ),
    width: MediaQuery.of(context).size.width * 1.0,
    height: MediaQuery.of(context).size.height * 0.18,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 40,
      itemBuilder: (context, index) {
        var hW = hourlyWeather.list[index];
        return Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: Colors.white10)),
          child: Column(
            children: [
              Text(
                '${hW.main.temp.toStringAsFixed(1)}\u00b0',
                style: const TextStyle(color: Colors.white),
              ),
              SizedBox(
                width: 50,
                height: 50,
                child: Image.asset(
                  getWeatherIcon(hW.weather[0].icon),
                  scale: 20,
                ),
              ),
              Text(
                '${hW.dtTxt.hour}:00',
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        );
      },
    ),
  );
}
