import 'package:fevly/components/custom_small_button.dart';
import 'package:fevly/components/custom_text_button.dart';
import 'package:fevly/styles/colors.dart';
import 'package:fevly/styles/effects.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fevly/constant.dart';
import 'package:intl/intl.dart';

class DateInformations extends StatelessWidget {
  final DateTime begin;
  final DateTime end;
  const DateInformations({
    Key? key, 
    required this.begin,
    required this.end,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    final ColorScheme themeColor = Theme.of(context).colorScheme;
    final beginDateStr = DateFormat('dd/MM/yyyy').format(begin);
    final beginHoursStr = DateFormat('kk:mm').format(begin);
    final endDateStr = DateFormat('dd/MM/yyyy').format(end);
    final endHoursStr = DateFormat('kk:mm').format(end);
    return Container(
      height: 150,
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: themeColor.onSurface,
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
                      text: "$beginDateStr à $beginHoursStr",
                      press: () {},
                      prefixIcon: Icon(
                        Icons.calendar_today,
                        color: themeColor.onBackground,
                        size: kSmallIconSize,
                      ),
                      borderColor: themeColor.primary,
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
                      text:"$endDateStr à $endHoursStr",
                      press: () {},
                      prefixIcon: Icon(
                        Icons.calendar_today,
                        color: themeColor.onBackground,
                        size: kSmallIconSize,
                      ),
                      borderColor: themeColor.primary,
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
                      "Dans ${DateTime.now().difference(begin).inDays} jours",
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
