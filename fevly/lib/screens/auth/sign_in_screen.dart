import 'package:fevly/screens/auth/components/sign_in_form.dart';
import 'package:fevly/service/application_state.dart';
import 'package:fevly/service/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:fevly/screens/auth/components/body.dart';
import 'package:provider/provider.dart';

/// Route : /auth/logged_out/sign_in
class SignInScreen extends StatelessWidget {
  const SignInScreen();

  @override
  Widget build(BuildContext context) {
    final ApplicationState appState = Provider.of<ApplicationState>(context);
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop();
        return false;
      },
      child: Scaffold(
        body: Body(
          formContent: ChangeNotifierProvider<CustomTimer>(
            create: (context) => CustomTimer(number_of_seconds: 30),
            child: SignInForm(
              email: appState.emailAddress!,
              title: 'Connexion à',
              subtitle: appState.emailAddress!,
            ),
          ),
        ),
      ),
    );
  }
}
