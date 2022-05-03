import 'package:fevly/screens/auth/components/body.dart';
import 'package:fevly/screens/auth/components/pick_connexion_method.dart';
import 'package:flutter/material.dart';

/// Route: /auth/logged_out
class LoggedOutScreen extends StatelessWidget {
  const LoggedOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Body(
      formContent: PickConnexionMethod(),
    ));
  }
}
