import 'package:auto_size_text/auto_size_text.dart';
import 'package:fevly/constant.dart';
import 'package:fevly/styles/colors.dart';
import 'package:fevly/styles/effects.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBasicAppBar extends StatelessWidget {
  const CustomBasicAppBar({
    required this.title,
    required this.press,
    this.subtitleText,
    this.prefixIcon,
    this.firstSuffixIcon,
    this.secondSuffixIcon,
    this.iconData,
    this.subtitleIcon,
  }) : assert(
            subtitleText == null && subtitleIcon != null ||
                subtitleText != null && subtitleIcon == null ||
                subtitleText == null && subtitleIcon == null,
            "SubtitleIcon and SubtitleText couldn't be define at the same time !");

  final String title;
  final IconData? iconData;
  final GestureTapCallback press;
  final String? subtitleText;
  final Widget? subtitleIcon;
  final Widget? prefixIcon;
  final Widget? firstSuffixIcon;
  final Widget? secondSuffixIcon;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    final ThemeColor themeColor = initThemeColor();
    return Container(
      width: size.width,
      height: 110,
      padding: const EdgeInsets.only(bottom: 20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: themeColor.kSurfaceLightColor, boxShadow: [kShadowBase]),
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          Center(
            child: SizedBox(
              width: size.width * 0.40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AutoSizeText(
                    title,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: textTheme.headline3,
                  ),
                  if (subtitleText != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: kBasicSubtitleForAppBar(
                          subtitle: subtitleText!, textTheme: textTheme),
                    ),
                  if (subtitleIcon != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: subtitleIcon,
                    ),
                ],
              ),
            ),
          ),
          if (iconData != null)
            Positioned(
              left: 0,
              child: IconButton(
                onPressed: press,
                icon: Icon(iconData, color: themeColor.kBaseOppositeColor),
              ),
            ),
          if (prefixIcon != null)
            Positioned(
              left: size.width * 0.1,
              child: prefixIcon!,
            ),
          if (firstSuffixIcon != null)
            Positioned(
              right: size.width * 0.1,
              child: firstSuffixIcon!,
            ),
          if (secondSuffixIcon != null)
            Positioned(
              right: 0,
              child: secondSuffixIcon!,
            ),
        ],
      ),
    );
  }
}
