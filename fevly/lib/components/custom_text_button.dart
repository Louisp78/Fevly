import 'package:fevly/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextButtonSize {
  final double height;
  final double borderRadius;
  final double padding;

  CustomTextButtonSize(
      {required this.padding,
      required this.height,
      required this.borderRadius});

  const CustomTextButtonSize.normal(
      {this.padding = 24, this.borderRadius = 20, this.height = 42});
  const CustomTextButtonSize.small(
      {this.padding = 10, this.borderRadius = 13, this.height = 27});
  const CustomTextButtonSize.verySmall(
      {this.padding = 8, this.borderRadius = 11, this.height = 25});
}

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    this.prefixIcon,
    this.suffixIcon,
    this.secondary = false,
    required this.press,
    this.text = "",
    this.isActive = true,
    this.buttonSize = const CustomTextButtonSize.normal(),
    this.backgroundColor,
    this.textColor,
    this.border,
    this.textWidget,
  }) : super(key: key);

  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool secondary;
  final GestureTapCallback press;
  final String text;
  final Color? textColor;
  final bool isActive;
  final CustomTextButtonSize buttonSize;
  final Color? backgroundColor;
  final Border? border;
  final Widget? textWidget;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    final TextStyle textStyle =
        buttonSize.height == const CustomTextButtonSize.normal().height
            ? textTheme.headline4!
            : textTheme.headline5!;
    final ColorScheme themeColor = Theme.of(context).colorScheme;
    return InkWell(
      highlightColor: themeColor.primary,
      borderRadius: BorderRadius.circular(buttonSize.borderRadius),
      onTap: press,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: buttonSize.padding),
        height: buttonSize.height,
        decoration: BoxDecoration(
          color:
              backgroundColor ?? (isActive ? themeColor.primary : kTextColor),
          borderRadius: BorderRadius.circular(buttonSize.borderRadius),
          border: border,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (prefixIcon != null) prefixIcon!,
            if (prefixIcon != null) const SizedBox(width: 10),
            textWidget ??
                Text(
                  text,
                  style: textStyle.copyWith(
                      color: textColor ?? themeColor.background),
                ),
            if (suffixIcon != null) const SizedBox(width: 10),
            if (suffixIcon != null) suffixIcon!,
          ],
        ),
      ),
    );
  }
}
