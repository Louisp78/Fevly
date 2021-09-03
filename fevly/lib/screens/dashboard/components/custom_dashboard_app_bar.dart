import 'package:fevly/components/custom_circle_avatar.dart';
import 'package:fevly/components/level_label.dart';
import 'package:fevly/constant.dart';
import 'package:fevly/styles/colors.dart';
import 'package:fevly/styles/effects.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDashboardAppBar extends StatelessWidget {
  const CustomDashboardAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    final ThemeColor themeColor = initThemeColor(context: context);
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: kBasicHorizontalPadding(size: size), vertical: 10),
      height: 85,
      width: size.width,
      decoration: BoxDecoration(
        color: themeColor.kSurfaceColor,
        boxShadow: [kShadowBase],
      ),
      child: Row(
        children: [
          const CustomCircleAvatar(
            icon: Icon(
              Icons.person_rounded,
              color: kSecondaryColor,
            ),
          ),
          SizedBox(width: kBasicHorizontalPadding(size: size)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    "llouisp78",
                    style: textTheme.headline2,
                  ),
                  SizedBox(
                    width: size.width * 0.03,
                  ),
                  const LevelLabel(level: 13),
                ],
              ),
              SizedBox(
                height: size.height * 0.018,
              ),
              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    width: size.width * 0.32,
                    height: 5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: kTextColor),
                  ),
                  Container(
                    width: (size.width * 0.32) * 0.40,
                    height: 5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: kSecondaryColor),
                  ),
                ],
              )
            ],
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                  left: kBasicHorizontalPadding(size: size) * 2.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, '/profile/my_lists'),
                    child: Icon(
                      Icons.format_list_bulleted_rounded,
                      color: themeColor.kBaseOppositeColor,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Icon(Icons.notifications_rounded,
                        color: themeColor.kBaseOppositeColor),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
