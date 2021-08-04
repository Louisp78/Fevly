import 'package:fevly/components/custom_small_button.dart';
import 'package:fevly/components/custom_text_button.dart';
import 'package:fevly/styles/colors.dart';
import 'package:fevly/styles/effects.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';

class DateInformations extends StatelessWidget {
  const DateInformations({
    Key? key,
    required this.size,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: kSurfaceLightColor, boxShadow: [kShadowBase],
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
                    const SizedBox(height: 5),
                    CustomSmallButton(
                      size: CustomSmallButtonSize.verySmall,
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
                    const SizedBox(height: 5),
                    CustomSmallButton(
                      size: CustomSmallButtonSize.verySmall,
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
                  const SizedBox(height: 5),
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