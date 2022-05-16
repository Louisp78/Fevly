import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void buildLeaveAppDialog({required BuildContext context}) {
  final ColorScheme themeColor = Theme.of(context).colorScheme;
  final TextTheme textTheme =
      GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
  AwesomeDialog(
    context: context,
    dialogType: DialogType.QUESTION,
    headerAnimationLoop: false,
    title: 'Quitter ?',
    desc: 'Voulez-vous vraiment quitter Fevly ?',
    descTextStyle: textTheme.bodyMedium,
    btnOkColor: themeColor.surface,
    btnCancelText: 'Non',
    btnOkText: 'Oui',
    btnCancelColor: themeColor.primary,
    buttonsTextStyle: textTheme.bodyLarge,
    titleTextStyle: textTheme.bodyLarge,
    showCloseIcon: true,
    btnCancelOnPress: () {},
    btnOkOnPress: () => Navigator.of(context).pop(),
  ).show();
}
