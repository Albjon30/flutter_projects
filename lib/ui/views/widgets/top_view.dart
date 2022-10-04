import 'package:flutter/material.dart';

Widget topView(
   String tmp,
   String description,
   String day,
   String wind,
   String humidity,
  String getIcon,

) {
  return Column(
    children: [
      const SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 308,
            height: 170,
            child: Image.asset(
              getIcon,
              scale: 13,
            ),
          )
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(tmp,
              style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center),
          Text(description,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
              textAlign: TextAlign.center),
          Text(day,
              style: const TextStyle(
                fontSize: 15,
                color: Color.fromRGBO(255, 255, 255, 0.42),
              ),
              textAlign: TextAlign.center),
        ],
      ),
      const SizedBox(
        height: 12,
      ),
      const Divider(
        color: Colors.white38,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              const Icon(
                Icons.air_rounded,
                color: Colors.white,
              ),
              Text(
                '$wind km/h',
                style: const TextStyle(
                  fontSize: 15,
                  color: Color.fromRGBO(255, 255, 255, 0.42),
                ),
              ),
              const Text(
                'Wind',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Column(
            children: [
              const Icon(
                Icons.water_drop,
                color: Colors.white,
              ),
              Text(
                '$humidity%',
                style: const TextStyle(
                  fontSize: 15,
                  color: Color.fromRGBO(255, 255, 255, 0.42),
                ),
              ),
              const Text(
                'Humidity',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Column(
            children: [
              const Icon(
                Icons.water_drop_outlined,
                color: Colors.white,
              ),
              Text(
                '$wind %',
                style: const TextStyle(
                  fontSize: 15,
                  color: Color.fromRGBO(255, 255, 255, 0.42),
                ),
              ),
              const Text(
                'Chance of Rain',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

//DateFormat('EEEE, d MMM').format(date)
