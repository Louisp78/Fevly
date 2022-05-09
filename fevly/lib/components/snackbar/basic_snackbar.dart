import 'package:fevly/components/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void buildBasicSnackbar(
    {required BuildContext context, required String message}) {
  final TextTheme textTheme =
      GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
  final Size size = MediaQuery.of(context).size;
  final ColorScheme themeColor = Theme.of(context).colorScheme;
  ScaffoldMessenger.of(context).showSnackBar(
    buildCustomSnackBar(
      themeColor: themeColor,
      textTheme: textTheme,
      size: size,
      text: message,
    ),
  );
}
