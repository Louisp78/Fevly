import 'package:fevly/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hintText,
    this.isSelected = false,
  }) : super(key: key);
  final String hintText;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    final Size size = MediaQuery.of(context).size;
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: size.width * 0.8,
        height: 45,
        decoration: BoxDecoration(
          border: isSelected
              ? Border.all(width: 2.0, color: kPrimaryColor)
              : Border.all(width: 0, color: Colors.transparent),
          color: kSurfaceColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: textTheme.headline4?.copyWith(color: kTextColor),
            enabledBorder: InputBorder.none,
            contentPadding: const EdgeInsets.only(bottom: 5.0),
          ),
        ));
  }
}
