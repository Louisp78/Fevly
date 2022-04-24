import 'package:flutter/material.dart';

// Primary colors ======================================

/// Primary purple
const Color kPrimaryColor = Color(0xffE040FB);

/// Variant primary purple
const Color kPrimaryVariantColor = Color(0xffFFC7FF);

/// Secondary red
const Color kSecondaryColor = Color(0xffFF4545);

/// Variant secondary red
const Color kSecondaryVariantColor = Color(0xffFF7C71);

/// [only for dark theme] Primary purple
const Color kDarkPrimaryColor = Color(0xffEA80FC);

/// [only for dark theme] Variant primary purple
const Color kDarkPrimaryVariantColor = Color(0xffFFD6FF);

/// [only for dark theme] Secondary red
const Color kDarkSecondaryColor = Color(0xffFF7C71);

/// [only for dark theme] Variant secondary red
const Color kDarkSecondaryVariantColor = Color(0xffFFAEA0);

//* Other colors ======================================

/// Error
const Color kErrorColor = Color(0xffFF0000);

/// Surface Light
const Color kSurfaceColor = Color(0xffFBFBFB);

/// Surface
const Color kSurfaceLightColor = Color(0xffEEEEEE);

/// [only for dark theme] Surface Light
const Color kDarkSurfaceLightColor = Color(0xff424242);

/// [only for dark theme] Surface
const Color kDarkSurfaceColor = Color(0xff1D1D1D);

const ColorScheme themeColorLight = ColorScheme(
    primary: kPrimaryColor,
    primaryContainer: kPrimaryVariantColor,
    secondary: kSecondaryColor,
    secondaryContainer: kSecondaryVariantColor,
    surface: kSurfaceColor,
    background: Colors.white,
    error: kErrorColor,
    onPrimary: kPrimaryColor,
    onSecondary: kSecondaryColor,
    onSurface: kSurfaceLightColor,
    onBackground: Colors.black,
    onError: Colors.red,
    brightness: Brightness.light);

const ColorScheme themeColorDark = ColorScheme(
    primary: kDarkPrimaryColor,
    primaryContainer: kDarkPrimaryVariantColor,
    secondary: kDarkSecondaryColor,
    secondaryContainer: kDarkSecondaryVariantColor,
    surface: kDarkSurfaceColor,
    background: Colors.black,
    error: kErrorColor,
    onPrimary: kDarkPrimaryColor,
    onSecondary: kDarkSecondaryColor,
    onSurface: kDarkSurfaceLightColor,
    onBackground: Colors.white,
    onError: Colors.red,
    brightness: Brightness.dark);

//$ Constant colors =======================================
/// Done
const Color kDoneColor = Color(0xff0ada04);

//* Text colors =======================================

/// Basic text color
const Color kTextColor = Color(0xffAAAAAA);

/// Darker text color
const Color kDarkerTextColor = Color(0xff767676);
