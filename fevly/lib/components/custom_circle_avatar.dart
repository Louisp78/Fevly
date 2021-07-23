import 'package:fevly/styles/colors.dart';
import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const FittedBox(
      fit: BoxFit.scaleDown,
      alignment: Alignment.topLeft,
      child: CircleAvatar(
        radius: 25,
        backgroundColor: kSurfaceColor,
        child: Icon(
          Icons.person_rounded,
          size: 32,
          color: kPrimaryColor,
        ),
      ),
    );
  }
}
