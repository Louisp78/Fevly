import 'package:fevly/models/party.dart';
import 'package:fevly/styles/colors.dart';
import 'package:fevly/styles/effects.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PartyDescription extends StatelessWidget {
  const PartyDescription({Key? key, required this.party,}) : super(key: key);
  final Party party;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
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
              party.name,
              style: textTheme.headline4,
            ),
          ),
          SizedBox(height: size.height * 0.02,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: Text(
              party.description,
              style: textTheme.headline5,
            ),
          ),
        ],
      ),
    );
  }
}