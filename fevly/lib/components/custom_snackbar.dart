import 'package:auto_size_text/auto_size_text.dart';
import 'package:fevly/components/custom_small_button.dart';
import 'package:flutter/material.dart';

SnackBar buildCustomSnackBar(
    {required TextTheme textTheme,
    required Size size,
    required String text,
    GestureTapCallback? undoPress,
    required ColorScheme themeColor}) {
  return SnackBar(
    backgroundColor: themeColor.surface,
    content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: size.width * 0.6,
          child: AutoSizeText(
            text,
            style: textTheme.headline5?.copyWith(color: themeColor.primary),
            minFontSize: 10,
            maxLines: 2,
          ),
        ),
        if (undoPress != null)
          CustomSmallButton(
            text: "Annuler",
            press: undoPress,
            buttonSize: CustomSmallButtonSize.small,
            textColor: themeColor.onBackground,
          )
      ],
    ),
  );
}
