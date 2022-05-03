import 'package:fevly/components/custom_loading_button.dart';
import 'package:fevly/components/custom_small_button.dart';
import 'package:fevly/components/custom_text_field.dart';
import 'package:fevly/constant.dart';
import 'package:fevly/errors_msg.dart';
import 'package:fevly/functions/firebase_auth_exception.dart';
import 'package:fevly/screens/auth/view_models/auth_view_model.dart';
import 'package:fevly/service/application_state.dart';
import 'package:fevly/service/custom_timer.dart';
import 'package:fevly/styles/colors.dart';
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
    return SizedBox(
      width: size.width * 0.8,
      child: Column(
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
            style: textTheme.displayMedium!.apply(color: themeColor.primary),
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
                      label_text: 'Mot de passe',
                      hintText: 'Entrer un mot de passe',
                      textInputType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return Kpassword_empty_error_msg;
                        }
                        return null;
                      },
                      obscureText: true),
                  SizedBox(height: kBasicVerticalPadding(size: size)),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Consumer<CustomTimer>(
                        builder: (context, customTimer, _) {
                      return CustomSmallButton(
                        buttonSize: CustomSmallButtonSize.small,
                        borderColor:
                            customTimer.timerState == TimerState.running
                                ? themeColor.onSurface
                                : kTextColor,
                        borderWidth: 2,
                        press: () async {
                          if (customTimer.timerState == TimerState.stopped) {
                            customTimer.startTimer();
                            await appState.resetEmailAddress(
                                email: widget.email);
                          }
                        },
                        text: customTimer.timerState == TimerState.running
                            ? "Email envoyé : ${customTimer.counter.inSeconds}s"
                            : 'Mot de passe oublié ?',
                      );
                    }),
                  ),
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
                                .then((value) => buildRoute(
                                    context: context,
                                    loginState: appState.loginState));
                          } on FirebaseAuthException catch (e) {
                            print('FirebaseAuthException : ${e.code}');
                            setState(() {
                              password_error_msg = handleFireSignInException(
                                  code: e.code, context: context);
                            });
                            authVM.isLoading = false;
                          }
                        }
                      },
                      text_not_loading: 'Suivant',
                      text_color_is_loading: themeColor.onBackground,
                      background_color_is_loading: themeColor.onSurface,
                      is_loading: authVM.isLoading,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void buildRoute(
      {required BuildContext context,
      required ApplicationLoginState loginState}) {
    switch (loginState) {
      case ApplicationLoginState.loggedIn:
        Navigator.pushNamedAndRemoveUntil(
            context, '/dashboard', (route) => false);
        break;
      case ApplicationLoginState.verifyEmail:
        Navigator.pushReplacementNamed(
            context, '/auth/logged_out/verify_email');
        break;
      default:
        throw Exception('Unexpected login state : $loginState');
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    password_error_msg = null;
  }
}
