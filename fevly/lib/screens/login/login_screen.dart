import 'package:fevly/screens/login/components/body.dart';
import 'package:fevly/styles/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import 'components/custom_icon_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    return Scaffold(
      appBar: buildAppBar(textTheme),
      body: Body(),
    );
  }

  AppBar buildAppBar(TextTheme textTheme) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: CustomIconButton(
        size: const CustomIconButtonSize.small(),
        press: () {},
        outline: true,
        circle: false,
        icon: Icons.arrow_back_ios,
      ),
      title: Text(
        "Connexion",
        style: textTheme.headline2?.copyWith(color: kTextColor),
      ),
    );
  }
}
