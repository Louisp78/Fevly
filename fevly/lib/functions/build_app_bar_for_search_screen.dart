import 'package:fevly/screens/search/components/user_search_bar.dart';
import 'package:fevly/styles/effects.dart';
import 'package:flutter/material.dart';

//$ METHOD
//$ =================================
Widget buildAppBarForSearchScreen({
  required UserSearchBar searchBar,
  required double heightAppBar
}) {
  return Builder(builder: (BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ColorScheme themeColor = Theme.of(context).colorScheme;
    return Container(
      width: size.width,
      height: heightAppBar,
      alignment: Alignment.bottomCenter,
      decoration:
          BoxDecoration(color: themeColor.onSurface, boxShadow: [kShadowBase]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Spacer(flex: 2,),
          searchBar,
          Spacer(flex: 1,),
          TabBar( 
            indicatorColor: themeColor.primary,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 3,
            tabs: [
              Icon(
                Icons.people_alt_rounded,
                color: themeColor.onBackground,
              ),
              Icon(
                Icons.add_a_photo,
                color: themeColor.onBackground,)
            ],
          ),
        ],
      ),
    );
  });
}
