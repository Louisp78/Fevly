import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoItem extends StatelessWidget {
  const InfoItem({
    Key? key,
    required this.leading,
    required this.text,
    this.lightMode = true,
  }) : super(key: key);

  final Widget leading;
  final String text;
  final bool lightMode;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    return Row(
      children: [
        leading,
        SizedBox(
          width: size.width * 0.02,
        ),
        Text(
          text,
          style: textTheme.bodyText2?.copyWith(
              fontWeight: FontWeight.bold,
              color: lightMode ? null : Colors.white),
        ),
      ],
    );
  }
}
