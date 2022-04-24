import 'package:fevly/screens/auth/components/email_form.dart';
import 'package:fevly/screens/auth/components/pick_connexion_method.dart';
import 'package:fevly/screens/auth/components/register_form.dart';
import 'package:fevly/screens/auth/components/sign_in_form.dart';
import 'package:fevly/screens/auth/components/verify_email_screen.dart';
import 'package:fevly/service/application_state.dart';
import 'package:fevly/service/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Form multiusage depending of application state
class FormSection extends StatelessWidget {
  const FormSection();
  @override
  Widget build(BuildContext context) {
    final ApplicationState appState = Provider.of<ApplicationState>(context);

    switch (appState.loginState) {
      case ApplicationLoginState.loggedOut:
        return PickConnexionMethod();
      case ApplicationLoginState.emailAddress:
        return EmailForm();
      case ApplicationLoginState.password:
        return ChangeNotifierProvider<CustomTimer>(
          create: (context) =>
              CustomTimer(number_of_seconds: 30, reload_user: false),
          child: SignInForm(
            email: appState.emailAddress!,
          ),
        );

      case ApplicationLoginState.register:
        return RegisterForm(
          email: appState.emailAddress!,
        );
      case ApplicationLoginState.verifyEmail:
        return ChangeNotifierProvider<CustomTimer>(
            create: (context) =>
                CustomTimer(number_of_seconds: 60, reload_user: true),
            child: VerifyEmailScreen());

      default:
        return Center(
          child: Text('Error'),
        );
    }
  }
}
