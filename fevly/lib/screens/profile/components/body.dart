import 'package:fevly/constant.dart';

import 'package:fevly/models/user.dart';
import 'package:fevly/models/user_relation_state.dart';
import 'package:fevly/styles/colors.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'list_of_badges.dart';
import 'profile_card.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User profileOwner = User(
        email: "@",
        name: "Jean Eude",
        pseudo: "jeaneude",
        password: "heheheheheh",
        relationState: UserRelationState.unFriend);

    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    return SizedBox(
      width: size.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              bottom: 0,
              child: buildInfoProfile(profileOwner, textTheme, size)),
          Positioned(
            top: size.height * 0.06,
            left: size.width * 0.05,
            child: ProfileCard(
              level: 18,
              name: profileOwner.name,
              pseudo: profileOwner.pseudo,
              relationState: profileOwner.relationState,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInfoProfile(User profileOwner, TextTheme textTheme, Size size) {
    switch (profileOwner.relationState) {
      case UserRelationState.unFriend:
      case UserRelationState.requestSent:
        return Padding(
          padding: EdgeInsets.only(
            bottom: size.height * 0.3,
          ),
          child: Text(
              needToBeFriendMessage(
                username: profileOwner.pseudo,
              ),
              style: textTheme.headline5?.copyWith(color: kTextColor)),
        );
      default:
        return const ListOfBadges();
    }
  }
}
