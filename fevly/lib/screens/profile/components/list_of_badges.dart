import 'package:fevly/components/custom_grid_item.dart';
import 'package:fevly/constant.dart';
import 'package:fevly/models/badge.dart';
import 'package:fevly/models/text_field_provider.dart';
import 'package:fevly/styles/scroll_behavior.dart';
import 'package:flutter/material.dart';
import 'header_list_badge.dart';

class ListOfBadges extends StatelessWidget {
  const ListOfBadges({
    Key? key,
    required this.searchField,
  }) : super(key: key);

  final TextFieldProvider searchField;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final List<Badge> listOfBadge = searchField.listOfObjects! as List<Badge>;
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
                    crossAxisSpacing: kGridCrossSpacing(size: size),
                    mainAxisSpacing: kGridMainSpacing(size: size),
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
                          return CustomGridItem(
                            badge: badge,
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
