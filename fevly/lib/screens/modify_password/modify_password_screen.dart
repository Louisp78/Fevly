import 'package:flutter/material.dart';
import 'package:fevly/screens/modify_password/components/body.dart';

/// Route: /profile/modify/password
/// This screen permit to modify the user's password
class ModifyPasswordScreen extends StatelessWidget {
  const ModifyPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Body(size: size),
    );
  }
}
