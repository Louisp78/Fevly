import 'package:auto_size_text/auto_size_text.dart';
import 'package:fevly/styles/colors.dart';
import 'package:fevly/styles/effects.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBasicAppBar extends StatelessWidget {
  const CustomBasicAppBar({
    Key? key,
    required this.title,
    required this.iconData,
    required this.press,
    this.subtitle,
  }) : super(key: key);

  final String title;
  final IconData iconData;
  final GestureTapCallback press;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    return Container(
      width: size.width,
      height: size.height * 0.15,
      padding:
          EdgeInsets.only(top: size.height * 0.07, bottom: size.height * 0.03),
      alignment: Alignment.center,
      decoration:
          BoxDecoration(color: kSurfaceLightColor, boxShadow: [kShadowBase]),
      child: Stack(
        alignment: Alignment.centerLeft,
        clipBehavior: Clip.none,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: size.width * 0.40,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      title,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style: textTheme.headline3,
                    ),
                    if (subtitle != null)
                      AutoSizeText(
                        subtitle!,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: textTheme.headline5?.copyWith(color: kTextColor),
                      ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            left: 0,
            child: IconButton(
              onPressed: press,
              icon: Icon(iconData),
            ),
          ),
        ],
      ),
    );
  }
}
