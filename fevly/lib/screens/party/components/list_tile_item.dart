import 'package:fevly/styles/colors.dart';
import 'package:fevly/styles/effects.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListTileItem extends StatelessWidget {
  const ListTileItem({
    Key? key,
    required this.title,
    this.leading,
    this.margin,
    required this.press,
    required this.subtitle,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final EdgeInsets? margin;
  final Widget? leading;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    final ThemeColor themeColor = initThemeColor();
    print(ThemeMode.system == ThemeMode.light ? "light" : "dark");
    print(themeColor.kSurfaceLightColor.toString());
    return InkWell(
      onTap: press,
      child: Container(
        padding: EdgeInsets.all(size.width * 0.03),
        margin: margin != null ? margin! : null,
        width: size.width * 0.9,
        decoration: BoxDecoration(
          color: themeColor.kSurfaceLightColor,
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
                  style: textTheme.headline5
                      ?.copyWith(color: themeColor.kTextColor),
                )
              ],
            ),
            const Spacer(),
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.check_circle_outline_rounded,
                      color: themeColor.kPrimaryColor,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.delete_forever_rounded,
                      color: themeColor.kSecondaryColor,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
