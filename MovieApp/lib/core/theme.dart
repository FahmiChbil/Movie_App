import 'package:flutter/material.dart';

final appTheme = ThemeData(
    textTheme: TextTheme(
        headline1: TextStyle(
          color: Colors.white70,
          fontWeight: FontWeight.w300,
          fontSize: 18,
        ),
        bodyText2:
            TextStyle(color: Colors.white60, fontWeight: FontWeight.w300),
        bodyText1: TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        )),
    backgroundColor: Colors.black,
    progressIndicatorTheme:
        ProgressIndicatorThemeData(color: Colors.teal.shade400));
