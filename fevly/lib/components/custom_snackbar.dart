import 'package:auto_size_text/auto_size_text.dart';
import 'package:fevly/components/custom_small_button.dart';
import 'package:fevly/constant.dart';
import 'package:flutter/material.dart';

SnackBar buildCustomSnackBar(
    {required TextTheme textTheme,
    required Size size,
    required String text,
    GestureTapCallback? undoPress,
    required ColorScheme themeColor}) {
  return SnackBar(
    backgroundColor: themeColor.surface,
    content: Container(
      padding: EdgeInsets.symmetric(
          horizontal: kBasicHorizontalPadding(size: size) / 6),
      constraints: BoxConstraints(maxHeight: size.height * 0.1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: AutoSizeText(
              text,
              textAlign: TextAlign.center,
              style: textTheme.headline3?.copyWith(color: themeColor.primary),
              minFontSize: 12,
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
    ),
  );
}
