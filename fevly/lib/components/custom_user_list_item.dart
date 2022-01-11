import 'package:fevly/components/custom_circle_avatar.dart';
import 'package:fevly/components/custom_text_button.dart';
import 'package:fevly/constant.dart';
import 'package:fevly/functions/change_relation_state.dart';
import 'package:fevly/models/user.dart';
import 'package:fevly/screens/search/search_screen.dart';
import 'package:fevly/styles/colors.dart';
import 'package:fevly/styles/effects.dart';
import 'package:fevly/view_models/list_user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomUserListItem extends StatelessWidget {
  const CustomUserListItem({
    required this.currentList,
    required this.index,
    required this.press,
    required this.user,
    this.type = SearchScreenType.changeRelationState,
    this.listOfUserViewModel,
  }) : assert(
            (type == SearchScreenType.changeRelationState &&
                    listOfUserViewModel != null) ||
                (type == SearchScreenType.addToAList &&
                    listOfUserViewModel != null),
            "Need to define guestList or not.");

  final User user;
  final List<User> currentList;
  final int index;
  final GestureTapCallback press;
  final SearchScreenType type;
  final ListUserViewModel? listOfUserViewModel;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    final Size size = MediaQuery.of(context).size;
    final ThemeColor themeColor = initThemeColor(context: context);
    return InkWell(
      onTap: press,
      child: Container(
        padding: EdgeInsets.all(size.width * 0.03),
        margin: EdgeInsets.only(bottom: kBasicVerticalPadding(size: size)),
        width: size.width * 0.9,
        decoration: BoxDecoration(
          color: themeColor.kSurfaceLightColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [kShadowBase],
        ),
        child: Row(
          children: [
            CustomCircleAvatar(press: () {},),
            SizedBox(
              width: kBasicHorizontalPadding(size: size),
            ),
            Text(
              user.pseudo,
              style: textTheme.headline3,
            ),
            const Spacer(),
            if (type == SearchScreenType.changeRelationState)
              CustomTextButton(
                buttonSize: const CustomTextButtonSize.small(),
                text: user.relationState.name,
                backgroundColor: themeColor.kSurfaceColor,
                textColor: user.relationState != UserRelationState.friend
                    ? themeColor.kPrimaryColor
                    : themeColor.kBaseOppositeColor,
                suffixIcon: Icon(user.relationState.iconData,
                    color: themeColor.kPrimaryColor, size: kSmallIconSize),
                border: user.relationState == UserRelationState.friend
                    ? Border.all(
                        width: 4,
                        color: themeColor.kPrimaryColor,
                      )
                    : null,
                press: changeRelationState(
                    user: user,
                    context: context,
                    themeColor: themeColor,
                    list: currentList,
                    index: index),
              ),
            if (type == SearchScreenType.addToAList)
              IconButton(
                  onPressed: () {
                    if (listOfUserViewModel!.list
                        .any((element) => element.pseudo == user.pseudo)) {
                      listOfUserViewModel!.removeFromList(user);
                    } else {
                      listOfUserViewModel!.addToList(user);
                    }
                  },
                  icon: listOfUserViewModel!.list
                          .any((element) => element.pseudo == user.pseudo)
                      ? Icon(Icons.how_to_reg_rounded,
                          color: themeColor.kSecondaryColor)
                      : Icon(
                          Icons.person_add_rounded,
                          color: themeColor.kBaseOppositeColor,
                        ))
          ],
        ),
      ),
    );
  }
}
