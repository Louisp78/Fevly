import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:fevly/functions/firebase_auth_exception.dart';
import 'package:fevly/service/application_state.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

Future<dynamic> buildDisconnectDialog({required BuildContext context}) {
  final appState = Provider.of<ApplicationState>(context, listen: false);
  final Size size = MediaQuery.of(context).size;
  final ColorScheme themeColor = Theme.of(context).colorScheme;
  final TextTheme textTheme =
      GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.QUESTION,
    headerAnimationLoop: false,
    title: 'Se déconnecter',
    desc: 'Voulez-vous vraiment vous déconnecter ?',
    descTextStyle: textTheme.bodyMedium,
    btnOkColor: themeColor.surface,
    btnCancelText: 'Non',
    btnOkText: 'Oui',
    btnCancelColor: themeColor.primary,
    buttonsTextStyle: textTheme.bodyLarge,
    titleTextStyle: textTheme.bodyLarge,
    showCloseIcon: true,
    btnCancelOnPress: () {},
    btnOkOnPress: () => appState.signOut(
      onNetworkRequestFailed: () => handleNetworkError(context),
      onOperationNotAllowed: () => handleOperationNotAllowed(context),
      onTooManyRequests: () => handleTooManyRequests(context),
      onSuccess: () => Navigator.pushNamedAndRemoveUntil(
        context,
        '/',
        (Route<dynamic> route) => false,
      ),
    ),
  ).show();
}
