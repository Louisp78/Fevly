import 'package:auto_size_text/auto_size_text.dart';
import 'package:fevly/components/custom_text_button.dart';
import 'package:fevly/components/custom_text_field.dart';
import 'package:fevly/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    required this.callback,
    required this.email,
  });

  final void Function(
      {required String email,
      required String login,
      required String password}) callback;
  final String email;

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_RegisterFormState');
  final _passwordController = TextEditingController();
  final _loginController = TextEditingController();

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
          'Nouveau compte',
          style: textTheme.displayLarge,
        ),
        Text(
          widget.email,
          style: textTheme.displayMedium!.apply(color: themeColor.onPrimary),
        ),
        SizedBox(
          height: kBasicVerticalPadding(size: size),
        ),
        SizedBox(
          height: size.height * 0.1,
        ),
        Form(
          key: _formKey,
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  controller: _loginController,
                  hintStyle: kBasicHintStyle(textTheme: textTheme),
                  hintText: 'Pseudo',
                  validator: (value) {
                    // TODO: add invidate char check
                    if (value!.isEmpty) {
                      return "Vous avez oubliez de renseigner votre pseudo.";
                    }
                    return null;
                  },
                ),
                SizedBox(height: kBasicVerticalPadding(size: size)),
                CustomTextField(
                    controller: _passwordController,
                    hintStyle: kBasicHintStyle(textTheme: textTheme),
                    hintText: 'Mot de passe',
                    obscureText: true),
                SizedBox(height: kBasicVerticalPadding(size: size)),
                CustomTextField(
                  hintStyle: kBasicHintStyle(textTheme: textTheme),
                  hintText: 'Confirmer mot de passe',
                  obscureText: true,
                  validator: (value) {
                    if (value != _passwordController.text) {
                      return "Les mot de passes ne sont pas les même.";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: kBasicVerticalPadding(size: size)),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/terms_of_use'),
                  child: AutoSizeText(
                    "Voir les conditions d'utilisations",
                    style: textTheme.bodyText2
                        ?.copyWith(decoration: TextDecoration.underline),
                  ),
                ),
                Spacer(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomTextButton(
                    press: () async {
                      if (_formKey.currentState!.validate()) {
                        widget.callback(
                          email: widget.email,
                          login: _loginController.text,
                          password: _passwordController.text,
                        );
                      }
                    },
                    textWidget: AutoSizeText(
                      'Accepter les conditions d\'utilisations',
                      style: textTheme.headline5!
                          .copyWith(color: themeColor.background),
                    ),
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
