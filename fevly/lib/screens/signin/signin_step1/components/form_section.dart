import 'package:fevly/components/custom_text_button.dart';
import 'package:fevly/components/custom_text_field.dart';
import 'package:fevly/constant.dart';
import 'package:fevly/screens/signin/signin_step1/view_models/signin_step1_view_model.dart';
import 'package:fevly/styles/colors.dart';
import 'package:fevly/styles/input_decoration.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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

    return Form(
      key: _keyForm,
      child: SizedBox(
        height: size.height * 0.8,
        width: size.width * 0.8,
        child: Consumer<SignInStep1ViewModel>(
          builder: (context, signInStep1ViewModel, child) => Column(
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
                padding: EdgeInsets.only(
                  bottom: kBasicVerticalPadding(size: size),
                ),
                decoration: basicInputDecoration(
                    hintStyle: kBasicHintStyle(textTheme: textTheme),
                    hintText: "Adresse mail"),
                isSelected: true,
                onChanged: (value) => signInStep1ViewModel.email = value,
                onSaved: (value) {},
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return validatorMissed(source: "adresse mail");
                  } else if (!value.contains("@")) {
                    return "Entrer une email valide.";
                  }
                  return null;
                },
              ),
              CustomTextField(
                padding: EdgeInsets.only(
                  bottom: kBasicVerticalPadding(size: size),
                ),
                decoration: basicInputDecoration(
                    hintStyle: kBasicHintStyle(textTheme: textTheme),
                    hintText: "Créer un mot de passe"),
                isSelected: true,
                obscureText: true,
                onChanged: (value) => signInStep1ViewModel.password = value,
                onSaved: (value) {},
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return validatorMissed(source: "mot de passe");
                  } else if (value.length < 6) {
                    return "Choisir un mot de passe plus long.";
                  }
                  return null;
                },
              ),
              CustomTextField(
                decoration: basicInputDecoration(
                    hintStyle: kBasicHintStyle(textTheme: textTheme),
                    hintText: "Confimer le mot de passe"),
                isSelected: true,
                obscureText: true,
                onChanged: (value) =>
                    signInStep1ViewModel.confirmPassword = value,
                onSaved: (value) {},
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Vous devez confirmer votre mot de passe.";
                  } else if (signInStep1ViewModel.password != value) {
                    return "Votre mot de passe ne correspond pas.";
                  }
                  return null;
                },
              ),
              const Spacer(),
              Align(
                child: CustomTextButton(
                  press: () {
                    final bool validation =
                        signInStep1ViewModel.formValidate() &&
                            _keyForm.currentState!.validate();

                    if (validation) {
                      Navigator.pushNamed(context, '/signin_step1/signin_step2',
                          arguments: {
                            'password': signInStep1ViewModel.password,
                            'email': signInStep1ViewModel.email,
                          });
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
                  text: "Suivant",
                  isActive: signInStep1ViewModel.formValidate(),
                  suffixIcon: const Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
