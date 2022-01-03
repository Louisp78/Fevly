import 'package:fevly/screens/signin/signin_step2/components/body.dart';
import 'package:flutter/material.dart';

class SignInStep2Screen extends StatelessWidget {
  const SignInStep2Screen({
    Key? key,
    required this.password,
    required this.email,
  }) : super(key: key);

  final String password;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        email: email,
        password: password,
      ),
    );
  }
}
