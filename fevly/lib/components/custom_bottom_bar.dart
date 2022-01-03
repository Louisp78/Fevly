import 'package:fevly/components/custom_icon_button.dart';
import 'package:fevly/styles/colors.dart';
import 'package:fevly/styles/effects.dart';
import 'package:flutter/material.dart';


class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeColor themeColor = initThemeColor(context: context);
    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: themeColor.kSurfaceColor,
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
              color: themeColor.kBaseOppositeColor,
            ),
          ),
          IconButton(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onPressed: () {},
              icon: Icon(Icons.search_rounded,
                  color: themeColor.kBaseOppositeColor)),
          CustomIconButton(
            press: () {},
            icon: Icons.add_rounded,
            circle: false,
            iconColor: themeColor.kBaseColor,
          ),
          IconButton(
              onPressed: () {},
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              icon: Icon(
                Icons.notifications_rounded,
                color: themeColor.kBaseOppositeColor,
              )),
          IconButton(
              onPressed: () {},
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              icon: Icon(
                Icons.person_rounded,
                color: themeColor.kBaseOppositeColor,
              )),
        ],
      ),
    );
  }
}
