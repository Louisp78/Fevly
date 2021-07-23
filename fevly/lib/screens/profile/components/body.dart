import 'package:fevly/constant.dart';
import 'package:fevly/models/user.dart';
import 'package:fevly/models/user_relation_state.dart';
import 'package:fevly/styles/colors.dart';
import 'package:fevly/styles/effects.dart';
import 'package:fevly/test/data_example.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

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
        relationState: UserRelationState.requestSent);

    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    return SizedBox(
      width: size.width,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.06),
            child: ProfileCard(
              level: 18,
              name: profileOwner.name,
              pseudo: profileOwner.pseudo,
              relationState: profileOwner.relationState,
            ),
          ),
          //buildInfoProfile(profileOwner, textTheme),
          Container(
            height: size.height * 0.5,
            width: size.width * 0.9,
            child: GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: size.width * 0.03,
              children: List.generate(
                badgeList1.length,
                (index) => Container(
                  height: 94,
                  width: 94,
                  decoration: BoxDecoration(
                    color: kSurfaceLightColor,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [kShadowBase],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        badgeList1[index].image,
                        width: 42,
                        height: 42,
                        fit: BoxFit.scaleDown,
                      ),
                      Text(
                        badgeList1[index].name,
                        style: textTheme.headline6,
                      )
                    ],
                  ),
                ),
              ),
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
            top: size.height * 0.15,
          ),
          child: Text(
              needToBeFriendMessage(
                username: profileOwner.pseudo,
              ),
              style: textTheme.headline5?.copyWith(color: kTextColor)),
        );
      default:
        return Container();
    }
  }
}
