import 'package:fevly/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextButtonSize {
  final double height, borderRadius, padding;

  CustomTextButtonSize(
      {required this.padding,
      required this.height,
      required this.borderRadius});

  const CustomTextButtonSize.normal(
      {this.padding = 24, this.borderRadius = 20, this.height = 42});
  const CustomTextButtonSize.small(
      {this.padding = 10, this.borderRadius = 13, this.height = 27});
}

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    this.prefixIcon,
    this.suffixIcon,
    this.lightMode = true,
    this.secondary = false,
    required this.press,
    required this.text,
    this.isActive = true,
    this.buttonSize = const CustomTextButtonSize.normal(),
    this.backgroundColor,
    this.textColor,
  }) : super(key: key);

  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool lightMode;
  final bool secondary;
  final GestureTapCallback press;
  final String text;
  final Color? textColor;
  final bool isActive;
  final CustomTextButtonSize buttonSize;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    final TextStyle textStyle =
        buttonSize.height == const CustomTextButtonSize.normal().height
            ? textTheme.headline4!
            : textTheme.headline5!;
    return InkWell(
      highlightColor: kPrimaryColor,
      borderRadius: BorderRadius.circular(buttonSize.borderRadius),
      onTap: press,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: buttonSize.padding),
        height: buttonSize.height,
        decoration: BoxDecoration(
          color: backgroundColor ??
              (isActive
                  ? (lightMode ? kPrimaryColor : kDarkPrimaryColor)
                  : kTextColor),
          borderRadius: BorderRadius.circular(buttonSize.borderRadius),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (prefixIcon != null) prefixIcon!,
            if (prefixIcon != null) const SizedBox(width: 10),
            Text(
              text,
              style: textStyle.copyWith(
                  color:
                      textColor ?? (lightMode ? Colors.white : Colors.black)),
            ),
            if (suffixIcon != null) const SizedBox(width: 10),
            if (suffixIcon != null) suffixIcon!,
          ],
        ),
      ),
    );
  }
}
