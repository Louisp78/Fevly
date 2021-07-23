import 'package:fevly/components/custom_text_button.dart';
import 'package:fevly/components/custom_text_field.dart';
import 'package:fevly/constant.dart';
import 'package:fevly/models/fom_validate.dart';
import 'package:fevly/styles/colors.dart';
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

    String password = "";
    String email = "";
    bool isConfirmPassNotEmpty = false;

    return Form(
      key: _keyForm,
      child: SizedBox(
        height: size.height * 0.8,
        width: size.width * 0.8,
        child: Consumer<FormValidate>(
          builder: (context, formValidate, child) => Column(
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
                onChanged: (value) {
                  email = value;
                  formValidate.formValid = email.isNotEmpty &&
                      password.isNotEmpty &&
                      isConfirmPassNotEmpty;
                },
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
                hintText: "Créer un mot de passe",
                isSelected: true,
                obscureText: true,
                onChanged: (value) {
                  password = value;
                  formValidate.formValid = password.isNotEmpty &&
                      email.isNotEmpty &&
                      isConfirmPassNotEmpty;
                },
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
                hintText: "Confimer le mot de passe",
                isSelected: true,
                obscureText: true,
                onChanged: (value) {
                  isConfirmPassNotEmpty = value.isNotEmpty;
                  formValidate.formValid = password.isNotEmpty &&
                      email.isNotEmpty &&
                      isConfirmPassNotEmpty;
                },
                onSaved: (value) {},
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Vous devez confirmer votre mot de passe.";
                  } else if (password != value) {
                    return "Votre mot de passe ne correspond pas.";
                  }
                  return null;
                },
              ),
              const Spacer(),
              Align(
                child: CustomTextButton(
                  press: () {
                    final bool validation = formValidate.formValid &&
                        _keyForm.currentState!.validate();

                    if (validation) {
                      Navigator.pushNamed(context, '/signin_step2');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: kSurfaceColor,
                          content: Text(
                            snackBarMissingField,
                            style: textTheme.headline4
                                ?.copyWith(color: kPrimaryColor),
                          ),
                        ),
                      );
                    }
                  },
                  text: "Suivant",
                  isActive: formValidate.formValid,
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
