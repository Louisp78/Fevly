import 'package:fevly/components/custom_basic_app_bar.dart';
import 'package:fevly/components/custom_bottom_bar.dart';
import 'package:fevly/components/custom_circle_avatar.dart';
import 'package:fevly/components/custom_drop_list.dart';
import 'package:fevly/components/custom_header_drop_list.dart';
import 'package:fevly/components/custom_small_button.dart';
import 'package:fevly/components/custom_text_button.dart';
import 'package:fevly/components/custom_text_field.dart';
import 'package:fevly/constant.dart';
import 'package:fevly/models/user.dart';
import 'package:fevly/styles/colors.dart';
import 'package:fevly/styles/effects.dart';
import 'package:fevly/styles/input_decoration.dart';
import 'package:fevly/test/data_example.dart';
import 'package:fevly/view_models/dropdown_model_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    final Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 110),
          child: Column(
            children: [
              SizedBox(
                height: kBasicVerticalPadding(size: size),
              ),
              CustomTextField(
                onChanged: (value) {},
                onSaved: (value) {},
                validator: (value) {},
                decoration: searchInputDecoration(
                    size: size,
                    hintStyle: textTheme.headline4!.copyWith(color: kTextColor),
                    hintText: "Rechercher quelqu’un ..."),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: kBasicVerticalPadding(size: size) * 3,
                    ),
                    child: Column(
                      children: [
                        CustomDropList(
                          title: "Récent",
                          listWidget: List.generate(
                            listOfUsers1.length,
                            (index) {
                              final User currentUser = listOfUsers1[index];
                              return Container(
                                padding: EdgeInsets.all(size.width * 0.03),
                                margin: EdgeInsets.only(
                                    bottom: kBasicVerticalPadding(size: size)),
                                width: size.width * 0.9,
                                decoration: BoxDecoration(
                                  color: kSurfaceLightColor,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [kShadowBase],
                                ),
                                child: Row(
                                  children: [
                                    const CustomCircleAvatar(),
                                    SizedBox(
                                      width:
                                          kBasicHorizontalPadding(size: size),
                                    ),
                                    Text(
                                      currentUser.pseudo,
                                      style: textTheme.headline3,
                                    ),
                                    const Spacer(),
                                    CustomTextButton(
                                      buttonSize:
                                          const CustomTextButtonSize.small(),
                                      text: "Ajouter",
                                      press: () {},
                                      backgroundColor: kSurfaceColor,
                                      textColor: kPrimaryColor,
                                      suffixIcon: const Icon(
                                          Icons.person_add_rounded,
                                          color: kPrimaryColor),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                          addItemPress: () {},
                        ),
                        CustomDropList(
                          title: "Amis",
                          listWidget: List.generate(
                            listOfUsers1.length,
                            (index) {
                              final User currentUser = listOfUsers1[index];
                              return Container(
                                padding: EdgeInsets.all(size.width * 0.03),
                                margin: EdgeInsets.only(
                                    bottom: kBasicVerticalPadding(size: size)),
                                width: size.width * 0.9,
                                decoration: BoxDecoration(
                                  color: kSurfaceLightColor,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [kShadowBase],
                                ),
                                child: Row(
                                  children: [
                                    const CustomCircleAvatar(),
                                    SizedBox(
                                      width:
                                          kBasicHorizontalPadding(size: size),
                                    ),
                                    Text(
                                      currentUser.pseudo,
                                      style: textTheme.headline3,
                                    ),
                                    const Spacer(),
                                    CustomSmallButton(
                                      text: "Ami",
                                      press: () {},
                                      buttonSize: CustomSmallButtonSize.small,
                                      borderColor: kPrimaryColor,
                                      suffixIcon: const Icon(
                                        Icons.done_rounded,
                                        color: kPrimaryColor,
                                        size: kSmallIconSize,
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                          addItemPress: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(bottom: 0, child: CustomBottomBar()),
        CustomBasicAppBar(
          title: "Recherche",
          subtitleIcon: const Icon(Icons.group_rounded),
          press: () {},
        )
      ],
    );
  }
}
