import 'package:fevly/components/custom_circle_avatar.dart';
import 'package:fevly/components/custom_dialog_list.dart';
import 'package:fevly/components/custom_small_button.dart';
import 'package:fevly/components/level_label.dart';
import 'package:fevly/constant.dart';
import 'package:fevly/functions/change_relation_state.dart';
import 'package:fevly/models/user.dart';
import 'package:fevly/screens/profile/components/counter_item.dart';
import 'package:fevly/styles/colors.dart';
import 'package:fevly/styles/effects.dart';
import 'package:fevly/styles/theme.dart';
import 'package:fevly/test_data/data_party.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
    required this.profileOwner,
  }) : super(key: key);

  final User profileOwner;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    final ColorScheme themeColor = Theme.of(context).colorScheme;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.05, vertical: size.height * 0.02),
      height: size.height * 0.32,
      width: size.width * 0.9,
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        boxShadow: [kShadowProfileCard],
        borderRadius: BorderRadius.circular(28),
        gradient: const SweepGradient(
          colors: [kPrimaryColor, kDarkPrimaryColor],
          center: FractionalOffset.topLeft,
          endAngle: 1.1,
          stops: [0.5, 0.5],
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomCircleAvatar(press: (){},),
              const SizedBox(
                width: 15.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        profileOwner.pseudo,
                        style:
                            textTheme.headline2?.copyWith(color: Colors.white),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      /*LevelLabel(
                        level: profileOwner.level,
                      ),*/
                    ],
                  ),
                  Text(
                    profileOwner.name,
                    style: textTheme.headline5?.copyWith(color: Colors.white),
                  ),
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (context) =>
                        buildDialog(textTheme: textTheme, context: context),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: const Icon(
                    Icons.more_vert_rounded,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(
            flex: 3,
          ),

          if(profileOwner.relationState != UserRelationState.me) 
            CustomSmallButton(
            buttonSize: CustomSmallButtonSize.small,
            text: profileOwner.relationState.name,
            press: changeRelationState(
                    themeColor: themeColor,
                    user: profileOwner,
                    context: context,
                  ),
            prefixIcon: Icon(
              profileOwner.relationState.iconData,
              color: Colors.white,
              size: kSmallIconSize,
            ),
            ),
          const Spacer(
            flex: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CounterItem(
                title: "Soirées",
                count: profileOwner.partyCounter,
              ),
              CounterItem(
                title: "Amis",
                count: profileOwner.listOfFriends.length,
              ),
              CounterItem(
                title: "Badges",
                count: profileOwner.listOfBadges.length,
              ),
            ],
          ),
        ],
      ),
    );
  }

  CustomDialogList buildDialog(
      {required TextTheme textTheme, required BuildContext context}) {
    final ColorScheme themeColor = Theme.of(context).colorScheme;
    return CustomDialogList(title: "Options", listOptions: [
      ...List.generate(
        listParties1.length,
        (index) => TextButton(
          onPressed: () {},
          child: RichText(
              text: TextSpan(children: [
            TextSpan(
              text: "Inviter à ",
              style: textTheme.headline5
                  ?.copyWith(color: themeColor.onBackground),
            ),
            TextSpan(
              text: "${listParties1[index].name}.",
              style: textTheme.headline5
                  ?.copyWith(color: themeColor.primary),
            ),
          ])),
        ),
      ),
      TextButton(
        onPressed: () {},
        child: Text(
          "Bloquer",
          style: textTheme.headline5?.copyWith(color: kErrorColor),
        ),
      ),
    ]);
  }
}
