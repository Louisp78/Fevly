import 'package:auto_size_text/auto_size_text.dart';
import 'package:fevly/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Custom lite app bar used in [SettingsScreen]
class CustomLiteAppBar extends StatelessWidget {
  const CustomLiteAppBar({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ColorScheme themeColor = Theme.of(context).colorScheme;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    return SizedBox(
      height: 120,
      child: Stack(children: [
        Align(
          child: SizedBox(
            width: size.width * 0.5,
            child: AutoSizeText(
              title,
              maxLines: 1,
              textAlign: TextAlign.center,
              style:
                  textTheme.headline2?.copyWith(color: themeColor.onBackground),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: kBasicHorizontalPadding(size: size)),
            child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.close_rounded)),
          ),
        )
      ]),
    );
  }
}
