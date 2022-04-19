import 'package:fevly/components/custom_text_button.dart';
import 'package:fevly/service/application_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ApplicationState appState = Provider.of<ApplicationState>(context);
    return Scaffold(
      body: Center(
        child: CustomTextButton(
          press: () async {
            appState.signOut();
            Navigator.popAndPushNamed(context, '/');
          },
          text: 'Sign Out',
        ),
      ),
    );
  }
}
