import 'package:auto_size_text/auto_size_text.dart';
import 'package:fevly/components/custom_small_button.dart';
import 'package:fevly/constant.dart';
import 'package:fevly/models/badge.dart';
import 'package:fevly/styles/colors.dart';
import 'package:fevly/styles/effects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.listOfBadgeToVote}) : super(key: key);

  final List<Badge> listOfBadgeToVote;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    final ColorScheme themeColor = Theme.of(context).colorScheme;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Center(
          child: Container(
            height: size.height * 0.75,
            width: size.width * 0.85,
            decoration: BoxDecoration(
              color: themeColor.onSurface,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [kShadowBase],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: kBasicVerticalPadding(size: size),
                ),
                Center(
                  child: SvgPicture.asset(
                    listOfBadgeToVote[2].image,
                    width: size.width * 0.62,
                  ),
                ),
                SizedBox(
                  height: kBasicVerticalPadding(size: size) * 3,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: kBasicHorizontalPadding(size: size) * 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomSmallButton(
                            text: "Cuisine",
                            press: () {},
                            buttonSize: CustomSmallButtonSize.small,
                            borderColor: themeColor.primary,
                          ),
                          Container(
                            height: 24,
                            width: size.width * 0.27,
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.03),
                            margin: EdgeInsets.only(
                                right: kBasicHorizontalPadding(size: size) * 2),
                            decoration: BoxDecoration(
                                color: themeColor.background,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [kShadowBase]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/star_checked.svg",
                                  color: themeColor.primary,
                                ),
                                SvgPicture.asset(
                                  "assets/icons/star_checked.svg",
                                  color: themeColor.primary,
                                ),
                                SvgPicture.asset(
                                  "assets/icons/star_checked.svg",
                                  color: themeColor.primary,
                                ),
                                SvgPicture.asset(
                                  "assets/icons/star_not_checked.svg",
                                  color: themeColor.onBackground,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: kBasicVerticalPadding(size: size) * 4,
                      ),
                      SizedBox(
                          width: size.width * 0.7,
                          child: AutoSizeText(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut lacus est tellus dui sagittis, ullamcorper. Netus volutpat id ipsum tincidunt maecenas volutpat.",
                            style: textTheme.bodyText1,
                            maxLines: 4,
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
            left: size.width * 0.07,
            top: kBasicVerticalPadding(size: size),
            child: Icon(Icons.logout_rounded,
                color: themeColor.onBackground)),
        Positioned(
          top: kBasicVerticalPadding(size: size),
          child: Text("Vote dans 10:52",
              style:
                  textTheme.headline4?.copyWith(color: kTextColor)),
        ),
      ],
    );
  }
}
