import 'package:fevly/DTOS/dto_guest.dart';
import 'package:fevly/DTOS/dto_user_simple.dart';
import 'package:fevly/constant/constant.dart';
import 'package:fevly/screens/create_party/components/custom_card_add_organizer.dart';
import 'package:fevly/components/card_user_simple.dart';
import 'package:fevly/screens/create_party/components/organizers_header.dart';
import 'package:flutter/material.dart';

class OrganizerSection extends StatelessWidget {
  const OrganizerSection({
    Key? key,
    required this.organizers,
  }) : super(key: key);

  final List<DTOUserSimple> organizers;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          width: size.width * 0.9,
          child: OrganizersHeader(numberOfOrganizers: organizers.length),
        ),
        SizedBox(
          height: kBasicHorizontalPadding(size: size) * 1.5,
        ),
        SizedBox(
          height: 60,
          width: size.width,
          child: ListView.separated(
            padding: EdgeInsets.only(left: kBasicHorizontalPadding(size: size)),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(
              width: kBasicHorizontalPadding(size: size) * 1.5,
            ),
            itemCount: organizers.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return CustomCardAddOrganizer();
              } else {
                return CardUserSimple(
                  user: organizers[index - 1],
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
