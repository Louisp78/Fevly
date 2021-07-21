import 'package:fevly/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  }) : super(key: key);

  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool lightMode;
  final bool secondary;
  final GestureTapCallback press;
  final String text;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    return InkWell(
      highlightColor: kPrimaryColor,
      borderRadius: BorderRadius.circular(20),
      onTap: press,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        height: 42,
        decoration: BoxDecoration(
          color: isActive
              ? (lightMode ? kPrimaryColor : kDarkPrimaryColor)
              : kTextColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (prefixIcon != null) prefixIcon!,
            if (prefixIcon != null) const SizedBox(width: 10),
            Text(
              text,
              style: textTheme.headline4
                  ?.copyWith(color: lightMode ? Colors.white : Colors.black),
            ),
            if (suffixIcon != null) const SizedBox(width: 10),
            if (suffixIcon != null) suffixIcon!,
          ],
        ),
      ),
    );
  }
}
