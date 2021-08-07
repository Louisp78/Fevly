import 'package:fevly/components/custom_circle_avatar.dart';
import 'package:fevly/components/custom_dialog_list.dart';
import 'package:fevly/components/custom_small_button.dart';
import 'package:fevly/constant.dart';
import 'package:fevly/models/user.dart';
import 'package:fevly/styles/colors.dart';
import 'package:fevly/styles/effects.dart';
import 'package:fevly/test/data_example.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'counter_item.dart';
import 'level_label.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
    required this.pseudo,
    required this.name,
    required this.level,
    required this.relationState,
  }) : super(key: key);

  final String pseudo;
  final String name;
  final int level;
  final UserRelationState relationState;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.05, vertical: size.height * 0.02),
      height: size.height * 0.32,
      width: size.width * 0.9,
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        boxShadow: [kShadowProfileCard],
        borderRadius: BorderRadius.circular(28),
        gradient: const SweepGradient(
          colors: [kPrimaryColor, kDarkPrimaryColor],
          center: FractionalOffset.topLeft,
          endAngle: 1.1,
          stops: [0.5, 0.5],
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomCircleAvatar(),
              const SizedBox(
                width: 15.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        pseudo,
                        style:
                            textTheme.headline2?.copyWith(color: Colors.white),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const LevelLabel(
                        level: 18,
                      ),
                    ],
                  ),
                  Text(
                    name,
                    style: textTheme.headline5?.copyWith(color: Colors.white),
                  ),
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (context) => buildDialog(textTheme),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: const Icon(
                    Icons.more_vert_rounded,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(
            flex: 3,
          ),
          CustomSmallButton(
            size: CustomSmallButtonSize.small,
            text: relationState.name,
            lightMode: false,
            press: () => Navigator.pushNamed(context, "/profile/my_lists"),
            prefixIcon: Icon(
              relationState.iconData,
              color: Colors.white,
              size: kSmallIconSize,
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              CounterItem(
                title: "Soirées",
                count: 31,
              ),
              CounterItem(
                title: "Amis",
                count: 86,
              ),
              CounterItem(
                title: "Badges",
                count: 15,
              ),
            ],
          ),
        ],
      ),
    );
  }

  CustomDialogList buildDialog(TextTheme textTheme) {
    return CustomDialogList(title: "Options", listOptions: [
      ...List.generate(
        listParties1.length,
        (index) => TextButton(
          onPressed: () {},
          child: RichText(
              text: TextSpan(children: [
            TextSpan(
              text: "Inviter à ",
              style: textTheme.headline5,
            ),
            TextSpan(
              text: "${listParties1[index].name}.",
              style: textTheme.headline5?.copyWith(color: kPrimaryColor),
            ),
          ])),
        ),
      ),
      TextButton(
        onPressed: () {},
        child: Text(
          "Bloquer",
          style: textTheme.headline5?.copyWith(color: kErrorColor),
        ),
      ),
    ]);
  }
}
