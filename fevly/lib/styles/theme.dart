import 'package:fevly/styles/colors.dart';
import 'package:flutter/material.dart';

final ThemeColor themeColor = initThemeColor();

final ThemeData lightThemeData = ThemeData(
  textTheme: textTheme(),
  scaffoldBackgroundColor: Colors.white,
  focusColor: kPrimaryColor,
  hintColor: kPrimaryColor,
  floatingActionButtonTheme: fltActionBtnThemeData,
);

final ThemeData darkThemeData = ThemeData(
  textTheme: textTheme(darkMode: true),
  scaffoldBackgroundColor: Colors.black,
  focusColor: kDarkPrimaryColor,
  hintColor: kDarkPrimaryColor,
  floatingActionButtonTheme: fltActionBtnThemeData,
);

TextTheme textTheme({bool darkMode = false}) {
  final Color currentTextColor = darkMode ? Colors.white : Colors.black;
  return TextTheme(
    // QS 9 Bold
    headline6: TextStyle(
      fontWeight: FontWeight.bold,
      color: currentTextColor,
      fontSize: 9.0,
    ),

    // QS 12 Bold
    headline5: TextStyle(
      fontSize: 12.0,
      color: currentTextColor,
      fontWeight: FontWeight.bold,
    ),

    // QS 14 Bold
    headline4: TextStyle(
      fontSize: 14.0,
      color: currentTextColor,
      fontWeight: FontWeight.bold,
    ),

    // QS 16 Bold
    headline3: TextStyle(
      fontSize: 16.0,
      color: currentTextColor,
      fontWeight: FontWeight.bold,
    ),

    // QS 18 Bold
    headline2: TextStyle(
      fontSize: 18.0,
      color: currentTextColor,
      fontWeight: FontWeight.bold,
    ),

    // QS 38 Bold
    headline1: TextStyle(
      fontWeight: FontWeight.bold,
      color: currentTextColor,
      fontSize: 38,
    ),

    // QS 14 Reg
    bodyText1: TextStyle(
      fontWeight: FontWeight.w400,
      color: currentTextColor,
      fontSize: 14.0,
    ),

    // QS 10 Reg
    bodyText2: TextStyle(
      fontWeight: FontWeight.w400,
      color: currentTextColor,
      fontSize: 10.0,
    ),

    // QS 8 Medium
    button: TextStyle(
      fontWeight: FontWeight.bold,
      color: currentTextColor,
      fontSize: 8.0,
    ),

    // QS 16 Medium
    subtitle1: TextStyle(
      fontWeight: FontWeight.w500,
      color: currentTextColor,
      fontSize: 16.0,
    ),
  );
}

FloatingActionButtonThemeData fltActionBtnThemeData =
    FloatingActionButtonThemeData(backgroundColor: themeColor.kPrimaryColor);
