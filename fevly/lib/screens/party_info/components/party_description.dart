import 'package:fevly/styles/colors.dart';
import 'package:fevly/styles/effects.dart';
import 'package:flutter/material.dart';

class PartyDescription extends StatelessWidget {
  const PartyDescription({
    Key? key,
    required this.size,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: kSurfaceLightColor, boxShadow: [kShadowBase],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: size.height * 0.02,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: Text(
              "Nom et Description",
              style: textTheme.headline4,
            ),
          ),
          SizedBox(height: size.height * 0.02,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Faucibus non nisi felis viverra. Hac commodo diam magna accumsan elementum convallis turpis magna ligula.",
              style: textTheme.headline5,
            ),
          ),
        ],
      ),
    );
  }
}