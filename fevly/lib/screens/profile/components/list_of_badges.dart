import 'package:fevly/models/badge.dart';
import 'package:fevly/models/text_field_select.dart';
import 'package:fevly/styles/colors.dart';
import 'package:fevly/styles/effects.dart';
import 'package:fevly/styles/scroll_behavior.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'header_list_badge.dart';

class ListOfBadges extends StatelessWidget {
  const ListOfBadges({
    Key? key,
    required this.searchField,
  }) : super(key: key);

  final SearchField searchField;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    final List<Badge> listOfBadge = searchField.listOfObjects as List<Badge>;
    return SizedBox(
      height: searchField.selection ? size.height * 0.86 : size.height * 0.57,
      width: size.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 0,
            child: SizedBox(
              height: searchField.selection
                  ? size.height * 0.85
                  : size.height * 0.57,
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
                      top: searchField.selection
                          ? size.height * 0.09
                          : size.height * 0.14,
                      bottom: size.height * 0.02,
                    ),
                    children: [
                      ...List.generate(
                        listOfBadge.length,
                        (index) {
                          final Badge badge = listOfBadge[index];
                          return GestureDetector(
                            onTap: () {},
                            child: Container(
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
                                    width: size.width * 0.11,
                                    height: size.width * 0.11,
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
                    ]),
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: HeaderListBadge(
              searchField: searchField,
            ),
          ),
        ],
      ),
    );
  }
}
