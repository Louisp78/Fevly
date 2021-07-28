import 'package:fevly/components/custom_text_field.dart';
import 'package:fevly/constant.dart';
import 'package:fevly/models/fom_validate.dart';
import 'package:fevly/styles/colors.dart';
import 'package:fevly/styles/input_decoration.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'bottom_section.dart';

class FormSection extends StatelessWidget {
  const FormSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    final Size size = MediaQuery.of(context).size;
    final _keyForm = GlobalKey<FormState>();
    String password = "";
    String username = "";
    const String examplePassword = "loulou78";
    return Form(
      key: _keyForm,
      child: Consumer<FormValidate>(
        builder: (context, formValidate, child) => SizedBox(
          height: size.height * 0.83,
          width: size.width,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Vous êtes de\nretour!",
                    style: textTheme.headline1,
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  CustomTextField(
                    decoration: basicInputDecoration(
                        hintStyle: kBasicHintStyle(textTheme: textTheme),
                        hintText: "Nom d'utilisateur ou adresse mail"),
                    isSelected: true,
                    onChanged: (value) {
                      username = value;
                      formValidate.formValid =
                          password.isNotEmpty && username.isNotEmpty;
                    },
                    onSaved: (value) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return validatorMissed(
                            source: "adresse mail ou le nom d'utilisateur");
                      }
                      return null;
                    },
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomTextField(
                    decoration: basicInputDecoration(
                        hintStyle: kBasicHintStyle(textTheme: textTheme),
                        hintText: "Mot de passe"),
                    obscureText: true,
                    onChanged: (value) {
                      password = value;
                      formValidate.formValid =
                          password.isNotEmpty && username.isNotEmpty;
                    },
                    onSaved: (value) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return validatorMissed(source: "mot de passe");
                      } else if (value != examplePassword) {
                        return "Le mot de passe ne correspond pas.";
                      }
                      return null;
                    },
                  ),
                  Text(
                    "Mot de passe oublié ?",
                    style: textTheme.bodyText1?.copyWith(fontSize: 12),
                  ),
                ],
              ),
              const Spacer(),
              BottomSection(
                formValidate: formValidate,
                keyForm: _keyForm,
              ),
              const Spacer(),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("Pas de compte ? ", style: textTheme.bodyText1),
                TextButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, '/signin_step1'),
                  child: Text(
                    "S’inscrire ici.",
                    style: textTheme.bodyText1?.copyWith(
                        color: kPrimaryColor, fontWeight: FontWeight.bold),
                  ),
                )
              ]),
              SizedBox(
                height: size.height * 0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
