import 'package:fevly/models/dynamic_theme_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

// TODO: use widget colorscheme to use colors inside themes

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

// Text colors =======================================

/// Basic text color
const Color kTextColor = Color(0xffAAAAAA);

/// Darker text color
const Color kDarkerTextColor = Color(0xff767676);

// Other colors ======================================

/// Error
const Color kErrorColor = Color(0xffFF0000);

/// Done
const Color kDoneColor = Color(0xff0ADA05);

/// Surface Light
const Color kSurfaceLightColor = Color(0xffFBFBFB);

/// Surface
const Color kSurfaceColor = Color(0xffEEEEEE);

/// [only for dark theme] Surface Light
const Color kDarkSurfaceLightColor = Color(0xff424242);

/// [only for dark theme] Surface
const Color kDarkSurfaceColor = Color(0xff1D1D1D);

class ThemeColor {
  final Color kPrimaryColor,
      // ignore: avoid_multiple_declarations_per_line
      kPrimaryVariantColor,
      kSecondaryColor,
      kSecondaryVariantColor,
      kBaseColor,
      kBaseOppositeColor,
      kTextColor = const Color(0xffAAAAAA),
      kDarkerTextColor = const Color(0xff767676),
      kErrorColor = const Color(0xffFF0000),
      kDoneColor = const Color(0xff0ADA05),
      kSurfaceLightColor,
      kSurfaceColor;

  ThemeColor.lightMode({
    this.kPrimaryColor = const Color(0xffE040FB),
    this.kPrimaryVariantColor = const Color(0xffFFC7FF),
    this.kSecondaryColor = const Color(0xffFF4545),
    this.kSecondaryVariantColor = const Color(0xffFF7C71),
    this.kSurfaceLightColor = const Color(0xffFBFBFB),
    this.kSurfaceColor = const Color(0xffEEEEEE),
    this.kBaseColor = const Color(0xffffffff),
    this.kBaseOppositeColor = const Color(0xff000000),
  });

  ThemeColor.darkMode({
    this.kPrimaryColor = const Color(0xffEA80FC),
    this.kPrimaryVariantColor = const Color(0xffFFD6FF),
    this.kSecondaryColor = const Color(0xffFF7C71),
    this.kSecondaryVariantColor = const Color(0xffFFAEA0),
    this.kSurfaceLightColor = const Color(0xff424242),
    this.kSurfaceColor = const Color(0xff1D1D1D),
    this.kBaseColor = const Color(0xff000000),
    this.kBaseOppositeColor = const Color(0xffffffff),
  });
}

ThemeColor initThemeColor({required BuildContext context}) {
  return Provider.of<DynamicThemeMode>(context).mode == ThemeMode.light
      ? ThemeColor.lightMode()
      : ThemeColor.darkMode();
}

ThemeColor initThemeColorStatic() =>
    SchedulerBinding.instance!.window.platformBrightness == Brightness.light
        ? ThemeColor.lightMode()
        : ThemeColor.darkMode();


Map<int, Color> kColorSwatch ={
  50:const Color.fromRGBO(224,64,251, .1),
  100:const Color.fromRGBO(224,64,251, .2),
  200:const Color.fromRGBO(224,64,251, .3),
  300:const Color.fromRGBO(224,64,251, .4),
  400:const Color.fromRGBO(224,64,251, .5),
  500:const Color.fromRGBO(224,64,251, .6),
  600:const Color.fromRGBO(224,64,251, .7),
  700:const Color.fromRGBO(224,64,251, .8),
  800:const Color.fromRGBO(224,64,251, .9),};