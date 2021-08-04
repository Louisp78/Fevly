import 'package:fevly/styles/colors.dart';
import 'package:fevly/styles/effects.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components/address_information.dart';
import 'components/avatar_info.dart';
import 'components/date_informations.dart';
import 'components/party_description.dart';

class InfoPartyScreen extends StatelessWidget {
  const InfoPartyScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    final List<String> avatarsList = [
      "louis", "vincent", "louis", "vincent", "louis", "vincent", "louis", "vincent"
    ];
    return Scaffold(
      backgroundColor: kPrimaryVariantColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.15),
            Container(
              height: size.height,
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
                  const SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Organisateurs",
                          style: textTheme.headline5
                        ),
                        Text(
                          "9 organisateurs",
                          style: textTheme.headline5
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...List.generate(
                        avatarsList.length,
                        (index) => AvatarInfo(
                          text: avatarsList[index],
                          size: size,
                          textTheme: textTheme,
                          )
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  PartyDescription(size: size, textTheme: textTheme),
                  const SizedBox(height: 15),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AddressInformation(size: size, textTheme: textTheme),
                        Container(
                          height: 150,
                          width: (size.width * 0.9 / 2) - (size.width * 0.05/2),
                          decoration: BoxDecoration(
                            color: kSurfaceLightColor, boxShadow: [kShadowBase],
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  DateInformations(size: size, textTheme: textTheme)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}