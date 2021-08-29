import 'package:fevly/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelLabel extends StatelessWidget {
  const LevelLabel({
    Key? key,
    required this.level,
  }) : super(key: key);

  final int level;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    return Container(
      height: 18,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kSecondaryColor,
      ),
      child: Text(
        "Nv. $level",
        style: textTheme.headline5?.copyWith(color: Colors.white),
      ),
    );
  }
}
