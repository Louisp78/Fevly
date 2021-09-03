import 'package:fevly/constant.dart';
import 'package:fevly/models/badge.dart';
import 'package:fevly/view_models/text_field_model_view.dart';
import 'package:fevly/models/user.dart';
import 'package:fevly/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'list_of_badges.dart';
import 'profile_card.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.profileOwner}) : super(key: key);

  final User profileOwner;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    return SizedBox(
      width: size.width,
      child: ChangeNotifierProvider(
        create: (context) => TextFieldModelView(
            listOfObjects: List<Badge>.generate(
                profileOwner.listOfBadges.length,
                (index) => profileOwner.listOfBadges[index])),
        child: Consumer<TextFieldModelView>(
          builder: (context, searchField, child) => Stack(
            alignment: Alignment.center,
            children: [
              if (searchField.selection)
                Positioned(
                    top: size.height * 0.06,
                    child: buildInfoProfile(
                        profileOwner: profileOwner,
                        textTheme: textTheme,
                        size: size,
                        searchField: searchField,
                        context: context)),
              if (!searchField.selection)
                Positioned(
                    bottom: 0,
                    child: buildInfoProfile(
                        profileOwner: profileOwner,
                        textTheme: textTheme,
                        size: size,
                        searchField: searchField,
                        context: context)),
              if (!searchField.selection)
                Positioned(
                  top: size.height * 0.06,
                  left: size.width * 0.05,
                  child: ProfileCard(profileOwner: profileOwner),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoProfile(
      {required User profileOwner,
      required TextTheme textTheme,
      required Size size,
      required TextFieldModelView searchField,
      required BuildContext context}) {
    final ThemeColor themeColor = initThemeColor(context: context);
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
              style:
                  textTheme.headline5?.copyWith(color: themeColor.kTextColor)),
        );
      default:
        return ListOfBadges(
          searchField: searchField,
          defaultListOfBadge: profileOwner.listOfBadges,
        );
    }
  }
}
