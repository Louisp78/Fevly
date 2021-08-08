import 'package:fevly/components/custom_small_button.dart';
import 'package:fevly/components/custom_text_button.dart';
import 'package:fevly/styles/colors.dart';
import 'package:fevly/styles/effects.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant.dart';

class DateInformations extends StatelessWidget {
  const DateInformations({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    return Container(
      height: 150,
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: kSurfaceLightColor,
        boxShadow: [kShadowBase],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: size.height * 0.02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: Text(
              "Dates",
              style: textTheme.headline4,
            ),
          ),
          SizedBox(height: size.height * 0.01),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Début",
                      style: textTheme.headline6,
                    ),
                    SizedBox(height: size.height * 0.008),
                    CustomSmallButton(
                      buttonSize: CustomSmallButtonSize.verySmall,
                      text: "26/08/2021 à 18h00",
                      press: () {},
                      prefixIcon: const Icon(
                        Icons.calendar_today,
                        color: Colors.black,
                        size: kSmallIconSize,
                      ),
                      borderColor: kPrimaryColor,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Fin",
                      style: textTheme.headline6,
                    ),
                    SizedBox(height: size.height * 0.008),
                    CustomSmallButton(
                      buttonSize: CustomSmallButtonSize.verySmall,
                      text: "26/08/2021 à 18h00",
                      press: () {},
                      prefixIcon: const Icon(
                        Icons.calendar_today,
                        color: Colors.black,
                        size: kSmallIconSize,
                      ),
                      borderColor: kPrimaryColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: size.height * 0.01),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dans 60 jours",
                      style: textTheme.headline6,
                    ),
                    SizedBox(height: size.height * 0.008),
                    CustomTextButton(
                      buttonSize: const CustomTextButtonSize.verySmall(),
                      text: "Programmer",
                      press: () {},
                      prefixIcon: const Icon(
                        Icons.calendar_today_rounded,
                        color: Colors.white,
                        size: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
