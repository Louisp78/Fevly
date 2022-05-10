import 'package:fevly/components/custom_snackbar.dart';
import 'package:fevly/components/custom_text_button.dart';
import 'package:fevly/components/custom_text_field.dart';
import 'package:fevly/components/dialog/delete_account.dart';
import 'package:fevly/constant/auth_msg.dart';
import 'package:fevly/constant/constant.dart';
import 'package:fevly/constant/errors_msg.dart';
import 'package:fevly/functions/firebase_auth_exception.dart';
import 'package:fevly/screens/reauthenticate/reauthenticate_screen.dart';
import 'package:fevly/service/application_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ReauthenticateForm extends StatefulWidget {
  const ReauthenticateForm({required this.type, this.strValue});

  final ReauthenticationType type;
  final String? strValue;

  @override
  State<ReauthenticateForm> createState() => _ReauthenticateFormState();
}

class _ReauthenticateFormState extends State<ReauthenticateForm> {
  final _formkey = GlobalKey<FormState>(debugLabel: '_ReauthenticateForm');
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    final Size size = MediaQuery.of(context).size;
    final ColorScheme themeColor = Theme.of(context).colorScheme;

    final ApplicationState appState = Provider.of<ApplicationState>(context);

    String? password_error_msg;
    return SizedBox(
      width: size.width * 0.8,
      child: Column(children: [
        Text(
          'Vérification de votre identité',
          style: textTheme.displayLarge,
        ),
        SizedBox(
          height: kBasicVerticalPadding(size: size) / 2,
        ),
        Text(
          'Pour aller plus loin, vous devez vérifier votre identité.',
          style: textTheme.displayMedium!.apply(color: themeColor.primary),
        ),
        SizedBox(
          height: kBasicVerticalPadding(size: size) * 2,
        ),
        Form(
          key: _formkey,
          child: Expanded(
            child: Column(
              children: [
                if (appState.authProvider == AuthProvider.emailPassword)
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
                    obscureText: true,
                  ),
                const Spacer(),
                CustomTextButton(
                    press: () async {
                      if (_formkey.currentState!.validate()) {
                        appState
                            .reauthenticateUser(
                                onNetworkRequestFailed: () =>
                                    handleNetworkError(context),
                                onOperationNotAllowed: () =>
                                    handleOperationNotAllowed(context),
                                onTooManyRequests: () =>
                                    handleTooManyRequests(context),
                                emailAddress: user!.email!,
                                password: _passwordController.text)
                            .then((value) {
                          if (value) {
                            buildDialog(context);
                            /*buildDeleteAccountDialog(
                              context: context,
                              onRequiresRecentLogin: () => throw Exception(
                                  'Requires recent login infinite loop !'),
                            );*/
                          }
                          return value;
                        });
                      } else {
                        print('Not valid');
                        setState(() {
                          password_error_msg = 'Mot de passe invalide';
                        });
                      }
                    },
                    text: 'Suivant'),
              ],
            ),
          ),
        )
      ]),
    );
  }

  void buildDialog(BuildContext context) async {
    final TextTheme textTheme =
        GoogleFonts.quicksandTextTheme(Theme.of(context).textTheme);
    final Size size = MediaQuery.of(context).size;
    final ColorScheme themeColor = Theme.of(context).colorScheme;
    final appState = Provider.of<ApplicationState>(context, listen: false);
    switch (widget.type) {
      case ReauthenticationType.deleteAccount:
        await appState.deleteUser(
          onNetworkRequestFailed: () => handleNetworkError(context),
          onOperationNotAllowed: () => handleOperationNotAllowed(context),
          onTooManyRequests: () => handleTooManyRequests(context),
          onSucess: () => Navigator.pushNamedAndRemoveUntil(
            context,
            '/',
            (Route<dynamic> route) => false,
          ),
          onRequiresRecentLogin: () => throw Exception(
            'Requires recent login infinite loop !',
          ),
        );
        break;
      case ReauthenticationType.changePassword:
        await appState.updatePassword(
            newPassword: widget.strValue!,
            onNetworkRequestFailed: () => handleNetworkError(context),
            onOperationNotAllowed: () => handleOperationNotAllowed(context),
            onTooManyRequests: () => handleTooManyRequests(context),
            onRequiresRecentLogin: () =>
                throw Exception('Requires recent login infinite loop !'),
            onSuccess: () {
              ScaffoldMessenger.of(context).showSnackBar(
                buildCustomSnackBar(
                  themeColor: themeColor,
                  textTheme: textTheme,
                  size: size,
                  text: kPasswordUpdateSuccess,
                ),
              );
              Navigator.popUntil(
                  context, ModalRoute.withName('/profile/modify'));
            });
        break;
      case ReauthenticationType.changeEmail:
        print('updating email adress ! ');
        await appState.updateEmailAddress(
          onNetworkRequestFailed: () => handleNetworkError(context),
          onOperationNotAllowed: () => handleOperationNotAllowed(context),
          onTooManyRequests: () => handleTooManyRequests(context),
          newEmailAddress: widget.strValue!,
          onRequiresRecentLogin: () =>
              throw Exception('Requires recent login infinite loop !'),
          onEmailAlreadyInUse: () => ScaffoldMessenger.of(context).showSnackBar(
            buildCustomSnackBar(
              themeColor: themeColor,
              textTheme: textTheme,
              size: size,
              text: kEmailAlreadyInUse,
            ),
          ),

          onSuccess: () async {
            ScaffoldMessenger.of(context).showSnackBar(
              buildCustomSnackBar(
                themeColor: themeColor,
                textTheme: textTheme,
                size: size,
                text: kEmailValidateToContinue(newEmail: widget.strValue),
              ),
            );
            await FirebaseAuth.instance.currentUser!.sendEmailVerification();
            await Navigator.pushNamedAndRemoveUntil(
                context, '/', (route) => false);
          }, // TODO: show toast
        );
        break;
      case ReauthenticationType.changePhoneNumber:
        // TODO: Implement
        /*await appState.updatePhoneNumber(
          newPhoneNumber: widget.strValue!,
          onRequiresRecentLogin: () =>
              throw Exception('Requires recent login infinite loop !'),
          onPhoneNumberAlreadyInUse: () =>
              print('Phone number already in use'), // TODO: Show toast,
          onSucess: () => Navigator.pop(context), // TODO: show toast
        );*/
        break;
    }
  }
}
