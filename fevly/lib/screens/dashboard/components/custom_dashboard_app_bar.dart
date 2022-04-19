import 'package:fevly/components/custom_circle_avatar.dart';
import 'package:fevly/constant.dart';
import 'package:fevly/styles/colors.dart';
import 'package:fevly/styles/effects.dart';
import 'package:fevly/test_data/data_example.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDashboardAppBar extends StatelessWidget {
  final double height;
  const CustomDashboardAppBar({Key? key, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    final ColorScheme themeColor = Theme.of(context).colorScheme;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: kBasicHorizontalPadding(size: size), vertical: 10),
      height: height,
      width: size.width,
      decoration: BoxDecoration(
        color: themeColor.surface,
        boxShadow: [kShadowBase],
      ),
      child: Row(
        children: [
          CustomCircleAvatar(
            press: () => Navigator.pushNamed(context, '/profile',
                arguments: kCurrentUser),
            icon: Icon(
              Icons.person_rounded,
              color: themeColor.primary,
            ),
            backgroundColor: themeColor.onSurface,
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
                  /*const LevelLabel(level: 13),*/
                ],
              ),
              Text('Louis Place',
                  style: textTheme.bodyText2?.copyWith(color: kTextColor)),
              /*Stack(
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
              )*/
            ],
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                  left: kBasicHorizontalPadding(size: size) * 2.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /*InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, '/profile/my_lists'),
                    child: Icon(
                      Icons.format_list_bulleted_rounded,
                      color: themeColor.kBaseOppositeColor,
                    ),
                  ),*/
                  const Spacer(),
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, '/notifications'),
                    child: Icon(Icons.notifications_rounded,
                        color: themeColor.onBackground),
                  ),
                  SizedBox(
                    width: kBasicHorizontalPadding(size: size),
                  ),
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, '/settings'),
                    child: Icon(
                      Icons.settings_rounded,
                      color: themeColor.onBackground,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
