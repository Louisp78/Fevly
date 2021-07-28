import 'package:fevly/styles/colors.dart';
import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    Key? key,
    this.radius = 25,
  }) : super(key: key);

  final double radius;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: Alignment.topLeft,
      child: CircleAvatar(
        radius: radius,
        backgroundColor: kSurfaceColor,
        child: Icon(
          Icons.person_rounded,
          size: radius * (32 / 25),
          color: kPrimaryColor,
        ),
      ),
    );
  }
}
