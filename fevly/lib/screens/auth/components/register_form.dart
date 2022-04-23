import 'package:auto_size_text/auto_size_text.dart';
import 'package:fevly/components/custom_loading_button.dart';
import 'package:fevly/components/custom_text_button.dart';
import 'package:fevly/components/custom_text_field.dart';
import 'package:fevly/constant.dart';
import 'package:fevly/errors_msg.dart';
import 'package:fevly/screens/auth/view_models/auth_view_model.dart';
import 'package:fevly/service/application_state.dart';
import 'package:fevly/validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

/// Form to register
class RegisterForm extends StatefulWidget {
  const RegisterForm({
    required this.email,
  });

  /*final void Function(
      {required String email,
      required String login,
      required String password}) callback;*/
  final String email;

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_RegisterFormState');
  final _passwordController = TextEditingController();
  final _loginController = TextEditingController();

  String? password_error_msg;
  @override
  Widget build(BuildContext context) {
    final ApplicationState appState = Provider.of<ApplicationState>(context);
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    final Size size = MediaQuery.of(context).size;
    final ColorScheme themeColor = Theme.of(context).colorScheme;
    final AuthViewModel authVM = Provider.of<AuthViewModel>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: size.width * 0.7,
          child: AutoSizeText(
            'Nouveau compte',
            maxLines: 1,
            style: textTheme.displayLarge,
          ),
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
            child: SizedBox(
              width: size.width * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomTextField(
                    controller: _loginController,
                    hintStyle: kBasicHintStyle(textTheme: textTheme),
                    hintText: 'Entrer un pseudo',
                    validator: (value) {
                      // TODO : check if pseudo exist in db
                      if (value!.isEmpty) {
                        return Kpseudo_error_msg;
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: kBasicVerticalPadding(size: size)),
                  CustomTextField(
                      error_msg: password_error_msg,
                      controller: _passwordController,
                      hintStyle: kBasicHintStyle(textTheme: textTheme),
                      hintText: 'Mot de passe',
                      obscureText: true,
                      validator: (value) {
                        if (passwordValidate(value)) {
                          return Kpassword_error_msg;
                        }
                        return null;
                      }),
                  SizedBox(height: kBasicVerticalPadding(size: size)),
                  CustomTextField(
                    hintStyle: kBasicHintStyle(textTheme: textTheme),
                    hintText: 'Confirmer le mot de passe',
                    obscureText: true,
                    validator: (value) {
                      if (value != _passwordController.text) {
                        return Kpassword_unmatch;
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: kBasicVerticalPadding(size: size)),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, '/terms_of_use'),
                      child: AutoSizeText(
                        "Voir les conditions d'utilisations",
                        style: textTheme.bodyText2
                            ?.copyWith(decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: size.width * 0.7,
                      child: CustomLoadingButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            authVM.isLoading = true;
                            try {
                              await appState
                                  .registerAccount(
                                    emailAddress: widget.email,
                                    login: _loginController.text,
                                    password: _passwordController.text,
                                  )
                                  .then((value) => authVM.isLoading = false);
                            } on FirebaseAuthException catch (e) {
                              setState(() {
                                password_error_msg = e.message;
                              });
                            }
                          }
                        },
                        maxWidth: size.width * 0.7,
                        text_is_loading: 'Chargement',
                        text_not_loading:
                            'Accepter les conditions d\'utilisations',
                        text_color_is_loading: themeColor.onBackground,
                        text_color_not_loading: null,
                        background_color_is_loading: themeColor.onSurface,
                        background_color_not_loading: null,
                        is_loading: authVM.isLoading,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    password_error_msg = null;
  }
}
