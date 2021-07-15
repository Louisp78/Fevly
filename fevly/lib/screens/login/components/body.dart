import 'package:fevly/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_text_button.dart';
import 'custom_text_field.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.05,
        ),
        Padding(
          padding: EdgeInsets.only(right: size.width * 0.1),
          child: Text(
            "Vous êtes de\nretour!",
            style: textTheme.headline1,
          ),
        ),
        SizedBox(
          height: size.height * 0.05,
        ),
        const CustomTextField(
          hintText: "Nom d'utilisateur ou adresse mail",
          isSelected: true,
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const CustomTextField(
              hintText: "Mot de passe",
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              "Mot de passe oublié ?",
              style: textTheme.bodyText1,
            )
          ],
        ),
        const Spacer(),
        Container(
          alignment: Alignment.center,
          width: size.width,
          height: size.height * 0.22,
          decoration: const BoxDecoration(
            color: kPrimaryVariantColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(83),
              topRight: Radius.circular(83),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextButton(press: () {}, text: "Connexion"),
              SizedBox(
                height: size.height * 0.025,
              ),
              CustomTextButton(press: () {}, text: "Via Google"),
            ],
          ),
        ),
      ],
    );
  }
}
