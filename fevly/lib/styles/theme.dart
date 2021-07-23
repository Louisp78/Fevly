import 'package:fevly/styles/colors.dart';
import 'package:flutter/material.dart';

final ThemeData themeData = ThemeData(
  textTheme: textTheme,
  scaffoldBackgroundColor: Colors.white,
  focusColor: kPrimaryColor,
  hintColor: kPrimaryColor,
);

const TextTheme textTheme = TextTheme(
  // QS 9 Bold
  headline6: TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontSize: 9.0,
  ),

  // QS 12 Bold
  headline5: TextStyle(
    fontSize: 12.0,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  ),

  // QS 14 Bold
  headline4: TextStyle(
    fontSize: 14.0,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  ),

  // QS 16 Bold
  headline3: TextStyle(
    fontSize: 16.0,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  ),

  // QS 18 Bold
  headline2: TextStyle(
    fontSize: 18.0,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  ),

  // QS 38 Bold
  headline1: TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontSize: 38,
  ),

  // QS 14 Reg
  bodyText1: TextStyle(
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontSize: 14.0,
  ),

  // QS 10 Reg
  bodyText2: TextStyle(
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontSize: 10.0,
  ),

  // QS 8 Medium
  button: TextStyle(
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontSize: 8.0,
  ),

  // QS 16 Medium
  subtitle1: TextStyle(
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontSize: 16.0,
  ),
);
