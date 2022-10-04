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
    bool selected = false;
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: const [
              AnimatedContainerApp(),
             // BottomView(),
            ],
          ),
        ),
      ),
    );
  }
}

//WeatherStatus().getWeatherIcon('${weather?.weather[0].icon}'),
//Text(
//                         weather?.name ?? '',
//                         style: const TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold),
//                       ),
