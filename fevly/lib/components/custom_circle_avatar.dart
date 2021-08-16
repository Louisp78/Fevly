import 'package:fevly/styles/colors.dart';
import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    Key? key,
    this.radius = 25,
    this.icon,
    this.backgroundColor = kSurfaceColor,
  }) : super(key: key);

  final double radius;
  final Widget? icon;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: Alignment.topLeft,
      child: CircleAvatar(
          radius: radius,
          backgroundColor: backgroundColor,
          child: icon ??
              Icon(
                Icons.person,
                size: radius * (32 / 25),
                color: kPrimaryColor,
              )),
    );
  }
}
