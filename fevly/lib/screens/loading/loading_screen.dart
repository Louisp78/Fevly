import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    final ColorScheme themeColor = Theme.of(context).colorScheme;
    final Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(
          flex: 3,
        ),
        AutoSizeText.rich(
          TextSpan(text: 'F', children: [
            TextSpan(
              text: 'evly',
              style: textTheme.headline1!.copyWith(
                fontSize: 75,
                letterSpacing: 3,
                color: themeColor.onBackground,
                fontWeight: FontWeight.bold,
              ),
            ),
          ]),
          style: textTheme.headline1!
              .copyWith(color: themeColor.primary, fontSize: 85),
        ),
        const Spacer(),
        SizedBox(
          height: size.height * 0.06,
          width: size.height * 0.06,
          child: const RiveAnimation.asset(
            'assets/anim/loading.riv',
            animations: ['load'],
          ),
        ),
        const Spacer(
          flex: 3,
        ),
      ],
    );
  }
}
