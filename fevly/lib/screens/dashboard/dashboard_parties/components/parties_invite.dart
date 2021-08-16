import 'package:card_swiper/card_swiper.dart';
import 'package:fevly/components/custom_icon_button.dart';
import 'package:fevly/models/party.dart';
import 'package:fevly/styles/colors.dart';
import 'package:flutter/material.dart';

import 'custom_invite.dart';

class PartiesInvite extends StatelessWidget {
  const PartiesInvite({
    Key? key,
    required this.parties,
  }) : super(key: key);
  final List<Party> parties;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        Swiper(
          itemBuilder: (BuildContext context, int index) {
            return CustomInvite(
              partyInvited: parties[index],
            );
          },
          customLayoutOption:
              CustomLayoutOption(startIndex: 0).addOpacity([0.2, 0.5, 1]),
          itemWidth: size.width * 0.85,
          itemHeight: 200,
          containerHeight: size.height * 0.2,
          itemCount: parties.length,
          layout: SwiperLayout.TINDER,
        ),
        Positioned(
          bottom: -20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomIconButton(
                press: () {},
                icon: Icons.done_rounded,
                backgroundColor: Colors.white,
                iconColor: kPrimaryColor,
                withShadow: true,
              ),
              SizedBox(
                width: size.width * 0.15,
              ),
              CustomIconButton(
                press: () {},
                icon: Icons.close_rounded,
                backgroundColor: Colors.white,
                iconColor: kPrimaryColor,
                withShadow: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
