import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:prototype/models/hourly_weather.dart';
import 'package:prototype/utils/icon_selection.dart';
import 'package:prototype/data/service/hourlyWeather_service.dart';

class BottomView extends StatefulWidget {
  const BottomView({Key? key}) : super(key: key);

  @override
  State<BottomView> createState() => _BottomViewState();
}

class _BottomViewState extends State<BottomView> {
  HourlyWeather? hourlyWeather;
  var isLoaded = false;
  LocationData? locationData;



  @override
  void initState() {
    print("2");
    getHData();
    super.initState();
  }

  getHData() async {
    hourlyWeather = await getHourlyWeather();
    if (hourlyWeather != null) {
      setState(() {
        isLoaded == true;
      });
    }
  }

  Widget _buildHourlyItem(
    int index,
    ListElement list,
  ) {
    return Row(
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: Image.asset(
                    getWeatherIcon(list.weather[0].icon),
                    scale: 10,
                  ),
                )
              ],
            ),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        width: 400,
        height: MediaQuery.of(context).size.height * 0.23,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 40,
          itemBuilder: (context, index) {
            var hW =hourlyWeather?.list[index];
            return Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white10)),
              child: Column(
                children: [
                  Text(
                    '${hW?.main.temp}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.asset(
                      getWeatherIcon(
                          '${hW?.weather[0].icon}'),
                      scale: 20,
                    ),
                  ),
                  Text(
                    '${hW?.dtTxt.hour}:00',
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    '${hW?.weather[0].description}',
                    style: const TextStyle(color: Colors.white38,),
                  ),
                  Text(
                    '${hW?.weather[0].description}',
                    style: const TextStyle(color: Colors.white38,),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
