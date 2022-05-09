import 'package:fevly/components/custom_grid_item.dart';
import 'package:fevly/constant/constant.dart';
import 'package:fevly/models/badge.dart';
import 'package:fevly/screens/profile/components/header_list_badge.dart';
import 'package:fevly/view_models/text_field_model_view.dart';
import 'package:fevly/styles/no_glow_scroll_behavior.dart';
import 'package:flutter/material.dart';

class ListOfBadges extends StatelessWidget {
  const ListOfBadges({
    Key? key,
    required this.searchField,
    required this.defaultListOfBadge,
  }) : super(key: key);

  final TextFieldModelView searchField;
  final List<Badge> defaultListOfBadge;

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
                behavior: NoGlowScrollBehavior(),
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
              defaultListOfBadge: defaultListOfBadge,
            ),
          ),
        ],
      ),
    );
  }
}
