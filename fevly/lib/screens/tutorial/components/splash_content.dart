import 'package:fevly/styles/colors.dart';
import 'package:fevly/styles/effects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    this.text,
    this.image,
  }) : super(key: key);
  final String? text, image;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.1),
          child: SizedBox(
            width: size.width * 0.8,
            height: size.height * 0.4,
            child: SvgPicture.asset(image ?? "test"),
          ),
        ),
        SizedBox(height: size.height * 0.025),
        Container(
          height: size.height * 0.3,
          width: size.width * 0.9,
          decoration: BoxDecoration(
            boxShadow: [kShadowProfileCard],
            borderRadius: BorderRadius.circular(55),
            gradient: const SweepGradient(
              colors: [kPrimaryColor, kDarkPrimaryColor],
              center: FractionalOffset.topLeft,
              endAngle: 1.25,
              stops: [0.5, 0.5],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
            child: Column(
              children: [
                SizedBox(height: size.height * 0.05),
                Text(
                  text ?? "s",
                  style: textTheme.headline3?.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
