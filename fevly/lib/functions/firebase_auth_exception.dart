import 'package:fevly/errors_msg.dart';
import 'package:fevly/components/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

String handleFireEmailException(
    {required String code, required BuildContext context}) {
  if (code == 'network-request-failed') {
    handleNetworkError(context);
    return '';
  } else if (code == 'too-many-requests') {
    return Ktoo_many_requests_error_msg;
  } else if (code == 'invalid-email') {
    return Kemail_badly_formatted;
  } else {
    return code;
  }
}

String handleFireSignInException(
    {required String code, required BuildContext context}) {
  if (code == 'network-request-failed') {
    handleNetworkError(context);
    return '';
  } else if (code == 'too-many-requests') {
    return Ktoo_many_requests_error_msg;
  } else if (code == 'wrong-password') {
    return Kwrong_password_error_msg;
  } else {
    return code;
  }
}

void handleNetworkError(BuildContext context) {
  final Size size = MediaQuery.of(context).size;
  final ColorScheme themeColor = Theme.of(context).colorScheme;
  final TextTheme textTheme =
      GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
  ScaffoldMessenger.of(context).showSnackBar(
    buildCustomSnackBar(
      themeColor: themeColor,
      textTheme: textTheme,
      size: size,
      text: 'Pas de connexion internet 🌛',
    ),
  );
}
