import 'package:fevly/components/custom_loading_button.dart';
import 'package:fevly/components/custom_small_button.dart';
import 'package:fevly/components/custom_text_field.dart';
import 'package:fevly/constant/constant.dart';
import 'package:fevly/constant/errors_msg.dart';
import 'package:fevly/functions/firebase_auth_exception.dart';
import 'package:fevly/screens/auth/view_models/auth_view_model.dart';
import 'package:fevly/service/application_state.dart';
import 'package:fevly/service/custom_timer.dart';
import 'package:fevly/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

/// Form for sign in
class SignInForm extends StatefulWidget {
  const SignInForm({
    required this.title,
    required this.email,
    required this.subtitle,
  });

  final String email;
  final String title;
  final String subtitle;

  @override
  State<SignInForm> createState() => _SignInForm();
}

class _SignInForm extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_SignInFormState');
  final _passwordController = TextEditingController();

  String? passwordErrorMsg;

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
        children: [
          Text(
            widget.title,
            style: textTheme.displayLarge,
          ),
          SizedBox(
            height: kBasicVerticalPadding(size: size) / 2,
          ),
          Text(
            widget.subtitle,
            style: textTheme.displayMedium!.apply(color: themeColor.primary),
          ),
          SizedBox(
            height: kBasicVerticalPadding(size: size) * 2,
          ),
          Form(
            key: _formKey,
            child: Expanded(
              child: Column(
                children: [
                  CustomTextField(
                      error_msg: passwordErrorMsg,
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
                            await appState.sendPasswordReset(
                              onNetworkRequestFailed: () =>
                                  handleNetworkError(context),
                              onOperationNotAllowed: () =>
                                  handleOperationNotAllowed(context),
                              onTooManyRequests: () =>
                                  handleTooManyRequests(context),
                              email: widget.email,
                            );
                          }
                        },
                        text: customTimer.timerState == TimerState.running
                            ? "Email envoyé : ${customTimer.counter.inSeconds}s"
                            : 'Mot de passe oublié ?',
                      );
                    }),
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomLoadingButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          authVM.isLoading = true;
                          await appState
                              .signInWithEmailAndPassword(
                                emailAddress: widget.email,
                                password: _passwordController.text,
                                onNetworkRequestFailed: () {
                                  handleNetworkError(context);
                                  setState(() => passwordErrorMsg = '');
                                },
                                onTooManyRequests: () => setState(() =>
                                    passwordErrorMsg =
                                        Ktoo_many_requests_error_msg),
                                onOperationNotAllowed: () => setState(() =>
                                    passwordErrorMsg = Koperation_not_allowed),
                                onWrongPassword: () => setState(() =>
                                    passwordErrorMsg =
                                        Kwrong_password_error_msg),
                              )
                              .then((value) => authVM.isLoading = false)
                              .then((value) => buildRoute(
                                  context: context,
                                  loginState: appState.loginState));
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

  Future<void> buildRoute(
      {required BuildContext context,
      required ApplicationLoginState loginState}) async {
    final appState = Provider.of<ApplicationState>(context, listen: false);
    switch (loginState) {
      case ApplicationLoginState.loggedIn:
        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        break;
      case ApplicationLoginState.verifyEmail:
        await appState.sendEmailVerification(
          onNetworkRequestFailed: () => handleNetworkError(context),
          onTooManyRequests: () {}, // To many request to send email
          onOperationNotAllowed: () => handleOperationNotAllowed(context),
          onSuccess: () =>
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false),
        );
        break;
      default:
        break;
      //throw Exception('Unexpected login state : $loginState');
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    passwordErrorMsg = null;
  }
}
