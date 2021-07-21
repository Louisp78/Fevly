import 'package:fevly/components/custom_text_field.dart';
import 'package:fevly/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormSection extends StatelessWidget {
  const FormSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    final Size size = MediaQuery.of(context).size;

    String password = "";
    String email = "";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Bonjour.",
          style: textTheme.headline1,
        ),
        SizedBox(
          height: size.height * 0.05,
        ),
        CustomTextField(
          hintText: "Adresse mail",
          isSelected: true,
          onChanged: (value) {},
          onSaved: (value) {},
          validator: (value) {
            if (value == null || value.isEmpty) {
              return validatorMissed("adresse mail");
            }
          },
        ),
        CustomTextField(
          hintText: "Créer un mot de passe",
          isSelected: true,
          obscureText: true,
          onChanged: (value) {},
          onSaved: (value) {},
          validator: (value) {
            if (value == null || value.isEmpty) {
              return validatorMissed("mot de passe");
            }
          },
        ),
        CustomTextField(
          hintText: "Confimer le mot de passe",
          isSelected: true,
          obscureText: true,
          onChanged: (value) {},
          onSaved: (value) {},
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Vous devez confirmer votre mot de passe.";
            }
          },
        ),
      ],
    );
  }
}
