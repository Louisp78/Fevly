import 'package:fevly/components/custom_text_button.dart';
import 'package:fevly/screens/party_info/components/address_information.dart';
import 'package:fevly/screens/party_info/components/avatar_info.dart';
import 'package:fevly/screens/party_info/components/date_informations.dart';
import 'package:fevly/screens/party_info/components/party_description.dart';
import 'package:fevly/styles/colors.dart';
import 'package:fevly/styles/effects.dart';
import 'package:fevly/test_data/data_party.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: size.height * 0.15),
          Container(
            height: size.height + 100,
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
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
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
                                text:
                                    listParties1[0].listOfOrganizer[index].name,
                                size: size,
                                textTheme: textTheme,
                              )),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                PartyDescription(party: listParties1[0]),
                SizedBox(height: size.height * 0.02),
                if(listParties1[0].link != null)
                  Container(
                  height: 100,
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                    color: kSurfaceLightColor, boxShadow: [kShadowBase],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: size.width * 0.03),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                              child: const FittedBox(
                                fit: BoxFit.scaleDown,
                                alignment: Alignment.topLeft,
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: kSurfaceColor,
                                  child: Icon(
                                    Icons.info_outline_rounded,
                                    size: 15 * (32 / 25),
                                    color: kPrimaryColor,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                              child: Text(
                                "Inscriptions ou billeteries",
                                style: textTheme.headline4,
                                ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                            /*child: RichText(
                              text: TextSpan(
                                text: listParties1[0].link,
                                style: textTheme.headline5,
                                recognizer: TapGestureRecognizer()
                                ..onTap = () {launch(listParties1[0].link!);},
                              ),
                            ),*/
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: size.width * 0.03, vertical: size.width * 0.03),
                            child: CustomTextButton(
                              buttonSize: const CustomTextButtonSize.verySmall(),
                              text: "Lien",
                              press: () {},//() => {launch(listParties1[0].link!)},
                              prefixIcon: const Icon(
                                Icons.link_rounded,
                                color: Colors.white,
                                size: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                    ),
                  ),
                SizedBox(height: size.height * 0.02),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AddressInformation(party: listParties1[0]),
                      Container(
                        height: 150,
                        width: (size.width * 0.9 / 2) - (size.width * 0.05 / 2),
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
                const DateInformations(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
