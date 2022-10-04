import 'package:flutter/material.dart';

Widget header(
    String location,
    ){
  return Expanded(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.apps,
              size: 28,
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
              Text(location ,
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
              size: 28,
              color: Colors.white,
            ))
      ],
    ),
  );
}