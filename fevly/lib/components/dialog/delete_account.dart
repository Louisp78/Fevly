import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:fevly/functions/firebase_auth_exception.dart';
import 'package:fevly/screens/reauthenticate/reauthenticate_screen.dart';
import 'package:fevly/service/application_state.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

Future<dynamic> buildDeleteAccountDialog(
    {required BuildContext context,
    required void Function() onRequiresRecentLogin}) {
  final Size size = MediaQuery.of(context).size;
  final ColorScheme themeColor = Theme.of(context).colorScheme;
  final TextTheme textTheme =
      GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
  final ApplicationState appState =
      Provider.of<ApplicationState>(context, listen: false);
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.WARNING,
    headerAnimationLoop: false,
    title: 'Supprimer le compte ?',
    desc:
        'Attention cette action est irréversible. Vous perdrez toutes vos données.',
    descTextStyle: textTheme.bodyMedium,
    btnOkColor: themeColor.surface,
    btnCancelText: 'Annuler',
    btnOkText: 'Confirmer',
    btnCancelColor: themeColor.primary,
    buttonsTextStyle: textTheme.bodyLarge,
    titleTextStyle: textTheme.bodyLarge,
    showCloseIcon: true,
    btnCancelOnPress: () {},
    btnOkOnPress: () => appState.deleteUser(
      onNetworkRequestFailed: () => handleNetworkError(context),
      onOperationNotAllowed: () => handleOperationNotAllowed(context),
      onTooManyRequests: () => handleTooManyRequests(context),
      onSucess: () => Navigator.pushNamedAndRemoveUntil(
        context,
        '/',
        (Route<dynamic> route) => false,
      ),
      onRequiresRecentLogin: onRequiresRecentLogin,
    ),
  ).show();
}
