import 'package:fevly/screens/auth/components/register_form.dart';
import 'package:fevly/screens/auth/view_models/auth_view_model.dart';
import 'package:fevly/service/application_state.dart';
import 'package:flutter/material.dart';
import 'package:fevly/screens/auth/components/body.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ApplicationState appState = Provider.of<ApplicationState>(context);
    final AuthViewModel authViewModel =
        Provider.of<AuthViewModel>(context, listen: false);
    return WillPopScope(
      onWillPop: () async {
        if (!authViewModel.isLoading) {
          Navigator.of(context).pop();
        }
        return false;
      },
      child: Scaffold(
        body: Body(
            formContent: RegisterForm(
          email: appState.emailAddress!,
        )),
      ),
    );
  }
}
