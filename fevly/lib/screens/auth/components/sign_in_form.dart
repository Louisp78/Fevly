import 'package:fevly/components/custom_loading_button.dart';
import 'package:fevly/components/custom_text_button.dart';
import 'package:fevly/components/custom_text_field.dart';
import 'package:fevly/constant.dart';
import 'package:fevly/errors_msg.dart';
import 'package:fevly/screens/auth/view_models/auth_view_model.dart';
import 'package:fevly/service/application_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

/// Form for sign in
class SignInForm extends StatefulWidget {
  const SignInForm({
    required this.email,
  });

  final String email;

  @override
  State<SignInForm> createState() => _SignInForm();
}

class _SignInForm extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_SignInFormState');
  final _passwordController = TextEditingController();

  String? password_error_msg;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    final Size size = MediaQuery.of(context).size;
    final ColorScheme themeColor = Theme.of(context).colorScheme;
    final ApplicationState appState = Provider.of<ApplicationState>(context);
    final AuthViewModel authVM = Provider.of<AuthViewModel>(context);
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
                    error_msg: password_error_msg,
                    controller: _passwordController,
                    hintStyle: kBasicHintStyle(textTheme: textTheme),
                    hintText: 'Mot de passe',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return Kpassword_error_msg;
                      }
                      return null;
                    },
                    obscureText: true),
                Spacer(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomLoadingButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        authVM.isLoading = true;
                        try {
                          await appState
                              .signInWithEmailAndPassword(
                                  emailAddress: widget.email,
                                  password: _passwordController.text)
                              .then((value) => setState(() {
                                    password_error_msg = null;
                                  }))
                              .then((value) => authVM.isLoading = false);
                        } on FirebaseAuthException catch (e) {
                          setState(() {
                            password_error_msg = e.message;
                          });
                        }
                      }
                    },
                    text_is_loading: 'Chargement',
                    text_not_loading: 'Suivant',
                    text_color_is_loading: themeColor.onBackground,
                    text_color_not_loading: null,
                    background_color_is_loading: themeColor.onSurface,
                    background_color_not_loading: null,
                    is_loading: authVM.isLoading,
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
