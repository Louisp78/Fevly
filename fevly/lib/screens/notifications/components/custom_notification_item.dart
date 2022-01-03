import 'package:fevly/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomNotificationItem extends StatelessWidget {
  const CustomNotificationItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.leadingIcon,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final DateTime date;
  final Widget leadingIcon;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    final ThemeColor themeColor = initThemeColor(context: context);
    return SizedBox(
      width: size.width * 0.9,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
        child: ListTile(
          title: Text(title, style: textTheme.headline4),
          subtitle: Text(subtitle,
              style:
                  textTheme.headline5?.copyWith(color: themeColor.kTextColor)),
          contentPadding: EdgeInsets.zero,
          leading: SizedBox(
            height: double.infinity,
            child: leadingIcon,
          ),
          trailing: Text(
              "depuis 3 j", //! add date & need to calculate time properly
              style:
                  textTheme.headline5?.copyWith(color: themeColor.kTextColor)),
        ),
      ),
    );
  }
}
