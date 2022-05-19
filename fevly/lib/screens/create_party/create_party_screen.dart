import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fevly/DTOS/dto_guest.dart';
import 'package:fevly/DTOS/dto_party.dart';
import 'package:fevly/components/card_user_simple.dart';
import 'package:fevly/components/custom_icon_button.dart';
import 'package:fevly/components/custom_lite_app_bar.dart';
import 'package:fevly/components/custom_text_button.dart';
import 'package:fevly/components/custom_text_field.dart';
import 'package:fevly/constant/constant.dart';
import 'package:fevly/model/user_infos.dart';
import 'package:fevly/screens/create_party/components/date_section.dart';
import 'package:fevly/screens/create_party/components/location_section.dart';
import 'package:fevly/screens/create_party/components/organizer_section.dart';
import 'package:fevly/service/application_state.dart';
import 'package:fevly/service/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreatePartyScreen extends StatelessWidget {
  CreatePartyScreen({Key? key}) : super(key: key);

  final _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final ColorScheme themeColor = Theme.of(context).colorScheme;
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    ScrollController _scrollController = ScrollController();

    final kHeightForSection = size.height * 0.25;
    final ApplicationState appState = Provider.of<ApplicationState>(context);
    final CurrentUserInfos userInfos = appState.userInfos!;
    final List<DTOGuest> guests = [
      DTOGuest(
          userId: FirebaseAuth.instance.currentUser!.uid,
          pseudo: userInfos.pseudo,
          displayName: userInfos.user.displayName!,
          photoURL: userInfos.user.photoURL!,
          isOrganizer: true)
    ];
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              child: Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.12,
                  bottom: kBasicVerticalPadding(size: size) * 4,
                ),
                child: Form(
                  key: _formKey,
                  child: SizedBox(
                    width: size.width,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: _nameController,
                          hintText: 'Entrer le nom de la soirée',
                          label_text: 'Nom de la soirée',
                          validator: (value) {
                            if (value!.isEmpty) {
                              // Scroll to the top of the screen
                              _scrollController.animateTo(
                                  _scrollController.initialScrollOffset,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease);
                              return 'Veuillez entrer un nom';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                            height: kBasicHorizontalPadding(size: size) * 3),
                        OrganizerSection(
                            organizers: guests
                                .where((dtoGuest) => dtoGuest.isOrganizer)
                                .map((e) => e.toDTOUserSimple())
                                .toList()),
                        SizedBox(
                          height: kBasicHorizontalPadding(size: size) * 2,
                        ),
                        LocationSection(
                          height: kHeightForSection,
                        ),
                        SizedBox(
                          height: kBasicHorizontalPadding(size: size) * 2,
                        ),
                        const DateSection(),
                        SizedBox(
                          height: kBasicHorizontalPadding(size: size) * 3,
                        ),
                        HeaderGuestList(),
                        SizedBox(
                          height: kBasicHorizontalPadding(size: size),
                        ),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            CardUserSimple(
                              user: guests[0].toDTOUserSimple(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            CustomLiteAppBar(
              title: 'Organiser une soirée',
              backgroundColor: themeColor.background,
              height: size.height * 0.1,
              leading: CustomIconButton(
                size: const CustomIconButtonSize.small(),
                press: () => Navigator.pop(context),
                outline: true,
                circle: false,
                icon: Icons.arrow_back_ios_rounded,
                iconColor: themeColor.onBackground,
                backgroundColor: themeColor.background,
                borderColor: themeColor.onBackground,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextButton(
                      text: 'Creer la soiree',
                      press: () {
                        if (_formKey.currentState!.validate()) {
                          print('form ok');
                          final party = DTOParty(
                            name: _nameController.text,
                            dateStart: DateTime.now(),
                            dateEnd: DateTime.now(),
                            location: const GeoPoint(
                              48.83759950263421,
                              2.0829567816823435,
                            ), // 1 impasse du poirier au large Bailly
                            guestsCount: 1,
                            organizersCount: 1,
                          );

                          addParty(party: party, guests: guests);
                        }
                      }),
                  SizedBox(
                    height: kBasicHorizontalPadding(size: size),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HeaderGuestList extends StatelessWidget {
  const HeaderGuestList();

  @override
  Widget build(BuildContext context) {
    final ColorScheme themeColor = Theme.of(context).colorScheme;
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    return SizedBox(
      width: size.width * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Liste d'invités", style: textTheme.headline3),
          CustomTextButton(
            text: 'Ajouter un invité',
            textColor: themeColor.onBackground,
            press: () {},
            buttonSize: CustomTextButtonSize.small(),
            suffixIcon: Icon(
              Icons.group_add_rounded,
              size: 15,
              color: themeColor.onBackground,
            ),
            backgroundColor: themeColor.surface,
          ),
        ],
      ),
    );
  }
}
