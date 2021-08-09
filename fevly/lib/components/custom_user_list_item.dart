import 'package:fevly/constant.dart';
import 'package:fevly/models/user.dart';
import 'package:fevly/styles/colors.dart';
import 'package:fevly/styles/effects.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_circle_avatar.dart';
import 'custom_small_button.dart';
import 'custom_text_button.dart';

class CustomUserListItem extends StatelessWidget {
  const CustomUserListItem({
    Key? key,
    required this.currentList,
    required this.index,
  }) : super(key: key);

  final List<User> currentList;
  final int index;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    final Size size = MediaQuery.of(context).size;
    final User currentUser = currentList[index];
    final UserRelationState relationState = currentUser.relationState;
    return Container(
      padding: EdgeInsets.all(size.width * 0.03),
      margin: EdgeInsets.only(bottom: kBasicVerticalPadding(size: size)),
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: kSurfaceLightColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [kShadowBase],
      ),
      child: Row(
        children: [
          const CustomCircleAvatar(),
          SizedBox(
            width: kBasicHorizontalPadding(size: size),
          ),
          Text(
            currentUser.pseudo,
            style: textTheme.headline3,
          ),
          const Spacer(),
          if (currentUser.relationState != UserRelationState.friend)
            CustomTextButton(
              buttonSize: const CustomTextButtonSize.small(),
              text: relationState.name,
              press: relationState == UserRelationState.unFriend
                  ? () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: kSurfaceColor,
                          content: Text(
                            kSnackBarSendFrienRequest(
                                userPseudo: currentUser.pseudo),
                            style: textTheme.headline4
                                ?.copyWith(color: kPrimaryColor),
                          ),
                        ),
                      );
                      currentList[index].relationState =
                          UserRelationState.requestSent;
                    }
                  : () {},
              backgroundColor: kSurfaceColor,
              textColor: kPrimaryColor,
              suffixIcon: Icon(currentUser.relationState.iconData,
                  color: kPrimaryColor, size: kSmallIconSize),
            ),
          if (currentUser.relationState == UserRelationState.friend)
            CustomSmallButton(
              text: relationState.name,
              press: () {},
              buttonSize: CustomSmallButtonSize.small,
              borderColor: kPrimaryColor,
              suffixIcon: Icon(
                currentUser.relationState.iconData,
                color: kPrimaryColor,
                size: kSmallIconSize,
              ),
            )
        ],
      ),
    );
  }
}
