import 'package:fevly/components/custom_text_field.dart';
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
        const CustomTextField(
          hintText: "Adresse mail",
          isSelected: true,
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        const CustomTextField(
          hintText: "Créer un mot de passe",
          isSelected: true,
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        const CustomTextField(
          hintText: "Confimer le mot de passe",
          isSelected: true,
        ),
      ],
    );
  }
}
