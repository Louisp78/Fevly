import 'package:fevly/components/custom_text_button.dart';
import 'package:fevly/service/application_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  const Body();

  @override
  Widget build(BuildContext context) {
    final ApplicationState appState = Provider.of<ApplicationState>(context);
    return Center(
      child: CustomTextButton(
        press: () async {
          appState.signOut();
          Navigator.popAndPushNamed(context, '/');
        },
        text: 'Sign Out',
      ),
    );
  }
}
