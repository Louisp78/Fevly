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
  }) : super(key: key);

  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool lightMode;
  final bool secondary;
  final GestureTapCallback press;
  final String text;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    return InkWell(
      highlightColor: kPrimaryColor,
      onTap: press,
      child: Container(
        alignment: Alignment.center,
        height: 44,
        width: 156,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: textTheme.headline4?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
