import 'package:auto_size_text/auto_size_text.dart';
import 'package:fevly/components/custom_circle_avatar.dart';
import 'package:fevly/components/custom_icon_button.dart';
import 'package:fevly/components/custom_text_button.dart';
import 'package:fevly/constant/constant.dart';
import 'package:fevly/models/party.dart';
import 'package:fevly/screens/dashboard/dashboard_parties/components/info_item.dart';
import 'package:fevly/styles/colors.dart';
import 'package:fevly/styles/effects.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomPartyItem extends StatelessWidget {
  const CustomPartyItem({
    Key? key,
    required this.party,
  }) : super(key: key);

  final Party party;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    final ColorScheme themeColor = Theme.of(context).colorScheme;
    return InkWell(
      onTap: () => Navigator.pushNamed(context, '/party', arguments: party),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            height: 200,
            width: size.width,
            margin: EdgeInsets.only(
                bottom: kBasicVerticalPadding(size: size) * 2,
                left: kBasicHorizontalPadding(size: size),
                right: kBasicHorizontalPadding(size: size)),
            decoration: BoxDecoration(
              color: themeColor.onSurface,
              boxShadow: [kShadowBase],
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              children: [
                Container(
                  width: (size.width * 0.9) * 0.57,
                  padding: EdgeInsets.all(size.width * 0.08),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(party.name,
                          maxLines: 1, style: textTheme.headline3),
                      const SizedBox(
                        height: 10,
                      ),
                      AutoSizeText(
                        party.description,
                        style: textTheme.bodyText2,
                      ),
                      const Spacer(),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: CustomIconButton(
                          press: () {},
                          size: const CustomIconButtonSize.small(),
                          icon: Icons.arrow_forward_rounded,
                          iconColor: themeColor.onBackground,
                          backgroundColor: themeColor.background,
                          outline: true,
                          circle: false,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: (size.width * 0.9) * 0.43,
                  height: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: themeColor.surface,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextButton(
                        press: () {},
                        text: "Dans ${party.numberOfDaysLeft()}j",
                        buttonSize: const CustomTextButtonSize.verySmall(),
                        backgroundColor: themeColor.primary,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        height: 100,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InfoItem(
                                leading: CustomCircleAvatar(
                                  radius: 11,
                                  backgroundColor: Colors.black,
                                  press: () {},
                                ),
                                text: party.listOfOrganizer[0].pseudo,
                              ),
                              InfoItem(
                                leading: Icon(
                                  Icons.event_rounded,
                                  color: themeColor.onBackground,
                                ),
                                text: party.startDateFormat(),
                              ),
                              InfoItem(
                                leading: Icon(
                                  Icons.group_rounded,
                                  color: themeColor.onBackground,
                                ),
                                text: "${party.guestsLength} invités",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              right: size.width * 0.03,
              child: buildNotificationCounter(size, textTheme, context))
        ],
      ),
    );
  }

  Container buildNotificationCounter(
      Size size, TextTheme textTheme, BuildContext context) {
    final ColorScheme themeColor = Theme.of(context).colorScheme;
    return Container(
      width: size.width * 0.07,
      height: size.width * 0.07,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: themeColor.secondary,
      ),
      child: Text(
        "5",
        style: textTheme.bodyText2?.copyWith(
            fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
