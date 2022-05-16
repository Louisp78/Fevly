import 'package:auto_size_text/auto_size_text.dart';
import 'package:fevly/screens/loading/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';

/// Body of [LoadingScreen]
class Body extends StatelessWidget {
  const Body();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    final ColorScheme themeColor = Theme.of(context).colorScheme;
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 3,
          ),
          SizedBox(
            width: size.width * 0.7,
            child: AutoSizeText.rich(
              TextSpan(text: 'F', children: [
                TextSpan(
                  text: 'evly',
                  style: textTheme.headline1!.copyWith(
                    letterSpacing: 3,
                    color: themeColor.onBackground,
                    fontWeight: FontWeight.bold,
                    fontSize: 300,
                  ),
                ),
              ]),
              maxLines: 1,
              textAlign: TextAlign.center,
              style: textTheme.headline1!
                  .copyWith(color: themeColor.primary, fontSize: 300),
            ),
          ),
          const Spacer(
            flex: 3,
          ),
          SizedBox(
            height: size.height * 0.07,
            width: size.height * 0.07,
            child: const RiveAnimation.asset(
              'assets/anim/loading.riv',
              animations: ['load'],
            ),
          ),
          const Spacer(
            flex: 3,
          ),
        ],
      ),
    );
  }
}
