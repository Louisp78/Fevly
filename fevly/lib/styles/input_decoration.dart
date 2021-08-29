import 'package:fevly/constant.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

InputDecoration basicInputDecoration(
    {required TextStyle hintStyle, required String hintText}) {
  final ThemeColor themeColor = initThemeColor();
  return InputDecoration(
    filled: true,
    hintText: hintText,
    fillColor: themeColor.kSurfaceLightColor,
    hintStyle: hintStyle,
    contentPadding: const EdgeInsets.only(
      bottom: 5.0,
      left: 20.0,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(
        width: 1.5,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
        color: themeColor.kPrimaryColor,
        width: 3.0,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
        color: themeColor.kErrorColor,
        width: 1.5,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
        color: themeColor.kErrorColor,
        width: 3.0,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: themeColor.kTextColor,
      ),
      borderRadius: BorderRadius.circular(20),
    ),
  );
}

InputDecoration smallSearchInputDecoration(
    {required TextStyle hintStyle,
    required Size size,
    required String hintText}) {
  final ThemeColor themeColor = initThemeColor();

  return InputDecoration(
    filled: true,
    prefixIcon: Icon(
      Icons.search_rounded,
      color: themeColor.kTextColor,
      size: kSmallIconSize,
    ),
    hintText: hintText,
    fillColor: themeColor.kSurfaceColor,
    hintStyle: hintStyle,
    contentPadding: EdgeInsets.only(
      left: size.width * 0.045,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(
        width: 1.5,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(
        color: themeColor.kPrimaryColor,
        width: 3.0,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(
        color: themeColor.kErrorColor,
        width: 1.5,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(
        color: themeColor.kErrorColor,
        width: 3.0,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: themeColor.kTextColor,
      ),
      borderRadius: BorderRadius.circular(30),
    ),
  );
}

InputDecoration searchInputDecoration(
    {required TextStyle hintStyle,
    required Size size,
    required String hintText}) {
  final ThemeColor themeColor = initThemeColor();
  return InputDecoration(
    filled: true,
    prefixIcon: Icon(
      Icons.search_rounded,
      color: themeColor.kTextColor,
      size: kSmallIconSize,
    ),
    hintText: hintText,
    fillColor: themeColor.kSurfaceColor,
    hintStyle: hintStyle,
    contentPadding: EdgeInsets.only(
      left: size.width * 0.045,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(
        color: themeColor.kPrimaryColor,
        width: 3.0,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(
        color: themeColor.kErrorColor,
        width: 1.5,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(
        color: themeColor.kErrorColor,
        width: 3.0,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide.none,
    ),
  );
}
