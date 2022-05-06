import 'package:auto_size_text/auto_size_text.dart';
import 'package:fevly/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    required this.title,
    required this.onTap,
    this.prefixWidget,
    this.suffixWidget,
  });

  final String title;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ColorScheme themeColor = Theme.of(context).colorScheme;

    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: kBasicHorizontalPadding(size: size),
            vertical: size.height * 0.025),
        decoration: BoxDecoration(
            color: themeColor.surface, borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            prefixWidget ?? const SizedBox(),
            SizedBox(width: kBasicHorizontalPadding(size: size)),
            Expanded(
              child: AutoSizeText(
                title,
                style: textTheme.subtitle1,
                maxLines: 1,
              ),
            ),
            SizedBox(width: kBasicHorizontalPadding(size: size)),
            suffixWidget ?? const SizedBox(),
          ],
        ),
      ),
    );
  }
}
