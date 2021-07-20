import 'package:auto_size_text/auto_size_text.dart';
import 'package:fevly/components/custom_checkbox.dart';
import 'package:fevly/components/custom_text_field.dart';
import 'package:fevly/models/fom_validate.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FormSection extends StatelessWidget {
  const FormSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: size.width * 0.8,
          child: AutoSizeText(
            "Plus que quelques\ndétails",
            maxLines: 2,
            style: textTheme.headline1,
          ),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        AutoSizeText.rich(
          TextSpan(children: [
            TextSpan(
                text: "Inscription en cours avec ", style: textTheme.bodyText2),
            TextSpan(
              text: "placelouis@gmail.com",
              style: textTheme.bodyText2?.copyWith(fontWeight: FontWeight.bold),
            ),
          ]),
          maxLines: 1,
        ),
        SizedBox(
          height: size.height * 0.05,
        ),
        const CustomTextField(
          hintText: "Prénom",
          isSelected: true,
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        const CustomTextField(
          hintText: "Nom d'utilisateur",
          isSelected: true,
        ),
        SizedBox(
          height: size.height * 0.05,
        ),
        SizedBox(
          width: size.width * 0.8,
          child: Row(
            children: [
              Consumer<FormValidate>(
                builder: (context, formValidate, child) => CustomCheckBox(
                  press: () => formValidate.validationState =
                      !formValidate.validationState,
                  isCheck: formValidate.validationState,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              AutoSizeText(
                "J'accepte",
                style: textTheme.bodyText2,
              ),
              GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, '/signin_step2/term_of_use'),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(2, 0, 0, 0),
                  child: AutoSizeText(
                    "les conditions d'utilisations.",
                    style: textTheme.bodyText2
                        ?.copyWith(decoration: TextDecoration.underline),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
