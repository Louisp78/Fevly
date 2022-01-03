import 'package:auto_size_text/auto_size_text.dart';
import 'package:fevly/components/custom_circle_avatar.dart';
import 'package:fevly/components/custom_text_button.dart';
import 'package:fevly/constant.dart';
import 'package:fevly/functions/build_app_bar_for_search_screen.dart';
import 'package:fevly/models/party.dart';
import 'package:fevly/screens/dashboard/dashboard_parties/components/info_item.dart';
import 'package:fevly/screens/search/search_screen.dart';
import 'package:fevly/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomInvite extends StatelessWidget {
  const CustomInvite({
    Key? key,
    required this.partyInvited,
  }) : super(key: key);

  final Party partyInvited;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    return Stack(
      children: [
        Container(
          width: size.width * 0.85,
          height: 200,
          padding: EdgeInsets.symmetric(vertical: size.width * 0.08),
          decoration: BoxDecoration(
              color: kPrimaryColor, borderRadius: BorderRadius.circular(24)),
          child: Row(
            children: [
              const Spacer(),
              SizedBox(
                width: (size.width * 0.85) * 0.57 - size.width * 0.08,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      partyInvited.name,
                      maxLines: 1,
                      style: textTheme.headline2?.copyWith(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AutoSizeText(
                      partyInvited.description,
                      style: textTheme.bodyText2?.copyWith(color: Colors.white),
                    ),
                    const Spacer(),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: CustomTextButton(
                        press: () =>
                            Navigator.pushNamed(context, '/search', arguments: {
                          'guestList': partyInvited.guests,
                          'appBar': buildAppBarForSearchScreen(
                              partyInvited.guests, context),
                          'suggestionList1Name': "Dans la liste",
                          'suggestionList2Name': null,
                          'userSuggestionList1': partyInvited.guests.listOfUser,
                          'userSuggestionList2': null,
                          'type': SearchScreenType.addToAList,
                        }),
                        textWidget: Text(
                          "Voir liste des invités",
                          style: textTheme.bodyText2?.copyWith(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        buttonSize: const CustomTextButtonSize.verySmall(),
                        border: Border.all(color: Colors.white, width: 2),
                        suffixIcon: const Icon(Icons.arrow_forward_rounded,
                            color: Colors.white, size: kSmallIconSize),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: size.width * 0.05,
              ),
              Container(
                height: 200,
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InfoItem(
                      leading: const CustomCircleAvatar(
                        radius: 11,
                      ),
                      text: partyInvited.listOfOrganizer[0].pseudo,
                      lightMode: false,
                    ),
                    InfoItem(
                      leading: const Icon(Icons.location_on_rounded,
                          color: Colors.white),
                      text: partyInvited.location,
                      lightMode: false,
                    ),
                    InfoItem(
                      leading:
                          const Icon(Icons.event_rounded, color: Colors.white),
                      text: partyInvited.startDateFormat(),
                      lightMode: false,
                    ),
                    InfoItem(
                      leading:
                          const Icon(Icons.group_rounded, color: Colors.white),
                      text: "${partyInvited.guestsLength} invités",
                      lightMode: false,
                    ),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}
