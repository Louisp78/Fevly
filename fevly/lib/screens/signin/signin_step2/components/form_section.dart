import 'package:auto_size_text/auto_size_text.dart';
import 'package:fevly/components/custom_checkbox.dart';
import 'package:fevly/components/custom_text_button.dart';
import 'package:fevly/components/custom_text_field.dart';
import 'package:fevly/constant.dart';
import 'package:fevly/functions/contains_in_string.dart';
import 'package:fevly/screens/signin/signin_step2/view_models/signin_step2_view_model.dart';
import 'package:fevly/models/user.dart';
import 'package:fevly/styles/colors.dart';
import 'package:fevly/styles/input_decoration.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FormSection extends StatelessWidget {
  const FormSection({
    Key? key,
    required this.password,
    required this.email,
  }) : super(key: key);

  final String password;
  final String email;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    final _keyForm = GlobalKey<FormState>();

    return Form(
      key: _keyForm,
      child: SizedBox(
        height: size.height * 0.8,
        width: size.width * 0.8,
        child: Consumer<SignInStep2ViewModel>(
          builder: (context, signInStep2ViewModel, child) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                "Plus que quelques\ndétails",
                maxLines: 2,
                style: textTheme.headline1,
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              AutoSizeText.rich(
                TextSpan(children: [
                  TextSpan(
                      text: "Inscription en cours avec ",
                      style: textTheme.bodyText2),
                  TextSpan(
                    text: email,
                    style: textTheme.bodyText2
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ]),
                maxLines: 1,
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              CustomTextField(
                padding: EdgeInsets.only(
                  bottom: kBasicVerticalPadding(size: size),
                ),
                decoration: basicInputDecoration(
                    hintStyle: kBasicHintStyle(textTheme: textTheme),
                    hintText: "Prénom"),
                isSelected: true,
                onChanged: (value) => signInStep2ViewModel.name = value,
                onSaved: (value) {
                  if (value != null) {
                    signInStep2ViewModel.name = value;
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return validatorMissed(source: "prénom");
                  } else if (containsInString(value, specialChar)) {
                    return "Entrer un prénom sans caractères spéciaux.";
                  }
                  return null;
                },
              ),
              CustomTextField(
                decoration: basicInputDecoration(
                    hintStyle: kBasicHintStyle(textTheme: textTheme),
                    hintText: "Nom d'utilisateur"),
                isSelected: true,
                onChanged: (value) => signInStep2ViewModel.pseudo = value,
                onSaved: (value) {
                  if (value != null) {
                    signInStep2ViewModel.pseudo = value;
                  }
                },
                validator: (value) {
                  if (value != null && value.contains("@")) {
                    return "Pas besoin de mettre un @ dans votre nom d'utilisateur";
                  } else if (value == null || value.isEmpty) {
                    return validatorMissed(source: "nom d'utilisateur");
                  }
                  return null;
                },
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              SizedBox(
                width: size.width * 0.8,
                child: Row(
                  children: [
                    CustomCheckBox(
                      press: () => signInStep2ViewModel.switchTerm(),
                      isCheck: signInStep2ViewModel.isTermAccepted,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    AutoSizeText(
                      "J'accepte",
                      style: textTheme.bodyText2,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(
                          context, '/signin_step1/signin_step2/term_of_use'),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(2, 0, 0, 0),
                        child: AutoSizeText(
                          "les conditions d'utilisation.",
                          style: textTheme.bodyText2
                              ?.copyWith(decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Align(
                child: CustomTextButton(
                  press: () {
                    final bool validation = _keyForm.currentState!.validate() &&
                        signInStep2ViewModel.formValidate();

                    final bool onlyTermOfUseLeft =
                        _keyForm.currentState!.validate() &&
                            signInStep2ViewModel.pseudo.isNotEmpty &&
                            signInStep2ViewModel.name.isNotEmpty &&
                            !signInStep2ViewModel.isTermAccepted;

                    if (validation) {
                      final User currentUser = User(
                          name: signInStep2ViewModel.name,
                          pseudo: signInStep2ViewModel.pseudo,
                          password: password,
                          email: email);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: kSurfaceColor,
                          content: Text(
                            'Félicitation profile validé!',
                            style: textTheme.headline4
                                ?.copyWith(color: kDoneColor),
                          ),
                        ),
                      );
                      Navigator.pushNamed(context, "/profile",
                          arguments: currentUser);
                    } else if (onlyTermOfUseLeft) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: kSurfaceColor,
                          content: Text(
                            "Il ne vous reste plus qu'à accepter les conditions d'utilisation.",
                            style: textTheme.headline4
                                ?.copyWith(color: kPrimaryColor),
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: kSurfaceColor,
                          content: Text(
                            kSnackBarMissingField,
                            style: textTheme.headline4
                                ?.copyWith(color: kPrimaryColor),
                          ),
                        ),
                      );
                    }
                  },
                  text: "S'inscrire",
                  isActive: signInStep2ViewModel.formValidate(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
