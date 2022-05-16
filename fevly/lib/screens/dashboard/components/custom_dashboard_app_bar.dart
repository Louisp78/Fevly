import 'package:auto_size_text/auto_size_text.dart';
import 'package:fevly/components/custom_circle_avatar.dart';
import 'package:fevly/constant/constant.dart';
import 'package:fevly/service/application_state.dart';
import 'package:fevly/styles/colors.dart';
import 'package:fevly/styles/effects.dart';
import 'package:fevly/test_data/data_example.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomDashboardAppBar extends StatelessWidget {
  const CustomDashboardAppBar();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    final ColorScheme themeColor = Theme.of(context).colorScheme;

    /// user is not null
    final appState = Provider.of<ApplicationState>(context);
    final user = appState.userLastInstance;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: kBasicHorizontalPadding(size: size), vertical: 10),
      height: 70,
      width: size.width,
      decoration: BoxDecoration(
        color: themeColor.surface,
        boxShadow: [kShadowBase],
      ),
      child: Row(
        children: [
          if (user?.photoURL != null)
            CircleAvatar(
              backgroundImage: NetworkImage(user!.photoURL!),
            ),
          if (user?.photoURL == null)
            CustomCircleAvatar(
              press: () => Navigator.pushNamed(context, '/profile',
                  arguments: kCurrentUser),
              icon: Icon(
                Icons.person_rounded,
                color: themeColor.primary,
              ),
              backgroundColor: themeColor.onSurface,
            ),
          SizedBox(width: kBasicHorizontalPadding(size: size)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: AutoSizeText(
                    '@${appState.userInfos?.pseudo}',
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.headline2,
                  ),
                ),
                const SizedBox(height: 5),
                Text(user?.displayName ?? '',
                    style: textTheme.bodyText2?.copyWith(color: kTextColor)),
              ],
            ),
          ),
          Row(
            children: [
              /*InkWell(
                  onTap: () =>
                      Navigator.pushNamed(context, '/profile/my_lists'),
                  child: Icon(
                    Icons.format_list_bulleted_rounded,
                    color: themeColor.kBaseOppositeColor,
                  ),
                ),*/
              InkWell(
                onTap: () => Navigator.pushNamed(context, '/notifications'),
                child: Icon(Icons.notifications_rounded,
                    color: themeColor.onBackground),
              ),
              SizedBox(
                width: kBasicHorizontalPadding(size: size),
              ),
              InkWell(
                onTap: () => Navigator.pushNamed(context, '/settings'),
                child: Icon(
                  Icons.settings_rounded,
                  color: themeColor.onBackground,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
