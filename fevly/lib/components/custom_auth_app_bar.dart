import 'package:auto_size_text/auto_size_text.dart';
import 'package:fevly/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAuthAppBar extends StatelessWidget {
  const CustomAuthAppBar({
    Key? key,
    required this.title,
    required this.leading,
  }) : super(key: key);

  final String title;
  final Widget leading;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.17,
      child: Stack(
        alignment: Alignment.centerLeft,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: size.width * 0.1,
            child: leading,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: size.width * 0.5,
                child: AutoSizeText(
                  title,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: textTheme.headline2?.copyWith(color: kTextColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
