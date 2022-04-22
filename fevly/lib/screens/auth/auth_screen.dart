import 'package:fevly/screens/auth/components/body.dart';
import 'package:fevly/screens/auth/view_models/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Authentification screen
class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<AuthViewModel>(
        create: (_) => AuthViewModel(),
        child: const Body(),
      ),
    );
  }
}
