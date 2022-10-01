import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prototype/data/service/currentWeather_service.dart';
import 'package:prototype/models/current_weather.dart';
import 'package:prototype/utils/icon_selection.dart';

class TopView extends StatefulWidget {
  const TopView({Key? key}) : super(key: key);

  @override
  State<TopView> createState() => _TopViewState();
}

class _TopViewState extends State<TopView> {
  CurrentWeather? weather;
  var isLoaded = false;
  var date = DateTime.now();

  @override
  void initState() {
    print("1");
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

  Widget _textWidget({
    required Icons? icon,
    required String text,
    required String textDesc,
  }) {
    return Column(
      children: [
        const Icon(Icons.add),
        Text(
          text,
          style: const TextStyle(
            fontSize: 15,
            color: Color.fromRGBO(255, 255, 255, 0.42),
          ),
        ),
        Text(textDesc),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.apps,
                          size: 30,
                          color: Colors.white,
                        )),
                    Container(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_pin,
                            color: Colors.white,
                          ),
                          Text(weather?.name ?? '',
                              style: const TextStyle(
                                  fontSize: 27,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              textAlign: TextAlign.center),
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.more_vert,
                          size: 30,
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 308,
                height: 170,
                child: Image.asset(
                  getWeatherIcon('${weather?.weather[0].icon}'),
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
              Text('${weather?.main?.temp?.round()}',
                  style: const TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.center),
              Text('${weather?.weather[0].description}',
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center),
              Text(DateFormat('EEEE, d MMM').format(date),
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
                    '${weather?.wind?.speed} km/h',
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
                    '${weather?.main?.humidity}%',
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
                    '${weather?.wind?.speed}%',
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
      ),
    );
  }
}

//\u00b0
