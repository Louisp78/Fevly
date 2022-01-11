import 'package:fevly/styles/colors.dart';
import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    Key? key,
    this.radius = 25,
    this.icon,
    this.backgroundColor, 
    required this.press,
  }) : super(key: key);

  final double radius;
  final Widget? icon;
  final Color? backgroundColor;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    final ThemeColor themeColor = initThemeColor(context: context);
    return InkWell(
      onTap: press,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.topLeft,
        child: CircleAvatar(
            radius: radius,
            backgroundColor: backgroundColor ?? themeColor.kSurfaceColor,
            child: icon ??
                Icon(
                  Icons.person,
                  size: radius * (32 / 25),
                  color: themeColor.kPrimaryColor,
                )),
      ),
    );
  }
}
