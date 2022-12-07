import 'package:flutter/material.dart';


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
