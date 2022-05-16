import 'package:fevly/screens/settings/components/body.dart';
import 'package:flutter/material.dart';

/// Route: /settings
/// This screen permit to change the app's settings
/// but also to :
/// - logout the user (using [ApplicationState.logout()])
/// - delete the user's account (ApplicationState.deleteUser())
/// - read conditions of use
/// - read privacy policy
/// - read terms of use
/// - report bugs
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
