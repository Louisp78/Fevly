import 'package:auto_size_text/auto_size_text.dart';
import 'package:fevly/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum CustomSmallButtonSize { small, normal, verySmall }

class CustomSmallButton extends StatelessWidget {
  const CustomSmallButton(
      {this.prefixIcon,
      this.suffixIcon,
      this.buttonSize = CustomSmallButtonSize.normal,
      this.withBorder = true,
      required this.text,
      required this.press,
      this.borderColor,
      this.textColor,
      this.borderWidth,
      this.backgroundColor});

  final String text;
  final Color? textColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final CustomSmallButtonSize buttonSize;
  final bool withBorder;
  final GestureTapCallback press;
  final Color? borderColor;
  final double? borderWidth;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    final bool isSmall = buttonSize == CustomSmallButtonSize.small;
    final ColorScheme themeColor = Theme.of(context).colorScheme;
    final Color chooseTextColor = textColor ?? themeColor.onBackground;
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: press,
      child: Container(
        height: isSmall ? 24 : 30,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: withBorder
              ? Border.all(
                  width: borderWidth ?? 3,
                  color: borderColor ?? themeColor.primary)
              : null,
          color: backgroundColor,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (prefixIcon != null) prefixIcon!,
            if (prefixIcon != null) const SizedBox(width: 5),
            Flexible(
              child: AutoSizeText(
                text,
                style: buttonSize == CustomSmallButtonSize.verySmall
                    ? textTheme.bodySmall!
                    : (isSmall
                        ? textTheme.bodyMedium!.copyWith(
                            color: chooseTextColor,
                          )
                        : textTheme.bodyLarge!.copyWith(
                            color: chooseTextColor,
                          )),
              ),
            ),
            if (suffixIcon != null) const SizedBox(width: 5),
            if (suffixIcon != null) suffixIcon!,
          ],
        ),
      ),
    );
  }
}
