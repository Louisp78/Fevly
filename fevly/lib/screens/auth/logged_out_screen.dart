import 'package:fevly/screens/auth/components/body.dart';
import 'package:fevly/screens/auth/components/pick_connexion_method.dart';
import 'package:fevly/service/application_state.dart';
import 'package:flutter/material.dart';

/// Route: /
/// This screen is build when [ApplicationState.loginState] is [ApplicationLoginState.loggedOut]
class LoggedOutScreen extends StatelessWidget {
  const LoggedOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
          body: Body(
        formContent: PickConnexionMethod(),
      )),
    );
  }
}
