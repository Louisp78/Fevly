import 'package:fevly/styles/colors.dart';
import 'package:fevly/styles/effects.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListTileItem extends StatelessWidget {
  const ListTileItem({
    Key? key,
    required this.title,
    required this.subtitle,
    this.leading,
    this.margin,
  }) : super(key: key);

  final String title, subtitle;
  final EdgeInsets? margin;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(size.width * 0.03),
        margin: margin != null ? margin! : null,
        width: size.width * 0.9,
        decoration: BoxDecoration(
          color: kSurfaceLightColor,
          boxShadow: [kShadowBase],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            leading ?? leading!,
            SizedBox(
              width: size.width * 0.08,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: textTheme.headline4,
                ),
                Text(
                  subtitle,
                  style: textTheme.headline5?.copyWith(color: kTextColor),
                )
              ],
            ),
            const Spacer(),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward_rounded)),
          ],
        ),
      ),
    );
  }
}
