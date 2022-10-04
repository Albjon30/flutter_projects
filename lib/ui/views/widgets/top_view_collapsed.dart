import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prototype/data/service/currentWeather_service.dart';
import 'package:prototype/models/current_weather.dart';
import 'package:prototype/utils/icon_selection.dart';

Widget topViewCollapsed(
    String icon,
    ){
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SizedBox(
        width: 150,
        height: 120,
        child: Image.asset(
          icon,
          scale: 15,
        ),
      )
    ],
  );
}

//\u00b0
