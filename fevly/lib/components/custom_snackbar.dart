import 'package:auto_size_text/auto_size_text.dart';
import 'package:fevly/styles/colors.dart';
import 'package:flutter/material.dart';

import 'custom_small_button.dart';

SnackBar buildCustomSnackBar({
  required TextTheme textTheme,
  required Size size,
  required String text,
  required GestureTapCallback undoPress,
  required BuildContext context,
}) {
  final ThemeColor themeColor = initThemeColor(context: context);
  return SnackBar(
    backgroundColor: themeColor.kSurfaceColor,
    content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: size.width * 0.6,
          child: AutoSizeText(
            text,
            style:
                textTheme.headline5?.copyWith(color: themeColor.kPrimaryColor),
            minFontSize: 10,
            maxLines: 2,
          ),
        ),
        CustomSmallButton(
          text: "Annuler",
          press: undoPress,
          buttonSize: CustomSmallButtonSize.small,
        )
      ],
    ),
  );
}
