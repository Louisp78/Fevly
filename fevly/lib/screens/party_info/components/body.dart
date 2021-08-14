import 'package:fevly/components/custom_basic_app_bar.dart';
import 'package:fevly/components/custom_bottom_bar.dart';
import 'package:fevly/screens/party_info/components/party_description.dart';
import 'package:fevly/styles/colors.dart';
import 'package:fevly/styles/effects.dart';
import 'package:fevly/test/data_example.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'address_information.dart';
import 'avatar_info.dart';
import 'date_informations.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);

    return SizedBox(
      height: size.height,
      child: Stack(children: [
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.25),
              Container(
                height: size.height - size.height * 0.05,
                width: size.width,
                decoration: const BoxDecoration(
                  // ignore: unnecessary_const
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(45),
                    topLeft: Radius.circular(45),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.03),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Organisateurs", style: textTheme.headline5),
                          Text(
                              "${listParties1[0].listOfOrganizerLength} organisateurs",
                              style: textTheme.headline5),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...List.generate(
                              listParties1[0].listOfOrganizerLength,
                              (index) => AvatarInfo(
                                    text: listParties1[0]
                                        .listOfOrganizer[index]
                                        .name,
                                    size: size,
                                    textTheme: textTheme,
                                  )),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    PartyDescription(party: listParties1[0]),
                    SizedBox(height: size.height * 0.02),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AddressInformation(party: listParties1[0]),
                          Container(
                            height: 150,
                            width: (size.width * 0.9 / 2) -
                                (size.width * 0.05 / 2),
                            decoration: BoxDecoration(
                              color: kSurfaceLightColor,
                              boxShadow: [kShadowBase],
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    const DateInformations()
                  ],
                ),
              ),
            ],
          ),
        ),
        const Positioned(bottom: 0, child: CustomBottomBar()),
        CustomBasicAppBar(
          iconData: Icons.arrow_back_ios_rounded,
          press: () {},
          title: listParties1[0].name,
          subtitle: "${listParties1[0].guestsLength} participants",
          firstSuffixIcon: IconButton(
            icon: const Icon(Icons.login_rounded),
            color: Colors.black,
            onPressed: () {},
          ),
          secondSuffixIcon: IconButton(
            icon: const Icon(Icons.edit_rounded),
            color: kSecondaryColor,
            onPressed: () {},
          ),
        ),
      ]),
    );
  }
}
