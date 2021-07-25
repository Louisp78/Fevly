import 'package:fevly/components/custom_circle_avatar.dart';
import 'package:fevly/components/custom_dialog_list.dart';
import 'package:fevly/components/custom_small_button.dart';
import 'package:fevly/constant.dart';
import 'package:fevly/models/user_relation_state.dart';
import 'package:fevly/styles/colors.dart';
import 'package:fevly/styles/effects.dart';
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
                      builder: (context) => CustomDialogList(
                            title: "Options",
                            listOptions: [
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Inviter à Soirée Exemple",
                                  style: textTheme.headline5,
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Bloquer",
                                  style: textTheme.headline5
                                      ?.copyWith(color: kErrorColor),
                                ),
                              ),
                            ],
                          ));
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
            text: getTextFromRelationState(relationState),
            lightMode: false,
            press: () {},
            prefixIcon: Icon(
              getIconDataFromRelationState(relationState),
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
}




// InkWell(
//   onTap: () {},
//   child: Container(
//     padding: EdgeInsets.symmetric(
//         horizontal: size.width * 0.05),
//     child: RichText(
//       text: TextSpan(
//         children: [
//           TextSpan(
//             text: "Inviter à ",
//             style: textTheme.headline4,
//           ),
//           TextSpan(
//             text: "Soirée exemple",
//             style: textTheme.headline4
//                 ?.copyWith(color: kPrimaryColor),
//           ),
//         ],
//       ),
//     ),
//   ),
// ),
