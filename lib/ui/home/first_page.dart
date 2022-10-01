import 'package:flutter/material.dart';
import 'package:prototype/ui/views/top_view.dart';
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
            children: [
              // Container(
              //   height: MediaQuery.of(context).size.height * 0.10,
              // ),
              Container(
                height: MediaQuery.of(context).size.height * 0.70,
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
                child: const TopView(),
              ),
              const BottomView(),
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
