import 'package:fevly/screens/auth/components/body.dart';
import 'package:flutter/material.dart';

/// Authentification screen
class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
