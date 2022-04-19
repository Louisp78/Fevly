import 'package:fevly/components/custom_text_button.dart';
import 'package:fevly/components/custom_text_field.dart';
import 'package:fevly/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({required this.callback, required this.email});

  final void Function({required String email, required String password})
      callback;
  final String email;

  @override
  State<SignInForm> createState() => _SignInForm();
}

class _SignInForm extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_SignInFormState');
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    final Size size = MediaQuery.of(context).size;
    final ColorScheme themeColor = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Connexion à',
          style: textTheme.displayLarge,
        ),
        SizedBox(
          height: kBasicVerticalPadding(size: size) / 2,
        ),
        Text(
          widget.email,
          style: textTheme.displayMedium!.apply(color: themeColor.onPrimary),
        ),
        SizedBox(
          height: kBasicVerticalPadding(size: size) * 2,
        ),
        Form(
          key: _formKey,
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextField(
                    controller: _passwordController,
                    hintStyle: kBasicHintStyle(textTheme: textTheme),
                    hintText: 'Mot de passe',
                    obscureText: true),
                Spacer(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomTextButton(
                    press: () async {
                      if (_formKey.currentState!.validate()) {
                        widget.callback(
                            email: widget.email,
                            password: _passwordController.text);
                      }
                    },
                    text: 'Suivant',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
