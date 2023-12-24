import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  primarySwatch: Colors.red,
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
    bodyText2: TextStyle(
      color: Color(0x8fffFFFF),
      fontSize: 14,
      fontWeight: FontWeight.w200,
    ),
  ),
  scaffoldBackgroundColor: const Color(0xFF080606),
);
