import 'package:fevly/components/custom_basic_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    return Stack(
      children: [
        CustomBasicAppBar(
          title: "Recherche",
          subtitleIcon: const Icon(Icons.group_rounded),
          press: () {},
        )
      ],
    );
  }
}
