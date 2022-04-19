import 'package:fevly/components/custom_text_button.dart';
import 'package:fevly/constant.dart';
import 'package:fevly/screens/auth/components/email_form.dart';
import 'package:fevly/screens/auth/components/register_form.dart';
import 'package:fevly/screens/auth/components/sign_in_form.dart';
import 'package:fevly/service/application_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormSection extends StatelessWidget {
  const FormSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ApplicationState appState = Provider.of<ApplicationState>(context);
    final Size size = MediaQuery.of(context).size;

    switch (appState.loginState) {
      case ApplicationLoginState.loggedOut:
        return Column(
          children: [
            Spacer(),
            CustomTextButton(
              press: () => appState.startLoginFlow(),
              text: 'Se connecter par email',
            ),
            SizedBox(
              height: kBasicVerticalPadding(size: size),
            ),
          ],
        );
      case ApplicationLoginState.emailAddress:
        return EmailForm(
          callback: (email) => appState.verifyEmailAddress(
              emailAddress: email, errorCallback: (e) => print(e)),
        );
      case ApplicationLoginState.password:
        return SignInForm(
          email: appState.emailAddress!,
          callback: ({required email, required password}) =>
              appState.signInWithEmailAndPassword(
                  emailAddress: email,
                  password: password,
                  errorCallback: (e) => print(e)),
        );

      case ApplicationLoginState.register:
        return RegisterForm(
          callback: ({required email, required login, required password}) {
            appState.registerAccount(
                emailAddress: email,
                login: login,
                password: password,
                errorCallback: (e) => print(e));
          },
          email: appState.emailAddress!,
        );
      default:
        return Center(
          child: Text('Error'),
        );
    }
  }
}
