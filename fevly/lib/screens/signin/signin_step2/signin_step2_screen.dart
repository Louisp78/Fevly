import 'package:flutter/material.dart';
import 'components/body.dart';

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
