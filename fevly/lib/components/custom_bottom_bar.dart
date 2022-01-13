import 'package:fevly/components/custom_icon_button.dart';
import 'package:fevly/functions/build_app_bar_for_search_screen.dart';
import 'package:fevly/models/user.dart';
import 'package:fevly/screens/search/search_screen.dart';
import 'package:fevly/styles/colors.dart';
import 'package:fevly/styles/effects.dart';
import 'package:fevly/test_data/data_example.dart';
import 'package:fevly/test_data/data_guest_list.dart';
import 'package:fevly/test_data/data_list_of_user.dart';
import 'package:flutter/material.dart';


class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ColorScheme themeColor = Theme.of(context).colorScheme;
    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: themeColor.surface,
          boxShadow: [kShadowBottomBar]),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: () => Navigator.pushNamed(context, '/dashboard'),
            icon: Icon(
              Icons.home_rounded,
              color: themeColor.onBackground,
            ),
          ),
          IconButton(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onPressed: () =>
                            Navigator.pushNamed(context, '/search', arguments: {
                          'guestList': guestListList[0],
                          'appBar': buildAppBarForSearchScreen(
                              guestListList[0], context),
                          'suggestionList1Name': "Récent",
                          'suggestionList2Name': "Mes amis",
                          'userSuggestionList1': listOfUsers1,
                          'userSuggestionList2': listOfFriends1,
                          'type': SearchScreenType.changeRelationState,
                        }),
              icon: Icon(Icons.search_rounded,
                  color: themeColor.onBackground)),
          CustomIconButton(
            press: () {},
            icon: Icons.add_rounded,
            circle: false,
            iconColor: themeColor.background,
            backgroundColor: themeColor.primary,
          ),
          IconButton(
              onPressed: () => Navigator.pushNamed(context, '/notifications'),
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              icon: Icon(
                Icons.notifications_rounded,
                color: themeColor.onBackground,
              ),
              ),
          IconButton(
              onPressed: () => Navigator.pushNamed(context, '/profile', arguments: kCurrentUser),
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              icon: Icon(
                Icons.person_rounded,
                color: themeColor.onBackground,
              )),
        ],
      ),
    );
  }
}
