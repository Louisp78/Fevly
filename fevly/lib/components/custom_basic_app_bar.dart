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
  }) : super(key: key);

  final String title;
  final IconData iconData;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    return Container(
      width: size.width,
      padding:
          EdgeInsets.only(top: size.height * 0.07, bottom: size.height * 0.04),
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
                child: AutoSizeText(
                  title,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: textTheme.headline3,
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
