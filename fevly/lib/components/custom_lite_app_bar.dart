import 'package:auto_size_text/auto_size_text.dart';
import 'package:fevly/service/application_state.dart';
import 'package:fevly/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomLiteAppBar extends StatelessWidget {
  const CustomLiteAppBar({
    Key? key,
    required this.title,
    required this.leading,
    this.height,
    this.backgroundColor,
  }) : super(key: key);

  final String title;
  final Widget leading;
  final double? height;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    var route = ModalRoute.of(context)!.settings.name;
    //print("current route ${route}");
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    final Size size = MediaQuery.of(context).size;
    final ApplicationState appState = Provider.of<ApplicationState>(context);
    return Container(
      height: height ?? size.height * 0.1,
      color: backgroundColor ?? Colors.transparent,
      child: Stack(
        alignment: Alignment.centerLeft,
        clipBehavior: Clip.none,
        children: [
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
