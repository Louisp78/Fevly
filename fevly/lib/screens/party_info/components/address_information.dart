import 'package:fevly/components/custom_text_button.dart';
import 'package:fevly/models/party.dart';
import 'package:fevly/styles/colors.dart';
import 'package:fevly/styles/effects.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddressInformation extends StatelessWidget {
  const AddressInformation({
    Key? key,
    required this.party,
  }) : super(key: key);
  final Party party;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    return Container(
      height: 150,
      width: (size.width * 0.9 / 2) - (size.width * 0.05 / 2),
      decoration: BoxDecoration(
        color: kSurfaceLightColor,
        boxShadow: [kShadowBase],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.03, vertical: size.width * 0.03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    party.adress,
                    maxLines: 4,
                    style: textTheme.headline4,
                  ),
                ),
                SizedBox(width: size.width * 0.02),
                const FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.topLeft,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: kSurfaceColor,
                    child: Icon(
                      Icons.location_on_rounded,
                      size: 20 * (32 / 25),
                      color: kPrimaryColor,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.03, vertical: size.width * 0.03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomTextButton(
                  buttonSize: const CustomTextButtonSize.verySmall(),
                  text: "Itinéraire",
                  press: () {},
                  prefixIcon: const Icon(
                    Icons.map_rounded,
                    color: Colors.white,
                    size: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
