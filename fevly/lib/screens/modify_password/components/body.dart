import 'package:fevly/screens/modify_password/components/modify_password_form.dart';
import 'package:fevly/screens/modify_password/modify_password_screen.dart';
import 'package:fevly/screens/settings/components/custom_lite_app_bar.dart';
import 'package:flutter/material.dart';

/// Body of the [ModifyPasswordScreen]
class Body extends StatelessWidget {
  const Body({
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Column(
        children: [
          const CustomLiteAppBar(title: 'Modifier le mot de passe'),
          ModifyPasswordForm(),
        ],
      ),
    );
  }
}
