import 'package:fevly/models/badge.dart';
import 'package:fevly/styles/colors.dart';
import 'package:fevly/styles/effects.dart';
import 'package:fevly/styles/scroll_behavior.dart';
import 'package:fevly/test/data_example.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ListOfBadges extends StatelessWidget {
  const ListOfBadges({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.57,
          width: size.width,
          child: ScrollConfiguration(
            behavior: CustomScrollBehavior(),
            child: GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: size.width * 0.05,
              mainAxisSpacing: size.height * 0.02,
              padding: EdgeInsets.only(
                left: size.width * 0.05,
                right: size.width * 0.05,
                top: size.height * 0.07,
                bottom: size.height * 0.02,
              ),
              children: List.generate(
                badgeList1.length,
                (index) {
                  final Badge badge = badgeList1[index];
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 94,
                      width: 94,
                      decoration: BoxDecoration(
                        color: kSurfaceLightColor,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [kShadowBase],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            badge.image,
                            width: 42,
                            height: 42,
                            fit: BoxFit.scaleDown,
                          ),
                          const SizedBox(
                            height: 6.0,
                          ),
                          Text(
                            "${badge.name} ${getBadgeTypeName(badge.badgeType)}",
                            style: textTheme.headline6,
                          ),
                          const SizedBox(
                            height: 3.0,
                          ),
                          Text(
                            "x${badge.quantity}",
                            style: textTheme.headline6
                                ?.copyWith(color: kTextColor),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
