import 'package:flutter/material.dart';

enum FilterOptions {
  Favorites,
  All,
}

Widget header(
  String location,
) {
  return Expanded(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.apps,
                    size: 28,
                    color: Colors.white,
                  )),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                const Icon(
                  Icons.location_pin,
                  color: Colors.white,
                ),
                Text(location,
                    style: const TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    textAlign: TextAlign.center),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 28,
                  )),
            ],
          ),
        )
      ],
    ),
  );
}
